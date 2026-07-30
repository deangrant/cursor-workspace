# Polars (Rust) Performance Skill

This skill provides domain knowledge and best-practice guidance for the **Polars** crate in Rust. Use it when writing or reviewing Rust code that uses `polars` for high-performance DataFrame workloads, or when tuning Polars for production.

## When it applies

- Writing or refactoring code that uses `polars` (DataFrame, Series, LazyFrame)
- Choosing between lazy and eager APIs or designing aggregations and joins
- Configuring `Cargo.toml` features, allocators, or compile flags for performance
- Debugging compile errors related to missing dtypes or features
- Tuning runtime (threads, partitioning, formatting) via environment variables

## What this skill covers

- **Lazy API** — Prefer `LazyFrame` and `.collect()` at the end; use `scan_parquet`, `scan_csv`, etc., to push I/O and predicates into the plan
- **Expressions** — Composable, parallel expression-based select/agg/filter; alias results for joins
- **Data structures** — DataFrame, Series, ChunkedArray; when to use `df.lazy()` to stay in the lazy API
- **Performance** — Cargo features (`lazy`, `performant`, `nightly`, `cse`), CPU/SIMD, optional allocators, async with `spawn_blocking`
- **Configuration** — Feature flags, opt-in dtypes, and environment variables for compile and runtime tuning

## What's in this skill

| File | Purpose |
|------|---------|
| [SKILL.md](SKILL.md) | What Cursor uses: when to apply, lazy API, expressions, data structures, performance (Cargo features, CPU/SIMD, allocators, async), troubleshooting |
| [reference.md](reference.md) | Feature flags, opt-in dtypes, environment variables (for Cargo.toml and runtime tuning) |
| [example.md](example.md) | Code examples: lazy pipelines, expressions in select/agg, async with `spawn_blocking` |

## Official resources

- **Docs & API**: [docs.rs/polars](https://docs.rs/polars/latest/polars/)
- **GitHub**: [pola-rs/polars](https://github.com/pola-rs/polars)
