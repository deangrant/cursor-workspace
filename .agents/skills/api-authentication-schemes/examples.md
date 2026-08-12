# Authentication Schemes — Examples

```http
GET /orders HTTP/1.1
Authorization: Bearer eyJhbGciOi...
```

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Bearer realm="api"
```
