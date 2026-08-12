# Standardized Error Handling — Examples

## Example 1: Not found

```http
HTTP/1.1 404 Not Found
Content-Type: application/problem+json

{
  "type": "https://api.example.com/errors/not-found",
  "title": "Resource not found",
  "status": 404,
  "detail": "Order 42 does not exist"
}
```

## Example 2: Validation

```http
HTTP/1.1 422 Unprocessable Content
Content-Type: application/problem+json

{
  "type": "https://api.example.com/errors/validation",
  "title": "Validation failed",
  "status": 422,
  "errors": { "email": ["required"] }
}
```

## Example 3: Avoid

```json
{ "error": true, "message": "fail", "stack": "..." }
```
