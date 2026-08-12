---
name: api-sparse-fieldsets-partial-responses
description: >-
  Design sparse fieldsets and include/expand for REST APIs: allowlisted
  ?fields=, relationship includes with depth caps, complete defaults. Use when
  reducing over-fetching, designing GraphQL-like shaping on REST, or reviewing
  list payload size.
trigger: >-
  sparse fieldsets, fields parameter, include expand, partial responses,
  over-fetching, under-fetching, JSON:API fields
---

# Sparse Fieldsets and Partial Responses

Use this skill when clients need to **select fields** or **embed related
resources** without abandoning REST. Defaults stay **complete and predictable**;
shaping is opt-in.

---

## 1. Sparse fieldsets

```http
GET /users/7?fields=id,name,email
```

- Whitelist selectable fields; always include `id`.
- Reject or explicitly ignore unknown fields — do not silently expose internals.
- JSON:API: `?fields[articles]=title&fields[people]=name`.

---

## 2. Include / expand

```http
GET /orders/42?include=customer,items
```

Without include, return IDs/links. Cap depth (1–2), whitelist relationships,
limit count/bytes. Keep list-endpoint includes shallow; rate-limit heavy expand.

---

## 3. Caching

Cache keys / `Vary` must account for `fields` and `include` variance.

---

## 4. Quick checklist

- [ ] Complete default responses.
- [ ] Allowlisted `fields`; always `id`.
- [ ] Allowlisted `include` with depth/count caps.
- [ ] Document params in OpenAPI.
- [ ] Shallow expands on collections.
- [ ] Cache variance documented.

See [reference.md](reference.md) and [examples.md](examples.md).
