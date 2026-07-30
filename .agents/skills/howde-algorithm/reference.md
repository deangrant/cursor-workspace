# HoWDe Reference

## Stop-location detection (prerequisite)

HoWDe operates on **stops** (user, location ID, start timestamp, end timestamp). Raw GPS or trajectory data must be converted to stops first.

### What stop detection does

1. Identify **stationary events**: segments of the trajectory where the user stays in a small area for a minimum duration.
2. **Cluster** those events in space so that revisits to the same place get the same location ID.

The HoWDe paper and benchmark use stops produced by **InfoStop** (Aslak & Alessandretti), which uses temporal median reduction and flow-based spatial clustering (Infomap).

### InfoStop (Python)

- **Install**: `pip install infostop`
- **Input**: NumPy array of shape `(N, 2)` (lat, lon) or `(N, 3)` (lat, lon, Unix timestamp). For multiple users, pass a **list** of such arrays (one per user/trace); InfoStop then finds stop locations shared across traces.
- **Call**: `from infostop import Infostop; model = Infostop(); labels = model.fit_predict(data)`. `labels` is an array of stop IDs per point; `-1` denotes non-stop (e.g. moving/transit).
- **Docs**: [infostop.readthedocs.io](https://infostop.readthedocs.io/), [GitHub ulfaslak/infostop](https://github.com/ulfaslak/infostop), [arXiv:2003.14370](https://arxiv.org/pdf/2003.14370.pdf).

### Converting InfoStop output to HoWDe input

From point-level data with labels:

1. Group **consecutive** points with the same (user, label), ignoring label `-1`.
2. For each group, set `loc` = label, `start` = min(timestamp), `end` = max(timestamp). One row per stay.
3. Build a table with columns `useruuid`, `loc`, `start`, `end` (and optional `tz_hour_start`, `tz_minute_start`, `country`). This is the HoWDe input schema. Drop or filter rows with `loc == -1` if you want; HoWDe convention is to exclude them.

Example (single user, point list with timestamps):

```python
# data = (N, 3) array: lat, lon, timestamp
# labels = model.fit_predict(data)
# Build stops: group consecutive same label, take min/max time per group
import numpy as np
stops = []
i = 0
while i < len(labels):
    if labels[i] == -1:
        i += 1
        continue
    loc = labels[i]
    start = data[i, 2]
    while i < len(labels) and labels[i] == loc:
        i += 1
    end = data[i - 1, 2]
    stops.append({"useruuid": user_id, "loc": loc, "start": start, "end": end})
# Then convert to PySpark DataFrame for HoWDe_labelling
```

### Rust

There is no official InfoStop crate. To get stops in Rust you can: (1) reimplement stop detection (e.g. temporal median of stationary segments + spatial clustering per the InfoStop paper), or (2) run InfoStop in Python, export stops to CSV/Parquet, and consume them in a Rust HoWDe implementation.

---

## Algorithm Workflow (Paper Section 5)

1. **Input**: Sequence of stops per user. Each stop: user ID, location ID (`loc`), start and end timestamps (Unix). Optional: timezone offset, country.

2. **Hourly aggregation**: For each calendar day, aggregate stops into 24 hourly bins (0–23 local). In each bin, assign the **location where the user spent the most time**. All fractions later use as denominator only the bins that have at least one record (not all 24).

3. **Day filter**: For home, consider only night bins (00:00–06:00); for work, only business bins (09:00–16:00) on weekdays. Drop a day for home (or work) if the fraction of those bins with data is below `C_hours` (e.g. 0.4). A day can be retained for one of home/work but not the other.

4. **Per-day fractions**: For each retained day, compute:
   - **Home**: fraction of night bins (that have data) spent at each location.
   - **Work**: fraction of business-hour bins (that have data) spent at each location.

5. **Sliding window**: For each day `t`, take a window of size `ΔT + 1` days. Default: centered `t ± ΔT/2`. Option: past-only window `t - ΔT` to `t` (configurable in Python via `edit_config_default`). For work, the window uses **weekdays only** when counting days.

6. **Window-level stats**: Within each window:
   - **Home**: average (over days in window) of the per-day fraction of night bins at each location.
   - **Work**: average fraction of business-hour bins at each location; and **fraction of days** (with data) on which the location was visited at least once in business hours.

7. **Coverage filter**: Require minimum fraction of days with data in the window: `C_days,H` (home), `C_days,W` (work). If below threshold, mark home or work as **undetected** for that day.

8. **Location filters**: Keep only locations that meet:
   - **Home**: average fraction of night bins ≥ `f_hours,H`.
   - **Work**: average fraction of business bins ≥ `f_hours,W` **and** fraction of days visited ≥ `f_days,W`.

9. **Sorting and assignment**:
   - **Home**: sort candidates by (typical) fraction of hourly bins the location is visited within a day; assign the **top** as home.
   - **Work**: sort by **fraction of days** the location is visited in the window; if no location can be chosen by that, use fraction of hourly bins; assign the **top** as work.

---

## Python API

### Function

```python
from howde import HoWDe_labelling

HoWDe_labelling(
    input_data,                    # PySpark DataFrame
    edit_config_default=None,      # optional dict, see below
    range_window_home=28,
    range_window_work=42,
    C_hours=0.4,
    C_days_H=0.4,
    C_days_W=0.5,
    f_hours_H=0.7,
    f_hours_W=0.4,
    f_days_W=0.6,
    output_format="stop",          # "stop" | "change"
    verbose=False,
)
```

### Input schema

| Column | Type | Description |
|--------|------|-------------|
| `useruuid` | str or int | Unique user identifier |
| `loc` | str or int | Stop location ID; avoid `-1` (dropped per Infostop convention) |
| `start` | long | Start time (Unix timestamp) |
| `end` | long | End time (Unix timestamp) |
| `tz_hour_start` | int | Optional. Timezone offset hours |
| `tz_minute_start` | int | Optional. Timezone offset minutes |
| `country` | str | Optional; default `"GL0B"` |

### edit_config_default (optional)

Dictionary to override defaults in `howde/config.py`:

- **`is_time_local`**: `True` = timestamps are local time; `False` = UTC.
- **`min_stop_t`**: minimum stop duration (seconds).
- **`start_hour_day`, `end_hour_day`**: hour range for **home** (default night window).
- **`start_hour_work`, `end_hour_work`**: hour range for **work** (default business window).
- **`data_for_predict`**: use only past data in the window (e.g. past-only window).

### Output

- **Single config**: PySpark DataFrame with original columns plus:
  - `detect_H_loc`: detected home location ID (or null).
  - `detect_W_loc`: detected work location ID (or null).
  - `location_type`: `'H'`, `'W'`, or `'O'`.

- **Multiple configs** (parameters passed as lists): Returns a **list of dicts**, each with:
  - `configs`: the parameter set used.
  - `res`: the labeled PySpark DataFrame for that config.

### output_format

- `"stop"`: one row per stop with `location_type` and day-level `detect_H_loc` / `detect_W_loc`.
- `"change"`: compact DataFrame with one row per day where home/work assignment is present or changes.

### Links

- [HoWDe tutorials](https://github.com/LLucchini/HoWDe/tree/main/tutorials)
- [PyPI howde](https://pypi.org/project/howde/)
- [GitHub LLucchini/HoWDe](https://github.com/LLucchini/HoWDe)

---

## Rust Implementation Guide

No official HoWDe crate exists. The code below implements the same algorithm as the paper (Section 5) and the Python package, for validation and parity. Align with Supplementary S-8 (pseudocode) when validating. The core implementation and entry point `howde_label` are in the [Core implementation](#core-implementation) subsection.

### Data model

**Input (per stop)**:

```rust
use chrono::{NaiveDate, NaiveDateTime, Utc, Timelike, Datelike};

#[derive(Clone)]
struct Stop {
    user_id: String,
    loc_id: String,   // avoid "-1" (InfoStop non-stop)
    start_ts: i64,    // Unix timestamp
    end_ts: i64,
    // Optional: tz_offset_secs: i32, country: String
}
```

**Output (per user per day)**:

```rust
struct HowdeResult {
    user_id: String,
    date: NaiveDate,
    home_loc: Option<String>,
    work_loc: Option<String>,
}
```

### Parameters struct

```rust
struct HowdeParams {
    range_window_home: u32,
    range_window_work: u32,
    c_hours: f64,
    c_days_h: f64,
    c_days_w: f64,
    f_hours_h: f64,
    f_hours_w: f64,
    f_days_w: f64,
}

impl Default for HowdeParams {
    fn default() -> Self {
        Self {
            range_window_home: 28,
            range_window_work: 42,
            c_hours: 0.4,
            c_days_h: 0.4,
            c_days_w: 0.5,
            f_hours_h: 0.7,
            f_hours_w: 0.4,
            f_days_w: 0.6,
        }
    }
}
```

### Core implementation

The following functions implement the algorithm workflow. For a real project, this can live in a `howde.rs` module or crate; `chrono` is the only dependency required.

```rust
use std::collections::{HashMap, BTreeSet};

const NIGHT_START: u32 = 0;
const NIGHT_END: u32 = 6;       // bins 0..5 (6 bins)
const BUSINESS_START: u32 = 9;
const BUSINESS_END: u32 = 17;  // bins 9..16 (8 bins)

/// Group stops by user_id and sort by start_ts.
fn group_stops_by_user(stops: &[Stop]) -> HashMap<String, Vec<Stop>> {
    let mut by_user: HashMap<String, Vec<Stop>> = HashMap::new();
    for s in stops {
        by_user.entry(s.user_id.clone()).or_default().push(s.clone());
    }
    for v in by_user.values_mut() {
        v.sort_by_key(|s| s.start_ts);
    }
    by_user
}

/// For one user's stops, build per-day hourly bins: for each (date, hour), the location
/// with max duration in that hour. Assumes UTC; add tz offset to start_ts/end_ts if needed.
fn build_hourly_bins_for_user(stops: &[Stop]) -> HashMap<NaiveDate, [Option<String>; 24]> {
    let mut day_bins: HashMap<NaiveDate, HashMap<u32, HashMap<String, i64>>> = HashMap::new();
    for s in stops {
        let start = NaiveDateTime::from_timestamp_opt(s.start_ts, 0).unwrap_or_default();
        let end = NaiveDateTime::from_timestamp_opt(s.end_ts, 0).unwrap_or_default();
        let mut t = start;
        while t <= end {
            let hour = t.hour();
            let date = t.date();
            let next_hour = t + chrono::Duration::hours(1);
            let segment_end = next_hour.min(end);
            let dur = (segment_end - t).num_seconds();
            day_bins
                .entry(date)
                .or_default()
                .entry(hour)
                .or_default()
                .entry(s.loc_id.clone())
                .and_modify(|d| *d += dur)
                .or_insert(dur);
            t = next_hour;
        }
    }
    let mut result = HashMap::new();
    for (date, by_hour) in day_bins {
        let mut bins: [Option<String>; 24] = [None; 24];
        for (hour, loc_durations) in by_hour {
            let best = loc_durations.iter().max_by_key(|(_, &d)| d).map(|(l, _)| l.clone());
            bins[hour as usize] = best;
        }
        result.insert(date, bins);
    }
    result
}
```

Note: `chrono::Duration::hours(1)` and `NaiveDateTime::from_timestamp_opt` are from `chrono`; use `chrono::TimeDelta::hours(1)` if on chrono 0.4.x with the `oldtime` feature, or `Duration::seconds(3600)`.

**Day filter**: retain a day for home if at least `c_hours` fraction of night bins (0..6) have data; for work if at least `c_hours` of business bins (9..16) have data and the day is a weekday.

```rust
fn is_weekday(d: NaiveDate) -> bool {
    d.weekday() != chrono::Weekday::Sat && d.weekday() != chrono::Weekday::Sun
}

fn day_passes_home_filter(bins: &[Option<String>; 24], c_hours: f64) -> bool {
    let with_data = (NIGHT_START..NIGHT_END).filter(|&h| bins[h as usize].is_some()).count();
    (with_data as f64 / (NIGHT_END - NIGHT_START) as f64) >= c_hours
}

fn day_passes_work_filter(bins: &[Option<String>; 24], date: NaiveDate, c_hours: f64) -> bool {
    if !is_weekday(date) {
        return false;
    }
    let with_data = (BUSINESS_START..BUSINESS_END).filter(|&h| bins[h as usize].is_some()).count();
    (with_data as f64 / (BUSINESS_END - BUSINESS_START) as f64) >= c_hours
}
```

**Sliding window and window-level stats**: for each day `t`, form the window `[t - ΔT/2, t + ΔT/2]` (for work count only weekdays). Then compute per-location average fraction of night bins (home) and average fraction of business bins plus fraction of days visited (work).

```rust
fn window_days_centered(t: NaiveDate, delta: u32) -> impl Iterator<Item = NaiveDate> {
    let half = delta / 2;
    (0..=delta).filter_map(move |i| {
        let offset = i as i64 - half as i64;
        t.checked_add_signed(chrono::Duration::days(offset))
    })
}

/// Coverage: (days with data in window) / (days in window) >= c_days.
fn coverage_ok(dates_with_data: &BTreeSet<NaiveDate>, window_dates: &[NaiveDate], c_days: f64) -> bool {
    if window_dates.is_empty() {
        return false;
    }
    let with_data = window_dates.iter().filter(|d| dates_with_data.contains(d)).count();
    (with_data as f64 / window_dates.len() as f64) >= c_days
}
```

**Location filters and assignment**: keep home candidates with average fraction of night bins ≥ `f_hours_h`; work candidates with average fraction of business bins ≥ `f_hours_w` and fraction of days visited ≥ `f_days_w`. Assign home = argmax by fraction of hourly bins; work = argmax by fraction of days, then by fraction of hourly bins.

```rust
fn assign_home(candidates: &[(String, f64)], f_hours_h: f64) -> Option<String> {
    let above: Vec<_> = candidates.iter().filter(|(_, f)| *f >= f_hours_h).collect();
    above.into_iter().max_by(|(_, a), (_, b)| a.partial_cmp(b).unwrap()).map(|(l, _)| l.clone())
}

fn assign_work(candidates: &[(String, f64, f64)], f_hours_w: f64, f_days_w: f64) -> Option<String> {
    let above: Vec<_> = candidates
        .iter()
        .filter(|(_, frac_hours, frac_days)| *frac_hours >= f_hours_w && *frac_days >= f_days_w)
        .collect();
    above
        .iter()
        .max_by(|(_, _, d1), (_, _, d2)| d1.partial_cmp(d2).unwrap())
        .or_else(|| above.iter().max_by(|(_, h1, _), (_, h2, _)| h1.partial_cmp(h2).unwrap()))
        .map(|(l, _, _)| l.clone())
}
```

**Entry point**: group by user, build hourly bins per user, then for each user and each day in the user's date range apply sliding window, coverage, location filters, and assignment.

```rust
/// Run HoWDe on a slice of stops; returns one result per (user, day) with data in range.
pub fn howde_label(stops: &[Stop], params: &HowdeParams) -> Vec<HowdeResult> {
    let by_user = group_stops_by_user(stops);
    let mut results = Vec::new();
    for (user_id, user_stops) in by_user {
        let day_bins = build_hourly_bins_for_user(&user_stops);
        let dates_sorted: Vec<NaiveDate> = {
            let mut d: Vec<_> = day_bins.keys().copied().collect();
            d.sort();
            d
        };
        for &t in &dates_sorted {
            let window_home: Vec<NaiveDate> = window_days_centered(t, params.range_window_home).collect();
            let window_work: Vec<NaiveDate> = window_days_centered(t, params.range_window_work)
                .filter(|&d| is_weekday(d))
                .collect();
            let dates_with_data_home: BTreeSet<_> = window_home.iter().copied().filter(|&d| day_bins.contains_key(&d)).collect();
            let dates_with_data_work: BTreeSet<_> = window_work.iter().copied().filter(|&d| day_bins.contains_key(&d)).collect();
            if !coverage_ok(&dates_with_data_home, &window_home, params.c_days_h)
                && !coverage_ok(&dates_with_data_work, &window_work, params.c_days_w)
            {
                continue;
            }
            let home_loc = if coverage_ok(&dates_with_data_home, &window_home, params.c_days_h) {
                let mut loc_frac: HashMap<String, Vec<f64>> = HashMap::new();
                for &d in &window_home {
                    if let Some(bins) = day_bins.get(&d) {
                        if day_passes_home_filter(bins, params.c_hours) {
                            let total = (NIGHT_START..NIGHT_END).filter(|&h| bins[h as usize].is_some()).count() as f64;
                            if total > 0.0 {
                                let mut loc_count: HashMap<String, u32> = HashMap::new();
                                for h in NIGHT_START..NIGHT_END {
                                    if let Some(ref loc) = bins[h as usize] {
                                        *loc_count.entry(loc.clone()).or_insert(0) += 1;
                                    }
                                }
                                for (loc, count) in loc_count {
                                    loc_frac.entry(loc).or_default().push(count as f64 / total);
                                }
                            }
                        }
                    }
                }
                let candidates: Vec<(String, f64)> = loc_frac
                    .into_iter()
                    .map(|(loc, fracs)| (loc, fracs.iter().sum::<f64>() / fracs.len().max(1) as f64))
                    .collect();
                assign_home(&candidates, params.f_hours_h)
            } else {
                None
            };
            let work_loc = if coverage_ok(&dates_with_data_work, &window_work, params.c_days_w) {
                let mut loc_stats: HashMap<String, (Vec<f64>, usize)> = HashMap::new(); // (per-day fraction of business bins, days visited)
                let days_with_data = window_work.iter().filter(|&d| day_bins.get(d).map(|b| day_passes_work_filter(b, *d, params.c_hours)).unwrap_or(false)).count() as f64;
                for &d in &window_work {
                    if let Some(bins) = day_bins.get(&d) {
                        if day_passes_work_filter(bins, d, params.c_hours) {
                            let total = (BUSINESS_START..BUSINESS_END).filter(|&h| bins[h as usize].is_some()).count() as f64;
                            if total > 0.0 {
                                let mut loc_count: HashMap<String, u32> = HashMap::new();
                                for h in BUSINESS_START..BUSINESS_END {
                                    if let Some(ref loc) = bins[h as usize] {
                                        *loc_count.entry(loc.clone()).or_insert(0) += 1;
                                    }
                                }
                                for (loc, count) in loc_count {
                                    let frac = count as f64 / total;
                                    let entry = loc_stats.entry(loc).or_insert((Vec::new(), 0));
                                    entry.0.push(frac);
                                    entry.1 += 1;
                                }
                            }
                        }
                    }
                }
                let candidates: Vec<(String, f64, f64)> = loc_stats
                    .into_iter()
                    .map(|(loc, (fracs, days_visited))| {
                        let frac_hours = fracs.iter().sum::<f64>() / fracs.len().max(1) as f64;
                        let frac_days = days_visited as f64 / days_with_data.max(1.0);
                        (loc, frac_hours, frac_days)
                    })
                    .collect();
                assign_work(&candidates, params.f_hours_w, params.f_days_w)
            } else {
                None
            };
            results.push(HowdeResult {
                user_id: user_id.clone(),
                date: t,
                home_loc,
                work_loc,
            });
        }
    }
    results
}
```

**Usage** (same as in SKILL.md quick start):

```rust
let stops: Vec<Stop> = load_stops_from_csv("stops.csv")?;
let params = HowdeParams::default();
let results = howde_label(&stops, &params);
for r in &results {
    println!("{} {} home={:?} work={:?}", r.user_id, r.date, r.home_loc, r.work_loc);
}
```

### Implementation steps (checklist)

1. **Group by user**: Partition stops by `user_id`.
2. **Local time**: Convert `start_ts`/`end_ts` to local date and hour using timezone (or assume UTC).
3. **Hourly bins**: For each user-day, build 24 bins; for each bin, sum duration per location and keep the location with max duration. Night bins = 0..6; business bins = 9..16 (weekdays only).
4. **Day filter**: Drop days where (night bins with data) / 6 < `c_hours` for home, or (business bins with data) / 8 < `c_hours` for work (6 and 8 are bin counts in the fixed windows).
5. **Sliding window**: For each day `t`, form window `t - ΔT/2 ..= t + ΔT/2` (or past-only). For work, count only weekdays in the window.
6. **Window stats**: Per location, compute average fraction of night bins (home) and average fraction of business bins (work); for work also fraction of days (with data) the location was visited in business hours.
7. **Coverage**: If (days with data in window) / (days in window) < `c_days_h` or `c_days_w`, mark home/work undetected.
8. **Filters**: Keep locations with avg fraction ≥ `f_hours_h` (home) or ≥ `f_hours_w` and day fraction ≥ `f_days_w` (work).
9. **Sort and assign**: Home = top by fraction of hourly bins; Work = top by fraction of days, then by fraction of hourly bins if needed.

### Validation

- Benchmark datasets (stop sequences + ground truth labels): [DTU.28846325](https://doi.org/10.11583/DTU.28846325).
- Paper metrics: “detected accuracy” (correct among detected) and “fraction not detected” (Section 3.3).

---

## Links

| Resource | URL |
|----------|-----|
| Paper | https://arxiv.org/html/2506.20679v2 |
| Python (GitHub) | https://github.com/LLucchini/HoWDe |
| Python (PyPI) | https://pypi.org/project/howde/ |
| InfoStop (Python) | https://github.com/ulfaslak/infostop |
| InfoStop paper | https://arxiv.org/pdf/2003.14370.pdf |
| Benchmark data | https://doi.org/10.11583/DTU.28846325 |
