# HTTP Compression — Examples

```http
GET /orders HTTP/1.1
Accept-Encoding: br, gzip
```

```http
HTTP/1.1 200 OK
Content-Encoding: br
Vary: Accept-Encoding
```
