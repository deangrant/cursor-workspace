---
name: graphql-security
description: >-
  Harden GraphQL APIs with TLS, trusted documents or demand control, input
  sanitization, introspection/error masking, and field auth. Use when locking
  down production GraphQL or reviewing DoS risk.
trigger: >-
  GraphQL security, trusted documents, query depth limit, query complexity,
  introspection disable, GraphQL DoS, demand control
---

# GraphQL Security

Use this skill for **layered GraphQL hardening** (beyond authn alone).

---

## 1. Transport

HTTPS/TLS; request timeouts; private/no-cache for sensitive responses;
authenticate subscription transports.

---

## 2. First-party vs public

- **First-party only:** production **trusted document allowlist** / persisted queries.
- **Public API:** cannot allowlist — rely on demand control + auth + validation.

---

## 3. Demand control

Paginate large lists; max depth and list nesting; breadth/alias limits; max
operations per batch; complexity weights + per-request max; rate limits using
complexity budget.

---

## 4. Schema / input / discoverability

Sanitize in business layer; custom scalars for constraints; disable introspection
in production (first-party); mask “Did you mean…?” and stack traces outside
dev. Obscurity is not enough.

---

## 5. Quick checklist

- [ ] TLS + timeouts.
- [ ] Allowlist **or** depth/complexity/rate limits.
- [ ] Pagination + max `first`.
- [ ] Introspection/error masking in prod.
- [ ] Field auth + alias bypass tests.

See [reference.md](reference.md) and [examples.md](examples.md).
