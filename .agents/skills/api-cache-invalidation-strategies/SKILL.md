---
name: api-cache-invalidation-strategies
description: >-
  Design API cache invalidation: TTL, ETag revalidation, stale-while-revalidate,
  Surrogate-Key purge, and hybrid strategies. Use when cached data goes stale
  or planning purge workflows.
trigger: >-
  cache invalidation, TTL, Surrogate-Key, purge, stale-while-revalidate,
  cache stampede, soft purge
---

# Cache Invalidation Strategies

Use this skill when deciding **how cached API responses become fresh**.

---

## 1. Strategies

| Strategy | Idea |
| -------- | ---- |
| TTL / max-age | Time-based expiry |
| ETag / 304 | Revalidate cheaply |
| stale-while-revalidate | Serve stale while refreshing |
| Surrogate-Key / tag purge | Explicit CDN/edge purge by key |
| Hybrid | Short TTL + event-driven purge |

---

## 2. Guidance

- Prefer event-driven purge for correctness-critical data; TTL for soft freshness.
- Include auth/tenant in cache keys.
- Avoid thundering herds: SWR, soft locks, or randomized expiry.

---

## 3. Quick checklist

- [ ] Freshness requirements classified (soft vs hard).
- [ ] Key design includes tenant/user where needed.
- [ ] Purge path tested for tagged content.
- [ ] Stampede mitigations for popular keys.

See [reference.md](reference.md) and [examples.md](examples.md).
