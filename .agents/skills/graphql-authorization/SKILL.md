---
name: graphql-authorization
description: >-
  Implement GraphQL authorization in a shared business layer with field-level
  checks, hydrated user context, and optional schema directives. Use when
  securing fields or preventing REST/GraphQL auth drift.
trigger: >-
  GraphQL authorization, field-level auth, @auth directive, context.user,
  GraphQL permissions, partial data errors
---

# GraphQL Authorization

Use this skill when deciding **what authenticated callers may read/write** via
GraphQL.

---

## 1. Separate concerns

- **Authentication** in HTTP middleware before GraphQL validation → `context.user`.
- **Authorization** during field execution — not a blanket middleware reject for
  field-level rules.
- Pass a **hydrated user** into domain code, not raw tokens.

---

## 2. Single source of truth

All authz rules live in the **business logic layer**. Resolvers **delegate**.
REST/RPC call the same methods. Prototype-in-resolver is OK only temporarily.

---

## 3. Field-level enforcement

Evaluate auth per selected field. Unauthorized sensitive fields → `null` (or
error) without failing the whole query when allowed. Expect partial `data` +
`errors` with **2xx** when `data` is non-null.

---

## 4. Directives (optional)

`@auth` may document policy in schema but must map to domain functions — no
auth logic only inside directive handlers.

---

## 5. Quick checklist

- [ ] Authn middleware → context; authz in domain.
- [ ] No duplicated resolver-only checks that REST bypasses.
- [ ] Field-level outcomes tested (including aliases).
- [ ] Same user/rule outcomes via GraphQL and REST.

See [reference.md](reference.md) and [examples.md](examples.md).
