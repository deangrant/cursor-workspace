---
name: polars-rust-performance
description: Apply Polars (Rust) best practices for high-performance DataFrame workloads. Use when writing or reviewing Rust code that uses the polars crate, optimizing data pipelines, choosing lazy vs eager API, configuring features and allocators, or tuning Polars for production. Reference https://docs.rs/polars/latest/polars/
---

# Polars (Rust) — Performance Best Practices

Use this skill when implementing or reviewing Polars-based data pipelines in Rust. Prioritize the lazy API, expression-based queries, and opt-in features that match your workload.

## When to Apply

- Adding or refactoring code that uses `polars` (DataFrame, Series, LazyFrame).
- Choosing between eager and lazy APIs or designing aggregations and joins.
- Configuring `Cargo.toml` features, allocators, or compile flags for performance.
- Debugging compile errors related to missing dtypes or features.
- Tuning runtime (threads, partitioning, formatting) via environment variables.

---

## 1. Prefer the Lazy API

**Rule:** Build queries with `LazyFrame` and `.collect()` at the end. Avoid eager `DataFrame` chains for multi-step workflows.

- Lazy evaluation enables **query optimization** and lets Polars choose algorithms with full context.
- Expressions run **in parallel**; separate expressions in `select`/`agg` are embarrassingly parallel.
- Use `LazyFrame::scan_parquet`, `scan_csv`, etc., to push I/O and predicates into the plan.

```rust
use polars::prelude::*;

// Preferred: lazy scan → transform → collect
let df = LazyFrame::scan_parquet("data.parquet", Default::default())?
    .filter(col("x").gt(lit(0)))
    .group_by([col("key")])
    .agg([col("value").sum().alias("total")])
    .collect()?;
```

- In **async** code, run Polars (eager or lazy) inside `spawn_blocking` so the async runtime is not blocked.

---

## 2. Think in Expressions

Expressions are `Fn(Series) -> Series`: composable, parallel, and the main abstraction for select/agg/filter.

- **Compose:** `col("foo").sort(Default::default()).head(None)`, `col("bar").filter(col("foo").eq(lit(1))).sum()`.
- **Run in context:** Use expressions in `.select([...])`, `.agg([...])`, `.filter(...)` on `LazyFrame` (or eager equivalents).
- **Alias results:** Use `.alias("name")` for derived columns so they can be referenced later (e.g. in joins).

Prefer expression chains over manual loops or row-by-row logic; Polars will vectorize and parallelize.

---

## 3. Data Structures (Top-Down)

| Structure            | Role                                                                                                             |
| -------------------- | ---------------------------------------------------------------------------------------------------------------- |
| **DataFrame**        | Table = `Vec<Series>`. Use for GROUP, JOIN, PIVOT, and final materialized results.                               |
| **Series**           | Type-agnostic column; most ops via `Series`/`SeriesTrait`. Type-specific ops need downcast to `ChunkedArray<T>`. |
| **ChunkedArray\<T>** | Typed column(s), root of Polars; many ops in `chunked_array::ops`.                                               |

Use `df.lazy()` to get a `LazyFrame` and stay in the lazy API until you need a concrete `DataFrame`.

---

## 4. Performance: Compile and Runtime

### 4.1 Cargo features (performance-oriented)

- **`lazy`** — Required for `LazyFrame` and optimized plans. Enable for any non-trivial pipeline.
- **`performant`** — Extra fast paths; slower compile, faster runtime. Use in release builds.
- **`nightly`** — Enables SIMD and other nightly-only optimizations. Use with nightly toolchain if acceptable.
- **`cse`** — Common subplan elimination in lazy plans. Consider for complex multi-use expressions.
- **`bigidx`** — Only if you expect more than 2^32 rows; uses `u64` indices and can be slightly slower/cache-heavy.

Enable only the **IO and ops features you need** (e.g. `parquet`, `json`, `rows`, `dynamic_group_by`) to keep compile times down. See [reference.md](reference.md) for full feature list.

### 4.2 CPU and SIMD

- For maximum throughput on the current machine: `RUSTFLAGS='-C target-cpu=native'` (use with care for portability).
- SIMD is optional (`nightly` feature); Polars runs on **stable** without it.

### 4.3 Custom allocator (~up to ~25% gain)

OLAP workloads allocate heavily. Set a global allocator in the binary (e.g. in `main.rs`):

**Jemalloc (recommended on Linux/macOS):**

```rust
use tikv_jemallocator::Jemalloc;

#[global_allocator]
static GLOBAL: Jemalloc = Jemalloc;
```

**Cargo.toml:** `tikv-jemallocator = { version = "*" }`

**Mimalloc (alternative):** `mimalloc = { version = "*", default-features = false }` and `MiMalloc` as `GLOBAL`. Prefer Jemalloc on Unix when possible.

---

## 5. Opt-in dtypes and features

- **Strange compile errors** about types often mean a **dtype** or **feature** is missing.
- Series are `ChunkedArray<T>` under the hood; more `T` means more compile time. Enable only what you use:
  - Dates/times: `dtype-date`, `dtype-datetime`, `dtype-time`, `dtype-duration`
  - Small ints: `dtype-i8`, `dtype-i16`, `dtype-u8`, `dtype-u16`
  - Other: `dtype-categorical`, `dtype-struct`
- Presets: `dtype-full` (all), `dtype-slim` (slim set). See [reference.md](reference.md) for the full table.

---

## 6. Environment variables (tuning and debugging)

Set only as needed; defaults are usually fine.

- **Thread pool:** `POLARS_MAX_THREADS` — thread count at startup.
- **Group-by:** `POLARS_NO_PARTITION` — disable partitioned group_by; `POLARS_FORCE_PARTITION` — force it; `POLARS_PARTITION_UNIQUE_COUNT` — threshold (default 1000).
- **Joins:** `POLARS_NO_CHUNKED_JOIN` — force rechunk before joins if you hit join issues.
- **Debug:** `POLARS_VERBOSE`, `POLARS_BACKTRACE_IN_ERR`, `POLARS_PANIC_ON_ERR`.
- **Formatting:** `POLARS_FMT_MAX_ROWS`, `POLARS_FMT_MAX_COLS`, `POLARS_TABLE_WIDTH`, etc.

Full list and formatting options are in [reference.md](reference.md).

---

## 7. Quick checklist for 10x-style usage

- [ ] Use **LazyFrame** + expressions and a single `.collect()` for multi-step pipelines.
- [ ] Enable **`lazy`** and only the **IO/ops features** you need; add **`performant`** (and optionally **`nightly`**) for release.
- [ ] Use a **custom allocator** (Jemalloc on Unix) in the binary.
- [ ] Add **dtype/feature** flags if you get compile errors about missing types or ops.
- [ ] Run Polars in **`spawn_blocking`** when called from async code.
- [ ] Prefer **expression-based** select/agg/filter over row-wise or manual loops.
- [ ] Use **ENV vars** only for tuning (threads, partitioning, debugging) after profiling.

---

## 8. References

- **Official crate docs:** [docs.rs/polars](https://docs.rs/polars/latest/polars/)
- **Cookbooks:** Eager and Lazy examples in the docs.
- **Project reference:** [reference.md](reference.md) — feature flags, opt-in dtypes, ENV vars.
- **Code patterns:** [examples.md](examples.md) — lazy pipeline, expressions, allocator, async.
