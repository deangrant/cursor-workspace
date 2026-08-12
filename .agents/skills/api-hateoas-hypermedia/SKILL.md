---
name: api-hateoas-hypermedia
description: >-
  Design pragmatic HATEOAS for REST APIs using HAL or JSON:API links, including
  self/next and state-transition actions. Use when adding hypermedia, reviewing
  RMM Level 3, or deciding against full HATEOAS.
trigger: >-
  HATEOAS, hypermedia, HAL, JSON:API links, _links, Richardson Level 3,
  server-driven navigation, link relations
---

# HATEOAS and Hypermedia APIs

Use this skill when clients should **follow links** instead of hard-coding URL
templates (RMM Level 3). Full adoption is rare — prefer a **pragmatic subset**.

---

## 1. Idea

Server returns currently valid actions as links (e.g. drop `cancel` when
shipped). Clients discover next steps from the representation.

---

## 2. Formats

| Format | Media type | Shape |
| ------ | ---------- | ----- |
| **HAL** | `application/hal+json` | `_links`, `_embedded` |
| **JSON:API** | `application/vnd.api+json` | `links`, relationships |

Use IANA rels (`self`, `next`, `prev`) or URI-namespaced custom rels. Include
method hints for non-GET actions.

---

## 3. Pragmatic subset

- Always `self`
- Pagination `next`/`prev` (body links or `Link` header)
- Key state-transition links only

OpenAPI Link Object is **design-time docs**, not runtime HATEOAS. Media-type
versioning pairs better with hypermedia than path versioning.

---

## 4. Quick checklist

- [ ] Full vs pragmatic vs Level 2-only decision documented.
- [ ] One hypermedia format if used.
- [ ] State-dependent links; methods on non-GET.
- [ ] `self` + pagination links minimum.
- [ ] Documented for clients/SDKs.

See [reference.md](reference.md) and [examples.md](examples.md).
