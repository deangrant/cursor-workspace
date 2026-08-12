---
name: api-content-negotiation-media-types
description: >-
  Apply HTTP content negotiation for REST APIs: Accept/Content-Type, q-values,
  406/415, Vary, and problem+json errors. Use when supporting multiple
  representations or fixing silent format fallbacks.
trigger: >-
  content negotiation, Accept header, Content-Type, 406 Not Acceptable, 415
  Unsupported Media Type, Vary Accept, representation selection
---

# Content Negotiation and Media Types

Use this skill when clients and servers must agree on **representation format**.

---

## 1. Negotiation

Client sends preferences (`Accept`, `Accept-Encoding`, `Accept-Language` with
optional `q`). Server picks a representation and declares `Content-Type`.

Always set `Content-Type` on bodies (include `charset` for text).

---

## 2. Failures

| Case | Status |
| ---- | ------ |
| Unsatisfiable `Accept` | **406** |
| Unsupported request body type | **415** |

Do not silently fall back unless documented. Document default when `Accept` is
absent (often JSON).

---

## 3. Caching

When multiple representations share a URI: `Vary: Accept, Accept-Encoding`.
Keep the supported format set small to limit cache-key cardinality.

Errors: `application/problem+json`.

---

## 4. Quick checklist

- [ ] Document request Content-Types and Accept policy.
- [ ] Always set response Content-Type.
- [ ] 406 / 415 used correctly.
- [ ] Vary when multi-representation.
- [ ] Declared in OpenAPI.

See [reference.md](reference.md) and [examples.md](examples.md).
