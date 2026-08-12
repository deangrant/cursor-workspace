# Conditional Requests — Examples

```http
PATCH /orders/42 HTTP/1.1
If-Match: "abc"
Content-Type: application/merge-patch+json

{ "status": "paid" }
```

```http
HTTP/1.1 412 Precondition Failed
Content-Type: application/problem+json
```
