# CDN Edge Caching — Examples

```http
HTTP/1.1 200 OK
Cache-Control: public, s-maxage=300, stale-while-revalidate=60
Surrogate-Key: catalog product:99
Vary: Accept-Encoding
```
