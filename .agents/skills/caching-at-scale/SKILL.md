---
name: caching-at-scale
description: >-
  Choose application caching patterns (cache-aside, write-through/behind),
  prevent stampedes, and design invalidation across app cache and CDN. Use when
  caching is wrong, stale, or melting origin under load.
trigger: >-
  caching at scale, cache-aside, cache stampede, negative caching, write-through,
  Surrogate-Key, cache invalidation
---

# Caching at Scale

Use this skill for **application and edge caching strategy** (beyond basic
Cache-Control alone).

---

## 1. Pattern selection

| Workload | Prefer |
| -------- | ------ |
| Read-heavy general | Cache-aside |
| Always-warm mutable config/sessions | Write-through |
| Write-heavy analytics | Write-behind (accept crash loss) |
| Shared complex loaders | Read-through |

---

## 2. Stampede / miss storms

Singleflight or probabilistic early refresh on hot keys. Negative-cache misses
with jitter. Warm hot keys on promote/traffic shift.

---

## 3. Invalidation

Not TTL-only for mutable data. Event-driven/CDC for critical freshness.
Tag-based invalidation when one write touches many keys. CDN: `s-maxage`,
Surrogate-Key purge. User-specific: `private` + `Vary: Authorization`.
HTTP GET: ETag/304 + optional stale-while-revalidate.

---

## 4. Quick checklist

- [ ] Pattern matches read/write profile.
- [ ] Stampede protection on hot keys.
- [ ] Explicit invalidation path (not only TTL).
- [ ] Tenant/user in cache keys where needed.
- [ ] CDN vs app-cache responsibilities clear.

See [reference.md](reference.md) and [examples.md](examples.md).
