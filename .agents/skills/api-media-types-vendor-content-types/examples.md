# Media Types — Examples

## Prefer standard

```http
Content-Type: application/json
```

## Vendor when semantics differ

```http
Content-Type: application/vnd.example.order.v2+json
```

## JSON:API param restriction

Unknown parameters on `application/vnd.api+json` → **415**.
