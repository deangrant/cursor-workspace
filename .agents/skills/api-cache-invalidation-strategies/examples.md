# Cache Invalidation — Examples

```http
HTTP/1.1 200 OK
Cache-Control: public, max-age=60, stale-while-revalidate=30
Surrogate-Key: order:42 tenant:7
```

On order update: purge surrogate key `order:42`.
