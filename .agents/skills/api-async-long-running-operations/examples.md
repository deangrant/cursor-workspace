# Async Long-Running Operations — Examples

## Create job

```http
POST /reports HTTP/1.1
Content-Type: application/json
Idempotency-Key: 6b86b273

{ "type": "annual-revenue", "year": 2025 }
```

```http
HTTP/1.1 202 Accepted
Location: /jobs/8f3a
Retry-After: 5
```

## Job body

```json
{
  "id": "8f3a",
  "status": "succeeded",
  "result": { "href": "/reports/99" }
}
```
