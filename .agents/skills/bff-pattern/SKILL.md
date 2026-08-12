---
name: bff-pattern
description: >-
  Decide when to adopt Backend-for-Frontend, size BFFs per client type, keep
  business logic in core services, and pair with an API gateway. Use when
  designing multi-client architectures or splitting mega-backends.
trigger: >-
  BFF, Backend for Frontend, BFF vs API gateway, mobile BFF, web BFF,
  client-specific API
---

# BFF Pattern

Use this skill when multiple clients need **different shapes/performance** from
the same backends.

---

## 1. Adopt when

Multiple client types with different needs; heavy aggregation/transform;
bandwidth-sensitive mobile; independent frontend release cycles; client-specific
auth/permissions.

## 2. Skip when

Single frontend; team cannot operate multiple pipelines; backend already fits;
extra hop hurts more than it helps; microservices already expose client-specific
APIs (duplication).

---

## 3. Implementation

- **One BFF per interface type** (web, mobile) — not one mega-BFF.
- Lightweight orchestration/shaping only; **business logic in core services**.
- Auth at BFF for client-specific rules; monitor as potential bottleneck.
- Independent deploys per BFF.
- Pair with **API Gateway** for cross-cutting (TLS, global rate limits); BFF for
  client tailoring.

| Client | Focus |
| ------ | ----- |
| Web | Aggregation, SEO/cache headers |
| Mobile | Payload size, call count, offline-tolerant shapes |

---

## 4. Quick checklist

- [ ] Clear adopt/skip rationale.
- [ ] One BFF per client family.
- [ ] No core business rules trapped in BFF.
- [ ] Gateway vs BFF responsibilities documented.
- [ ] SLOs/monitoring on BFF hop.

See [reference.md](reference.md) and [examples.md](examples.md).
