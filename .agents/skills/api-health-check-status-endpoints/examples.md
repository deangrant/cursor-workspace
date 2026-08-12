# Health Checks — Examples

```http
GET /health/ready
```

```http
HTTP/1.1 503 Service Unavailable
Content-Type: application/health+json

{ "status": "fail", "checks": { "db": { "status": "fail" } } }
```
