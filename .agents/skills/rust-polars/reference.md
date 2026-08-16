# Polars (Rust) — Reference

Detailed reference for feature flags, opt-in dtypes, and environment variables. Use when configuring `Cargo.toml` or tuning runtime. Source: [docs.rs/polars](https://docs.rs/polars/latest/polars/).

---

## Opt-in feature flags (Cargo.toml)

Enable only what you need to keep compile times low.

### Core and performance

| Feature      | Description                                                                       |
| ------------ | --------------------------------------------------------------------------------- |
| `lazy`       | Lazy API (`LazyFrame`, query optimization). **Recommend enabling** for pipelines. |
| `performant` | More fast paths; slower compile, faster runtime.                                  |
| `nightly`    | SIMD and other nightly-only features. Requires nightly toolchain.                 |
| `bigidx`     | Index with `u64` for >> 2^32 rows. Slightly slower; enable only if needed.        |
| `cse`        | Common subplan elimination in lazy plans.                                         |

### Regex, SQL, and utilities

| Feature       | Description                           |
| ------------- | ------------------------------------- |
| `regex`       | Regex in column selection.            |
| `dot_diagram` | Dot diagrams from lazy logical plans. |
| `sql`         | Pass SQL queries to Polars.           |
| `random`      | Randomly sampled values.              |
| `ndarray`     | DataFrame ↔ ndarray.                  |

### Temporal and strings

| Feature             | Description                                 |
| ------------------- | ------------------------------------------- |
| `temporal`          | Chrono ↔ Polars temporal types.             |
| `timezones`         | Timezone support.                           |
| `strings`           | Extra string utilities for `StringChunked`. |
| `string_pad`        | `zfill`, `ljust`, `rjust`.                  |
| `string_to_integer` | `parse_int`.                                |

### IO and serialization

| Feature      | Description                                  |
| ------------ | -------------------------------------------- |
| `serde`      | Serde (de)serialization (JSON etc.).         |
| `serde-lazy` | Serde for lazy.                              |
| `parquet`    | Apache Parquet.                              |
| `json`       | JSON (de)serialization.                      |
| `ipc`        | Arrow IPC.                                   |
| `decompress` | Infer and decompress gzip/zlib/zstd for CSV. |

### DataFrame operations

| Feature                | Description                                       |
| ---------------------- | ------------------------------------------------- |
| `dynamic_group_by`     | Group-by on time windows; rolling group-by.       |
| `sort_multiple`        | Sort on multiple columns.                         |
| `rows`                 | Create from rows, extract rows; pivot, transpose. |
| `asof_join`            | ASOF join (nearest key).                          |
| `cross_join`           | Cartesian product.                                |
| `semi_anti_join`       | SEMI/ANTI joins.                                  |
| `row_hash`             | Hash rows to `UInt64Chunked`.                     |
| `diagonal_concat`      | Concat with different schemas.                    |
| `dataframe_arithmetic` | Arithmetic DataFrame/Series.                      |
| `partition_by`         | Split into DataFrames by groups.                  |

### Series/Expr operations (selection)

| Feature          | Description                                       |
| ---------------- | ------------------------------------------------- |
| `is_in`          | Membership in Series.                             |
| `zip_with`       | Zip two Series/ChunkedArrays.                     |
| `round_series`   | Round float types.                                |
| `concat_str`     | Concat strings in linear time.                    |
| `cum_agg`        | cum_sum, cum_min, cum_max.                        |
| `rolling_window` | e.g. rolling_mean.                                |
| `rank`           | Ranking algorithms.                               |
| `ewma`           | Exponential moving average.                       |
| `list`           | List utils; `list_gather` for sublist by indices. |
| `list_eval`      | Apply expressions over list elements.             |
| `arg_where`      | Indices where condition holds.                    |
| `search_sorted`  | Indices to insert to keep order.                  |
| `cov`            | Covariance and correlation.                       |

Many more exist; see [Compile times and opt-in features](https://docs.rs/polars/latest/polars/#compile-times-and-opt-in-features) in the crate docs.

### Pretty printing

| Feature | Description           |
| ------- | --------------------- |
| `fmt`   | DataFrame formatting. |

### Other

| Feature  | Description                                         |
| -------- | --------------------------------------------------- |
| `object` | `ObjectChunked<T>`; downcast from Series via `Any`. |

---

## Opt-in dtypes (feature flags)

If you get compile errors about a type, enable the corresponding feature.

| Data type   | Feature flag        |
| ----------- | ------------------- |
| Date        | `dtype-date`        |
| Datetime    | `dtype-datetime`    |
| Time        | `dtype-time`        |
| Duration    | `dtype-duration`    |
| Int8        | `dtype-i8`          |
| Int16       | `dtype-i16`         |
| UInt8       | `dtype-u8`          |
| UInt16      | `dtype-u16`         |
| Categorical | `dtype-categorical` |
| Struct      | `dtype-struct`      |

**Presets:**

- `dtype-full` — all opt-in dtypes.
- `dtype-slim` — slim preset.

---

## Environment variables

Set only when tuning or debugging.

### Threading and execution

| Variable                        | Description                                   | Default / note |
| ------------------------------- | --------------------------------------------- | -------------- |
| `POLARS_MAX_THREADS`            | Max threads for thread pool (startup).        | —              |
| `POLARS_NO_PARTITION`           | Disable partitioned group_by.                 | Off            |
| `POLARS_PARTITION_UNIQUE_COUNT` | Key count threshold for partitioned group_by. | 1000           |
| `POLARS_FORCE_PARTITION`        | Force partitioned group_by when allowed.      | Off            |
| `POLARS_NO_CHUNKED_JOIN`        | Rechunk before joins.                         | Off            |

### Debug and errors

| Variable                  | Description                          |
| ------------------------- | ------------------------------------ |
| `POLARS_VERBOSE`          | Logging to stderr.                   |
| `POLARS_PANIC_ON_ERR`     | Panic instead of returning `Result`. |
| `POLARS_BACKTRACE_IN_ERR` | Include Rust backtrace in errors.    |

### I/O and compatibility

| Variable                       | Description                                        |
| ------------------------------ | -------------------------------------------------- |
| `POLARS_NO_PARQUET_STATISTICS` | Ignore parquet statistics.                         |
| `POLARS_ALLOW_EXTENSION`       | Allow `ObjectChunked<T>` in Arrow (uses `unsafe`). |

### Table formatting

| Variable                                            | Description                 | Example values                                        |
| --------------------------------------------------- | --------------------------- | ----------------------------------------------------- |
| `POLARS_FMT_TABLE_FORMATTING`                       | Table style.                | `UTF8_FULL_CONDENSED`, `ASCII_FULL`, `MARKDOWN`, etc. |
| `POLARS_FMT_TABLE_CELL_ALIGNMENT`                   | Cell alignment.             | `LEFT`, `CENTER`, `RIGHT`                             |
| `POLARS_FMT_TABLE_DATAFRAME_SHAPE_BELOW`            | Shape below table.          | —                                                     |
| `POLARS_FMT_TABLE_HIDE_COLUMN_NAMES`                | Hide column names.          | —                                                     |
| `POLARS_FMT_TABLE_HIDE_COLUMN_DATA_TYPES`           | Hide column types.          | —                                                     |
| `POLARS_FMT_TABLE_HIDE_COLUMN_SEPARATOR`            | Hide column separator.      | —                                                     |
| `POLARS_FMT_TABLE_HIDE_DATAFRAME_SHAPE_INFORMATION` | Omit shape.                 | —                                                     |
| `POLARS_FMT_TABLE_INLINE_COLUMN_DATA_TYPE`          | Type on same line as name.  | —                                                     |
| `POLARS_FMT_TABLE_ROUNDED_CORNERS`                  | Rounded corners (UTF8).     | —                                                     |
| `POLARS_FMT_MAX_COLS`                               | Max columns shown.          | —                                                     |
| `POLARS_FMT_MAX_ROWS`                               | Max rows shown; `-1` = all. | —                                                     |
| `POLARS_FMT_STR_LEN`                                | Max chars per string.       | —                                                     |
| `POLARS_TABLE_WIDTH`                                | Table width.                | —                                                     |

Presets for formatting: [comfy-table style presets](https://github.com/Nukesor/comfy-table/blob/main/src/style/presets.rs).
