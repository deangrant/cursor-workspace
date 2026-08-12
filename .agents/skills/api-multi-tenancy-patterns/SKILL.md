---
name: api-multi-tenancy-patterns
description: >-
  Design multi-tenant REST APIs: silo/pool/bridge isolation, tenant routing,
  verified JWT tenantId, noisy-neighbor limits, and cache key prefixes. Use when
  building SaaS APIs or reviewing cross-tenant data risks.
trigger: >-
  multi-tenancy, tenant isolation, silo pool bridge, tenantId JWT, noisy
  neighbor, SaaS API tenancy
---

# Multi-Tenancy Patterns

Use this skill when one deployment serves **many tenants**.

---

## 1. Isolation models

| Model | Idea |
| ----- | ---- |
| Silo | Separate infra per tenant |
| Pool | Shared infra; tenant discriminator |
| Bridge | Hybrid (sensitive silo + pooled) |

---

## 2. API rules

- Route/resolve tenant from **verified** token claims — never trust raw
  client-supplied tenant IDs alone.
- Enforce tenant on every query and cache key.
- Per-tenant rate limits; guard noisy neighbors.
- Cross-tenant access = critical security bug (BOLA class).

---

## 3. Quick checklist

- [ ] Isolation model chosen deliberately.
- [ ] Tenant identity verified cryptographically.
- [ ] Data access scoped in all layers.
- [ ] Cache/queue keys prefixed by tenant.
- [ ] Per-tenant quotas.

See [reference.md](reference.md) and [examples.md](examples.md).
