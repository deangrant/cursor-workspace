# Content Negotiation — Examples

## Prefer

```http
GET /orders/42 HTTP/1.1
Accept: application/json
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept
```

## Unsupported body

```http
HTTP/1.1 415 Unsupported Media Type
Content-Type: application/problem+json
```
