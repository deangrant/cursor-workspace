---
name: api-webhooks-event-driven
description: >-
  Design outbound webhooks and event-driven API delivery: retry schedules,
  2xx-only success, idempotent receivers, and dual notify with polling. Use when
  adding webhook APIs or reviewing delivery reliability.
trigger: >-
  webhooks, event-driven API, webhook retries, outbound webhook, webhook
  delivery, event notification API
---

# Webhooks and Event-Driven API Design

Use this skill when the API **pushes events** to customer endpoints.

---

## 1. Delivery

POST event payloads to customer URLs. Treat only **2xx** as success. Retry with
exponential backoff (+ jitter) on failure; cap attempts; dead-letter afterward.

---

## 2. Receiver expectations

Receivers must be **idempotent** (delivery at-least-once). Provide event `id`
for dedupe. Sign payloads (see webhook signature skill). Offer polling/API
fetch as fallback.

---

## 3. Quick checklist

- [ ] Documented retry schedule.
- [ ] 2xx-only success.
- [ ] Event IDs for idempotent consumers.
- [ ] Signatures + timestamp window.
- [ ] Manual replay / delivery logs.

See [reference.md](reference.md) and [examples.md](examples.md).
