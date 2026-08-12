# Bulk and Batch — Examples

## Sync partial success

```json
{
  "operations": [
    { "method": "POST", "data": { "email": "a@ex.com" } },
    { "method": "DELETE", "id": "c_9" }
  ]
}
```

```json
{
  "results": [
    { "status": 201, "id": "c_1" },
    { "status": 404, "error": { "type": ".../not-found", "title": "Not found" } }
  ]
}
```

## Async

```http
HTTP/1.1 202 Accepted
Location: /bulk-jobs/8f3a
```
