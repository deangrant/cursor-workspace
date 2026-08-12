---
name: api-cdn-edge-caching
description: >-
  Configure CDN/edge caching for HTTP APIs: s-maxage, Vary cardinality,
  Surrogate-Key, and auth pitfalls. Use when putting APIs behind a CDN or
  debugging edge cache misses/leaks.
trigger: >-
  CDN caching, edge cache, s-maxage, Surrogate-Key, Vary cardinality, API CDN,
  shared cache
---

# CDN and Edge Caching for APIs

Use this skill when caching API responses at a **shared edge**.

---

## 1. Shared vs private

- `s-maxage` for shared caches; `private` for user-specific.
- Never put Authorization-bearing personalized bodies on shared caches without
  correct keys / `private`.

---

## 2. Vary discipline

Low-cardinality `Vary`. High-cardinality Vary (e.g. Authorization, cookies)
defeats edge caching. Prefer cache keys / surrogate keys over wild Vary.

---

## 3. Quick checklist

- [ ] `s-maxage` vs `private` correct.
- [ ] No auth data on shared cache.
- [ ] Surrogate-Key tags for purge.
- [ ] Vary list minimal and intentional.
- [ ] stale-while-revalidate considered.

See [reference.md](reference.md) and [examples.md](examples.md).
