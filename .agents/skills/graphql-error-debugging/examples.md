# GraphQL Error Debugging — Examples

```json
{
  "data": { "user": { "email": null } },
  "errors": [{
    "message": "Not authorized",
    "path": ["user", "email"]
  }]
}
```

Field-level auth failure with partial data — typically HTTP 200.
