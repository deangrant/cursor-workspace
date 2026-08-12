---
name: rate-limiter-algorithms
description: >-
  Select and implement rate-limiter algorithms (token bucket, leaky bucket,
  fixed/sliding windows), key design, Redis/Lua distribution, and production
  anti-patterns. Use when building quotas beyond basic RateLimit headers.
trigger: >-
  rate limiter algorithm, token bucket, sliding window, leaky bucket, Redis
  Lua rate limit, rate limit key selection, distributed rate limiting
---

# Rate Limiter Algorithms

Use this skill when choosing **how** to limit — deeper than HTTP header
conventions alone.

---

## 1. Algorithm selection

| Need | Prefer |
| ---- | ------ |
| Bursty legit clients | **Token bucket** (Stripe/AWS-style) |
| Strict rolling count at scale | **Sliding window counter** |
| High precision (auth/pay) | **Sliding window log** (ZSET + Lua) |
| Smooth downstream drain | **Leaky bucket** |
| Simple internal only | **Fixed window** (watch boundary spikes) |

Token bucket: `capacity` = burst; `refillRate` = sustained; `Retry-After` ≈
tokens deficit / refill.

---

## 2. Key selection

Check **idempotency store before** rate limit (replays free). Primary key =
user ID or API key; tier by subscription. Per-endpoint limits on expensive
routes. IP only as defensive heuristic — not primary on auth endpoints.

---

## 3. Distributed

Fleet-wide Redis/Lua (or equivalent). Fail-open vs fail-closed is an explicit
product decision. Shadow mode before enforce. Prometheus alerts on reject rate.

---

## 4. Anti-patterns

URL-path-only keys; fail-closed without capacity planning; no `Retry-After`;
relying on IP alone behind NAT.

---

## 5. Quick checklist

- [ ] Algorithm matches burst vs smoothness needs.
- [ ] Keys: identity + endpoint + tenant as required.
- [ ] Idempotency checked before counting.
- [ ] Distributed atomicity; headers on reject.
- [ ] Rollout: shadow → enforce.

See [reference.md](reference.md) and [examples.md](examples.md).
