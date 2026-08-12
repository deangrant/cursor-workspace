# Sparse Fieldsets — Examples

## Fields

```http
GET /users/7?fields=id,name,email
```

## Include + fields

```http
GET /orders/42?include=customer&fields[orders]=status&fields[customers]=name
```

## Avoid

Returning every nested relation on every list item by default.
