---
name: api-http-caching-conditional-requests
description: >-
  Apply HTTP caching and conditional requests for REST APIs: Cache-Control,
  ETag, If-None-Match 304, and private vs public caches. Use when optimizing
  GET performance or reviewing cache headers.
trigger: >-
  Cache-Control, ETag, If-None-Match, 304 Not Modified, HTTP caching, max-age,
  private cache, API cache headers
---

# HTTP Caching and Conditional Requests

Use this skill when making **safe GETs** cheaper via caches and validators.

---

## 1. Cache-Control

Common directives: `max-age`, `s-maxage` (shared), `private` / `public`,
`no-store`, `must-revalidate`, `stale-while-revalidate`.

User-specific data: `private` + `Vary: Authorization` (or equivalent).

---

## 2. Validators

Strong **ETag** (or `Last-Modified`). Client sends `If-None-Match` → **304**
when unchanged. Pair with caching for revalidation.

Mutations and contested updates use `If-Match` (see conditional-requests skill).

---

## 3. Quick checklist

- [ ] Cache-Control correct for public vs private data.
- [ ] ETag or Last-Modified on cacheable GETs.
- [ ] 304 path implemented.
- [ ] Vary set when representation differs by header.
- [ ] No caching of sensitive responses on shared caches.

See [reference.md](reference.md) and [examples.md](examples.md).
