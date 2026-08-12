---
name: api-async-long-running-operations
description: >-
  Design async long-running REST operations with 202 Accepted, job resources,
  polling, Prefer respond-async, and webhook completion. Use when work exceeds
  request timeouts (reports, imports, provisioning) rather than streaming.
trigger: >-
  202 Accepted, async job, long-running operation, job status polling,
  Prefer respond-async, Retry-After jobs, background processing API
---

# Asynchronous Long-Running Operations

Use this skill when work exceeds a single request/response cycle. Do **not**
hold connections open — acknowledge with **202**, run in background, expose a
**job** resource. Continuous push feeds belong in the streaming skill.

---

## 1. 202 Accepted

```http
HTTP/1.1 202 Accepted
Location: /jobs/8f3a
Retry-After: 5
```

202 means accepted/queued — **not** underlying success.

---

## 2. Job resource

First-class resource with `id`, `status`, `progress`, timestamps.

Status enum: `queued` → `running` → terminal `succeeded` | `failed` | `cancelled`.

On success: `result.href` or `303` to the final resource — do not inline huge
payloads. On failure: error in job body; poll still returns **200**.

---

## 3. Polling and notifications

Honor `Retry-After`; use ETag/`If-None-Match` for cheap unchanged polls. Prefer
**webhooks + polling fallback**. Sign webhook deliveries.

Optional: `Prefer: respond-async, wait=N` (RFC 7240) — sync if fast enough,
else 202. Protect creates with `Idempotency-Key`.

---

## 4. Quick checklist

- [ ] Clear criteria for async vs sync.
- [ ] 202 + `Location` + optional `Retry-After`.
- [ ] Documented status enum.
- [ ] Cheap polling; result via link/redirect.
- [ ] Webhooks + poll fallback.
- [ ] Idempotent job creation.

See [reference.md](reference.md) and [examples.md](examples.md).
