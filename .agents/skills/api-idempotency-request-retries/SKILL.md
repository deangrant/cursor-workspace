---
name: api-idempotency-request-retries
description: >-
  Implement Idempotency-Key for safe POST retries: store request hash and
  response, handle in-flight 409, and combine with backoff. Use when payments,
  creates, or other costly side effects may be retried.
trigger: >-
  Idempotency-Key, idempotent POST, safe retries, duplicate request, 409
  in-flight, idempotency store
---

# Idempotency and Request Retries

Use this skill when **POST/PATCH side effects** must survive client retries.

---

## 1. Protocol

Client sends `Idempotency-Key` (UUID). Server stores key → request hash +
response. Replays return the original response. Same key + different body →
**409**. In-flight duplicate → **409** (or wait policy documented).

---

## 2. Storage

TTL longer than max client retry window (often 24h). Redis/DB common. Include
tenant in the key namespace.

---

## 3. With retries

Clients retry with the **same** key after timeouts. Combine with backoff +
jitter. Never generate a new key on retry of the same logical operation.

---

## 4. Quick checklist

- [ ] Idempotency-Key on costly POSTs.
- [ ] Persist response for replay.
- [ ] Mismatch body → 409.
- [ ] Key scoped by tenant/client.
- [ ] TTL documented.

See [reference.md](reference.md) and [examples.md](examples.md).
