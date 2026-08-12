# HATEOAS — Examples

## HAL-style

```json
{
  "id": 42,
  "status": "pending",
  "_links": {
    "self": { "href": "/orders/42" },
    "cancel": { "href": "/orders/42/cancel", "method": "POST" },
    "next": { "href": "/orders?cursor=abc" }
  }
}
```

## Avoid

Shipping a static SDK that ignores `_links` and rebuilds all URLs from templates
while requiring clients to "use HATEOAS".
