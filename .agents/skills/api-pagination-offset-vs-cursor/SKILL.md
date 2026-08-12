---
name: api-pagination-offset-vs-cursor
description: >-
  Choose and implement REST collection pagination: offset/limit vs keyset
  cursor, Link headers vs meta, deterministic sort, and limit caps. Use when
  designing list endpoints, fixing page drift, or reviewing OpenAPI paging.
trigger: >-
  pagination, cursor pagination, keyset, offset limit, page number, Link
  header next prev, has_more, collection paging
---

# Pagination: Offset vs Cursor

Use this skill when paginating **collection list endpoints**. Always paginate
large collections; cap `limit` server-side.

---

## 1. Offset / limit

```http
GET /orders?limit=50&offset=150
```

Easy; supports jump-to-page. Slow at huge offsets; **drifts** under concurrent
writes (duplicates/skips). Use for small/stable data and admin UIs.

---

## 2. Cursor / keyset (production default at scale)

```http
GET /orders?limit=50&cursor=<opaque>
```

Encode last sort keys (often base64 of `created_at` + `id`). Query with
indexed `WHERE … ORDER BY … LIMIT n`. Stable under inserts/deletes; no
arbitrary page jump.

Require **deterministic sort** with a tie-breaker (`id`).

---

## 3. Composition

Processing order: **filter → sort → paginate**.

Navigation: RFC 8288 `Link` (`next`/`prev`) **or** `meta.pagination` — one
style per API.

---

## 4. Quick checklist

- [ ] Default + max `limit` documented and enforced.
- [ ] Strategy matches write rate / table size (cursor for large/high-write).
- [ ] Opaque cursors; indexed sort columns + tie-breaker.
- [ ] `next`/`prev` links (header or meta).
- [ ] Filter → sort → paginate order.
- [ ] Total count optional and documented as expensive if present.

See [reference.md](reference.md) and [examples.md](examples.md).
