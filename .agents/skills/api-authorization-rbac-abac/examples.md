# Authorization — Examples

**Prefer:** server loads order 42 and checks `order.tenant_id == token.tenant_id`
and caller relationship.

**Avoid:** `GET /orders/42` returning any order if the JWT is merely valid.
