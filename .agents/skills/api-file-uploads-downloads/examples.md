# File Uploads and Downloads — Examples

## Range download

```http
GET /files/report.pdf HTTP/1.1
Range: bytes=0-1023
```

```http
HTTP/1.1 206 Partial Content
Content-Range: bytes 0-1023/50000
Accept-Ranges: bytes
```

## Avoid

```http
PUT /uploads/chunk HTTP/1.1
Content-Range: bytes 0-999/5000
```

(PUT + Content-Range is invalid per RFC 9110)
