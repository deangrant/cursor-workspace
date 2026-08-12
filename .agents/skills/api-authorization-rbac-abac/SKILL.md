---
name: api-authorization-rbac-abac
description: >-
  Design API authorization with RBAC, ABAC, and ReBAC: PEP/PDP separation,
  object-level checks against BOLA/BFLA, and OAuth scopes. Use when implementing
  permissions or reviewing IDOR risks.
trigger: >-
  RBAC, ABAC, ReBAC, BOLA, BFLA, authorization, PEP PDP, object-level authz,
  OAuth scopes, IDOR
---

# Authorization Models: RBAC, ABAC, ReBAC

Use this skill when deciding **what an authenticated caller may do**.

---

## 1. Models

| Model | Idea |
| ----- | ---- |
| RBAC | Roles → permissions |
| ABAC | Attributes / policies |
| ReBAC | Relationship tuples (e.g. OpenFGA) |

Hybrid is common. Enforce via **PEP** at API edge + **PDP** policy engine.

---

## 2. Must-haves

- Every object access checks ownership/tenant/relationship (**anti-BOLA**).
- Admin routes check role/scope, not just valid token (**anti-BFLA**).
- Property-level checks on sensitive fields.
- Scopes are necessary but not sufficient alone for object access.

---

## 3. Quick checklist

- [ ] Authn and authz separated.
- [ ] Object-level checks on all ID paths.
- [ ] Function-level checks on privileged routes.
- [ ] Policies testable; deny by default.

See [reference.md](reference.md) and [examples.md](examples.md).
