# Input Validation — Examples

**Prefer:** OpenAPI/JSON Schema with explicit properties; map to write-DTO.

**Avoid:**

```json
{ "role": "admin", "balance": 1000000 }
```

accepted into a user self-update endpoint via mass assignment.
