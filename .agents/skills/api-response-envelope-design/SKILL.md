---
name: api-response-envelope-design
description: >-
  Choose and apply consistent REST response envelopes: enveloped data/meta vs
  bare bodies, pagination placement, and never mixing 200 with in-body errors.
  Use when designing response shapes, OpenAPI schemas, or reviewing API
  consistency across collections and singletons.
trigger: >-
  response envelope, data meta wrapper, bare body, pagination meta,
  Link header pagination, API response shape, success envelope
---

# API Response Envelope Design

Use this skill when choosing how **success responses** wrap payload and
metadata. Error bodies are separate — always use Problem Details (RFC 9457).

---

## 1. Status first

Every response = status + headers + body. Clients branch on **HTTP status**
before parsing the body.

**Never** return `200 OK` with `"success": false` or an embedded error object.

---

## 2. Enveloped vs bare

**Enveloped**

```json
{
  "data": { "id": 42, "status": "shipped" },
  "meta": { "request_id": "req_abc" }
}
```

Pros: uniform parse; extensible `meta`. Cons: wrapper tax; can duplicate headers.

**Bare**

```json
{ "id": 42, "status": "shipped" }
```

Meta lives in headers (`Link`, rate-limit). Pros: HTTP-native, smaller.
Cons: clients must know which headers matter.

Pick **one** style and apply to collections **and** singletons unless a hybrid
is explicitly documented.

---

## 3. Pagination placement

Choose **one**:

- Enveloped: `meta.pagination` (cursors, `has_more`, counts)
- Bare: RFC 8288 `Link: rel="next|prev"`

Do not mix inconsistently across endpoints.

---

## 4. Related shaping

Sparse fieldsets (`?fields=`), includes, and flat structures reduce payload
noise — they do not replace the envelope decision.

---

## 5. Quick checklist

- [ ] Enveloped vs bare chosen before v1 and documented.
- [ ] Same rule for collections and singletons (or documented hybrid).
- [ ] Never 200 + error body; Problem Details for errors.
- [ ] One pagination placement (meta **or** Link).
- [ ] If bare: document required response headers.
- [ ] Budget expensive `meta` (e.g. total counts) on hot paths.

See [reference.md](reference.md) and [examples.md](examples.md).
