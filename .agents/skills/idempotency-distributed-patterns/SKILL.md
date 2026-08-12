---
name: idempotency-distributed-patterns
description: >-
  Build retry-safe distributed systems with Idempotency-Key stores, transactional
  outbox, and consumer deduplication. Use when designing payments, orders, or
  event pipelines under at-least-once delivery.
trigger: >-
  idempotency patterns, transactional outbox, consumer deduplication,
  exactly-once myth, idempotency store, processed_events
---

# Idempotency Distributed Patterns

Use this skill beyond HTTP headers — **at-least-once delivery + idempotent
handlers**. Exactly-once delivery is a myth; timeouts do not say if the first
attempt succeeded.

---

## 1. HTTP API store

- Mandatory `Idempotency-Key` on costly mutations.
- Claim key + business op + store response in **one DB transaction** — never
  SETNX-then-process-then-commit on Redis alone.
- States: PENDING → COMPLETED | FAILED; **409** in-flight; hash mismatch → reject.
- Tenant-scoped key; TTL ~24h; reaper for stuck/expired rows.
- Cache 4xx; do not cache 5xx. Check store **before** rate limits.
- Clients reuse the same key on retries with backoff + jitter.

---

## 2. Events

- **Transactional outbox** in same TX as business write; poller or CDC.
- Consumers: `processed_events` keyed by business id (dedupe).

---

## 3. Quick checklist

- [ ] At-least-once assumed end-to-end.
- [ ] Atomic claim + side effect + response storage.
- [ ] Outbox for reliable publish.
- [ ] Consumer dedupe table.
- [ ] Same key on client retries.

See [reference.md](reference.md) and [examples.md](examples.md).
