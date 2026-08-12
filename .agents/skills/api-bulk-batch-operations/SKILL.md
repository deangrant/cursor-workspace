---
name: api-bulk-batch-operations
description: >-
  Design REST bulk/batch endpoints with ordered operations and results, partial
  success (207 or per-item status), idempotency keys, and async bulk jobs. Use
  when syncing many records or reducing per-request overhead.
trigger: >-
  bulk API, batch endpoint, 207 Multi-Status, partial success, bulk job,
  batch idempotency, operations results array
---

# Bulk and Batch Operations

Use this skill when callers must create/update/delete **many items** without
N round trips. Trade throughput for debuggability — document clearly.

---

## 1. Request / response shape

```http
POST /v1/contacts/bulk
```

Ordered `operations[]` (`method` + `data`/`id`); `results[i]` maps to
`operations[i]`. Item bodies match single-resource shapes.

---

## 2. Partial success

Prefer partial success over full rollback (document policy).

- `207 Multi-Status`, or
- `200` + per-item status in `results[]`

Never imply overall success from top-level status alone. Per-item errors use
Problem Details or documented code/field objects.

---

## 3. Idempotency

- **L1:** request `Idempotency-Key` replays whole batch on timeout retry.
- **L2:** per-item keys for re-syncing only failures.

Large/slow batches → `202` + bulk job resource; poll progress; fetch results.

---

## 4. Quick checklist

- [ ] Ordered operations/results indexing documented.
- [ ] Partial-success policy explicit.
- [ ] Per-item status/errors in results.
- [ ] Request-level (+ optional per-item) idempotency.
- [ ] Async path for large batches (202 + job).
- [ ] Rate limit: one batch = one quota unit (document).

See [reference.md](reference.md) and [examples.md](examples.md).
