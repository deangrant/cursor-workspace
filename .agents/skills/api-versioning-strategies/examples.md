# API Versioning — Examples

## URI versioning

```http
GET /v1/orders
GET /v2/orders
```

## Header versioning

```http
GET /orders
API-Version: 2026-01-15
```

## Avoid

Shipping a renamed required field on `/v1` without a migration path.
