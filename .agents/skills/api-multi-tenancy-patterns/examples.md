# Multi-Tenancy — Examples

**Prefer:** `tenant_id` from validated JWT → repository always filters by it.

**Avoid:** accepting `?tenantId=` from the client without matching the token.
