---
name: api-webhook-signature-verification
description: >-
  Verify webhook signatures with HMAC-SHA256 over the raw body, constant-time
  compare, timestamp replay windows, and idempotent handling. Use when
  implementing or reviewing webhook receivers or providers.
trigger: >-
  webhook signature, HMAC-SHA256, raw body verify, constant-time compare,
  webhook timestamp, replay attack, signing secret
---

# Webhook Signature Verification

Use this skill when **signing or verifying** webhook payloads.

---

## 1. Provider

Sign the **raw body** bytes (not re-serialized JSON) with HMAC-SHA256 (or
documented scheme). Include timestamp in the signed content. Rotate secrets.

---

## 2. Receiver

- Read raw body before JSON parse.
- Compute expected HMAC; **constant-time** compare.
- Reject if timestamp outside skew window (replay).
- Dedupe on event id (idempotent processing).

---

## 3. Quick checklist

- [ ] Raw body signed/verified.
- [ ] Constant-time compare.
- [ ] Timestamp window enforced.
- [ ] Secrets not logged; rotation supported.
- [ ] Idempotent event handling.

See [reference.md](reference.md) and [examples.md](examples.md).
