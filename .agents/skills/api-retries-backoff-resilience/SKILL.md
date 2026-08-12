---
name: api-retries-backoff-resilience
description: >-
  Implement client and service resilience: retry only transient failures,
  exponential backoff with jitter, honor Retry-After, timeouts, and circuit
  breakers. Use when designing HTTP clients or outbound API calls.
trigger: >-
  retries, exponential backoff, jitter, Retry-After, circuit breaker,
  resilience, transient errors, timeouts
---

# Retries, Backoff, and Resilience

Use this skill when callers **retry** HTTP dependencies safely.

---

## 1. What to retry

Retry **transient** failures (408, 429, 502, 503, 504, network blips). Do not
blindly retry non-idempotent POSTs without `Idempotency-Key`.

---

## 2. Backoff

Exponential backoff **+ jitter**. Honor `Retry-After` when present — it
overrides client-computed delay. Cap attempts.

---

## 3. Defense in depth

Explicit timeouts on outbound calls; circuit breakers to shed load; bulkheads
between dependency classes.

---

## 4. Quick checklist

- [ ] Retry policy matches idempotency.
- [ ] Backoff + jitter; honor Retry-After.
- [ ] Timeouts always set.
- [ ] Circuit breaker on unstable deps.

See [reference.md](reference.md) and [examples.md](examples.md).
