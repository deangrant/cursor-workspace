---
name: api-conditional-requests-validation
description: >-
  Implement conditional request validators for safe concurrency: strong/weak
  ETags, If-Match/If-Unmodified-Since, 412 and 428. Use when preventing lost
  updates on PUT/PATCH/DELETE.
trigger: >-
  If-Match, If-Unmodified-Since, 412 Precondition Failed, 428 Precondition
  Required, strong ETag, optimistic concurrency, lost update
---

# Conditional Requests and Validation

Use this skill for **optimistic concurrency** on mutations.

---

## 1. Preconditions

| Header | Typical use |
| ------ | ----------- |
| `If-Match` | Mutate only if ETag matches (strong) |
| `If-None-Match` | GET revalidation / create-if-absent patterns |
| `If-Unmodified-Since` | Time-based precondition |

Mismatch → **412 Precondition Failed**. Missing required precondition may be
**428 Precondition Required**. Business conflict → **409**.

---

## 2. Strong vs weak ETags

Use **strong** ETags when byte-identity matters for writes. Weak ETags (`W/`)
are for semantic equivalence / caching, not safe lost-update prevention.

---

## 3. Quick checklist

- [ ] Strong ETag on contested resources.
- [ ] Require `If-Match` on PUT/PATCH (and DELETE if needed).
- [ ] 412 / 428 / 409 distinguished correctly.
- [ ] Precedence rules documented.

See [reference.md](reference.md) and [examples.md](examples.md).
