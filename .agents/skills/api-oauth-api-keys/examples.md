# OAuth and API Keys — Examples

```http
GET /v1/orders
Authorization: Bearer <access_token>
```

```http
GET /v1/orders
X-API-Key: <key>
```

Prefer standardized `Authorization` schemes when possible.
