# Multi-Tenancy — Reference

## Anti-patterns

- `WHERE tenant_id = request.query.tenant`
- Shared cache keys without tenant prefix
- One global rate limit only

## Sources

- apiguide.dev multi-tenancy
