---
name: api-rate-limiting
description: >-
  Design API rate limiting with token bucket/sliding/fixed windows, RateLimit
  headers, 429 vs 503, and per-key/endpoint scopes. Use when protecting APIs
  from abuse or implementing quotas.
trigger: >-
  rate limiting, 429 Too Many Requests, RateLimit headers, Retry-After, token
  bucket, quota, throttling API
---

# API Rate Limiting

Use this skill when applying **quotas and abuse protection**.

---

## 1. Algorithms

Token bucket (smooth bursts) is a common default; fixed/sliding windows are
alternatives. Document the chosen model.

---

## 2. Scoping

Limit per identity/IP **and** per-tenant; tighter limits on expensive routes
(export, search, reset). Cap page size / payload size too.

---

## 3. Responses

| Case | Status |
| ---- | ------ |
| Client over quota | **429** + `Retry-After` + `RateLimit-*` |
| System overload | **503** + `Retry-After` |

---

## 4. Quick checklist

- [ ] Algorithm + scopes documented.
- [ ] Per-key and per-endpoint limits where needed.
- [ ] 429 vs 503 distinguished.
- [ ] RateLimit-* and Retry-After emitted.
- [ ] Clients honor Retry-After.

See [reference.md](reference.md) and [examples.md](examples.md).
