# HTTP Caching — Examples

```http
HTTP/1.1 200 OK
Cache-Control: private, max-age=60
ETag: "v3"
Vary: Authorization
```

```http
GET /orders/42
If-None-Match: "v3"
```

```http
HTTP/1.1 304 Not Modified
ETag: "v3"
```
