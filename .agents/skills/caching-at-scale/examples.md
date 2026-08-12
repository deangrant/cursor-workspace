# Caching at Scale — Examples

**Cache-aside:** miss → load DB → set Redis → return.

**Stampede:** only one goroutine fills `product:42`; others wait on singleflight.
