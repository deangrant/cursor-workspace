---
name: howde-algorithm
description: Guides application of the HoWDe (Home and Work location Detection) algorithm from stop-location or mobility data. Use when detecting home/work locations from GPS or stop sequences, running stop-location detection (e.g. InfoStop) as a prerequisite, implementing HoWDe in Python or Rust, tuning HoWDe parameters, or working with human mobility preprocessing pipelines.
---

# HoWDe: Home and Work location Detection

When to use this skill: home/work detection from stop data, stop-location detection (e.g. InfoStop) before HoWDe, HoWDe parameter tuning, Python or Rust implementation, mobility preprocessing pipelines, commuting or employment analysis from location data.

## What HoWDe Is

HoWDe is a validated algorithm for detecting individuals' **home** and **work** locations from timestamped **stop-location** sequences (e.g. from smartphone GPS after stop detection). Validated on ground truth from 5,099 individuals across 68+ countries: up to ~97% home and ~88% work detection accuracy. It handles missing data via **proportion-of-time** (fractions over bins with data) and **coverage filters**, and supports a sliding window to capture residential or job changes over time.

- **Input**: Stop-level data—user ID, location ID, start/end timestamps per stop.
- **Output**: Home and work location IDs per user per day (or per stop, with a type label).
- **Reference**: [HoWDe paper](https://arxiv.org/html/2506.20679v2) (Section 5: workflow; Section 4: time windows).

## Prerequisite: Stop-location detection

HoWDe expects **stop-level** data (stays at a location with start/end times), not raw GPS points. If you have raw trajectory data (timestamped lat/lon), you must first run **stop-location detection** to produce (user, location ID, start, end) per stop.

- **Python**: Use [InfoStop](https://github.com/ulfaslak/infostop) (same research line as the HoWDe paper): `pip install infostop`; feed (lat, lon) or (lat, lon, timestamp) traces; `fit_predict()` returns a stop label per point. Convert point-level labels into stays (group consecutive same-label points, take min start and max end per group) to get the `useruuid`, `loc`, `start`, `end` table HoWDe needs. InfoStop uses `-1` for non-stop (e.g. transit); HoWDe drops `loc == -1`.
- **Rust**: No official InfoStop crate. Options: implement spatiotemporal stop detection and clustering from the [InfoStop paper](https://arxiv.org/pdf/2003.14370.pdf), or run InfoStop in Python and export stops for a Rust HoWDe pipeline.

Full pipeline (stop detection → HoWDe input format) and links: [reference.md](reference.md#stop-location-detection-prerequisite).

## Time Windows (fixed in algorithm)

- **Home**: midnight–06:00 local, all days.
- **Work**: 09:00–16:00 local, **weekdays only**.

## Python Quick Start

**Install**: Ensure PySpark and Java are configured, then:

```bash
pip install HoWDe
```

**Input**: PySpark DataFrame with columns:

| Column | Type | Description |
|--------|------|-------------|
| `useruuid` | str or int | Unique user identifier |
| `loc` | str or int | Stop location ID (unique per user). Avoid `-1` (Infostop convention: dropped) |
| `start` | long | Start time of stop (Unix timestamp) |
| `end` | long | End time of stop (Unix timestamp) |
| `tz_hour_start`, `tz_minute_start` | int | Optional. Timezone offset for local time |
| `country` | str | Optional; default `"GL0B"` if omitted |

**Call**:

```python
from pyspark.sql import SparkSession
from howde import HoWDe_labelling

spark = SparkSession.builder.appName('HoWDeApp').getOrCreate()
input_data = spark.read.parquet('path_to_stops.parquet')

# Optional: repartition by user for scalability
input_data = input_data.repartition("useruuid")

labeled_data = HoWDe_labelling(
    input_data,
    range_window_home=28,
    range_window_work=42,
    C_hours=0.4,
    C_days_H=0.4,
    C_days_W=0.5,
    f_hours_H=0.7,
    f_hours_W=0.4,
    f_days_W=0.6,
    output_format="stop",
    verbose=False,
)

labeled_data.show()
```

**Output**: Same DataFrame with added columns:

- `detect_H_loc`: location ID detected as Home (or null if undetected).
- `detect_W_loc`: location ID detected as Work (or null if undetected).
- `location_type`: `'H'`, `'W'`, or `'O'` (other) per stop.

**Multi-config**: Pass lists for any parameter to run multiple configurations; the function returns a list of dicts with `configs` and `res` (the labeled DataFrame per config).

## Rust Quick Start

There is **no official HoWDe crate**. The skill provides a from-spec implementation in [reference.md](reference.md#rust-implementation-guide) (same algorithm as the paper and Python package). Use Rust for embedded or high-performance pipelines, or when integrating with non-Python stacks.

**Dependencies**: Use `chrono` for date/time. The implementation in reference.md can be copied into your crate or a `howde.rs` module; optional `serde`/`csv` for loading stops from CSV.

**Input**: Same logical schema as Python. Types in the reference use `String` for IDs and `i64` for timestamps:

| Column / field | Type | Description |
|----------------|------|-------------|
| `user_id` | `String` (or `i64`/`u64`) | Unique user identifier |
| `loc_id` | `String` (or `i64`; avoid `-1`) | Stop location ID |
| `start_ts` | `i64` | Start time of stop (Unix timestamp) |
| `end_ts` | `i64` | End time of stop (Unix timestamp) |
| `tz_offset_secs` | optional | Timezone offset for local time |

**Example**:

```rust
use chrono::NaiveDate;

// Build stops (e.g. from CSV or your pipeline); filter out loc_id == -1
let stops: Vec<Stop> = load_stops_from_csv("stops.csv")?;

let params = HowdeParams::default();

let results = howde_label(&stops, &params);

for r in &results {
    println!(
        "{} {} home={:?} work={:?}",
        r.user_id,
        r.date,
        r.home_loc,
        r.work_loc
    );
}
```

**Output**: `Vec<HowdeResult>` with `user_id`, `date` (per-day), `home_loc: Option<String>`, `work_loc: Option<String>`. Full data structures and the core implementation are in [reference.md](reference.md#rust-implementation-guide).

## Parameter Summary (paper → Python)

| Paper | Python parameter | Default | Role |
|-------|------------------|---------|------|
| ΔT_H | `range_window_home` | 28 | Sliding window size (days) for home |
| ΔT_W | `range_window_work` | 42 | Sliding window size (days) for work |
| C_hours | `C_hours` | 0.4 | Min fraction of night/business hourly-bins with data per day |
| C_days,H | `C_days_H` | 0.4 | Min fraction of days with data in window (home) |
| C_days,W | `C_days_W` | 0.5 | Min fraction of days with data in window (work) |
| f_hours,H | `f_hours_H` | 0.7 | Min avg fraction of night bins at a location to qualify as home |
| f_hours,W | `f_hours_W` | 0.4 | Min avg fraction of business bins at a location to qualify as work |
| f_days,W | `f_days_W` | 0.6 | Min fraction of days in window location visited (work only) |

**Tuning**: Start with coverage filters (`C_days_H`, `C_days_W`, `C_hours`) to match data quality; then adjust estimation thresholds (`f_hours_H`, `f_hours_W`, `f_days_W`) for stricter or looser home/work assignment. Higher `f_hours_H`/`f_hours_W` increases accuracy but increases fraction of users with no detected home/work.

## Additional Resources

- Full algorithm workflow, Python API details, and Rust implementation (data model, core implementation, and usage): [reference.md](reference.md)
- Paper: https://arxiv.org/html/2506.20679v2
- Python repo and tutorials: https://github.com/LLucchini/HoWDe
- Benchmark data (DTU): https://doi.org/10.11583/DTU.28846325
