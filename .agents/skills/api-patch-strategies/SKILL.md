---
name: api-patch-strategies
description: >-
  Choose JSON Patch (RFC 6902) vs Merge Patch (RFC 7386) for REST PATCH,
  including media types, null semantics, Accept-Patch, and If-Match
  concurrency. Use when designing partial updates or reviewing PATCH handlers.
trigger: >-
  PATCH, JSON Patch, Merge Patch, RFC 6902, RFC 7386, Accept-Patch,
  partial update, If-Match ETag
---

# PATCH Strategies: JSON Patch vs Merge Patch

Use this skill when implementing **partial updates**. Arbitrary partial JSON is
ambiguous — use RFC media types; wrong `Content-Type` → **415**.

Advertise supported formats with `Accept-Patch` (often on OPTIONS).

---

## 1. JSON Patch (RFC 6902)

`Content-Type: application/json-patch+json` — ordered ops; JSON Pointer paths;
all-or-nothing.

Ops: `add`, `remove`, `replace`, `move`, `copy`, `test`.

Best for: array element edits, assertions (`test`), auditability, explicit null.

---

## 2. Merge Patch (RFC 7386)

`Content-Type: application/merge-patch+json` — partial object; **null deletes**;
omit = unchanged; nested objects merge; **arrays replace wholesale**.

Best for: object-centric local-copy edits from clients.

---

## 3. Concurrency and security

- Require `If-Match` (strong ETag) → **412** on mismatch; missing may be **428**.
- Whitelist patchable paths; cap body size / op count; authz per path.
- Never treat PATCH like PUT (omitted fields nulled) unless Merge Patch null rules apply.

---

## 4. Quick checklist

- [ ] One format (or both with distinct media types + 415).
- [ ] `Accept-Patch` documented.
- [ ] Null/omit semantics documented.
- [ ] `If-Match` on contested resources.
- [ ] Path allowlist + size/op caps.
- [ ] Errors: 400 / 409 / 412 / 415 / 422.

See [reference.md](reference.md) and [examples.md](examples.md).
