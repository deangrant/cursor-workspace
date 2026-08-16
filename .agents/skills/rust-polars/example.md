# Polars (Rust) — Examples

Concrete patterns for high-performance usage. See [SKILL.md](SKILL.md) for when and why to use each.

---

## Example 1: Lazy pipeline (scan → filter → group → join → collect)

```rust
use polars::prelude::*;

fn main() -> PolarsResult<()> {
    let lf1 = LazyFrame::scan_parquet("myfile_1.parquet", Default::default())?
        .filter(col("value").gt(lit(0)))
        .group_by([col("key")])
        .agg([
            col("value").sum().alias("total"),
            col("value").mean().alias("avg"),
        ]);

    let lf2 = LazyFrame::scan_parquet("myfile_2.parquet", Default::default())?
        .select([col("key"), col("label")]);

    let df = lf1
        .join(lf2, [col("key")], [col("key")], JoinArgs::new(JoinType::Left))
        .collect()?;

    println!("{df}");
    Ok(())
}
```

---

## Example 2: Expressions in select (parallel)

```rust
use polars::prelude::*;

// Each expression in select runs in parallel
let out = df
    .lazy()
    .select([
        col("foo").sort(Default::default()).head(None),
        col("bar").filter(col("foo").eq(lit(1))).sum(),
        (col("a") + col("b")).alias("sum_ab"),
    ])
    .collect()?;
```

---

## Example 3: Global allocator (binary)

In your binary crate (e.g. `src/main.rs`), set the allocator once:

```rust
use tikv_jemallocator::Jemalloc;

#[global_allocator]
static GLOBAL: Jemalloc = Jemalloc;

fn main() {
    // ... your app, including Polars
}
```

**Cargo.toml:**

```toml
[dependencies]
polars = { version = "0.53", features = ["lazy", "parquet", "performant"] }
tikv-jemallocator = { version = "*" }
```

---

## Example 4: Async context (spawn_blocking)

Polars is synchronous; avoid blocking the async runtime:

```rust
let df = tokio::task::spawn_blocking(|| {
    LazyFrame::scan_parquet("data.parquet", Default::default())?
        .filter(col("x").gt(lit(0)))
        .collect()
})
.await??;
```
