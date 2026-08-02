---
name: api-filtering-sorting-search
description: >-
  Design and review REST collection filtering, sorting, and search query
  conventions. Use when choosing flat vs bracketed filters, encoding operators,
  defining sort parameters, separating full-text q from structured filters,
  composing with pagination, or moving complex queries to POST /search.
trigger: >-
  API filtering, sorting, search query parameters, filter operators, sort=-field,
  full-text q, filter[field], collection query string, POST search endpoint,
  pagination with filters, OpenAPI query params
---

# API Filtering, Sorting, and Search

Use this skill when you design or review **collection query parameters**.
Clients need to **narrow**, **order**, and **search** — put these operations in
the **query string of GET** so they stay **safe**, **cacheable**, and
**bookmarkable**.

Deep pagination strategies, sparse fieldsets, and caching policy details are
out of scope here (see [reference.md](reference.md)).

---

## 1. Design principle

Express real needs without inventing a bespoke query language in the URL.
**Pick one filter style** and apply it everywhere — mixing `status=` and
`filter[status]=` across endpoints confuses clients.

---

## 2. Filtering

Restrict a collection to matching items.

**Flat parameters** — one query param per field (small APIs, few fields):

```http
GET /orders?status=shipped&currency=USD
```

**Bracketed `filter` namespace** — separates filters from control params
(`sort`, `page`); better when many filters and operators:

```http
GET /orders?filter[status]=shipped&filter[currency]=USD
```

| Style | When |
| ----- | ---- |
| **Flat** | Small APIs, few filter fields |
| **`filter[field]`** | Many filters + operators; clearer namespace |

---

## 3. Operators

Equality alone is insufficient. Encode the operator as a nested bracket (or
documented suffix):

| Intent | Example |
| ------ | ------- |
| Equals | `filter[status]=shipped` |
| Greater than or equal | `filter[total][gte]=100` |
| Less than | `filter[created_at][lt]=2026-01-01` |
| In a set | `filter[status]=shipped,delivered` |
| Not equal | `filter[status][ne]=cancelled` |

**Document supported operators explicitly.** Reject unknown operators or fields
with **400 Bad Request**. Silently ignoring them returns unfiltered data and
hides client bugs.

---

## 4. Sorting

Use a single **`sort`** parameter — a comma-separated field list. Prefix **`-`**
for descending; ascending is the default:

```http
GET /orders?sort=-created_at,total
```

Reads as: newest first, then by `total` ascending.

**Whitelist sortable fields** on the server. Passing arbitrary column names into
SQL causes errors and injection risk.

---

## 5. Searching

| Mechanism | Purpose |
| --------- | ------- |
| **`filter[...]`** | Exact / structured field matching |
| **`q`** | Fuzzy full-text search (human-entered terms) |

```http
GET /articles?q=distributed+systems&filter[status]=published
```

Combine **`q`** with filters to search within a filtered subset. Do not overload
`filter` for fuzzy text — keep semantics clear.

Some APIs use `?search=` instead of `?q=` — **document one convention** and use
it everywhere.

---

## 6. Interplay with pagination

Filter, sort, and paginate compose in one GET:

```http
GET /orders?filter[status]=shipped&sort=-created_at,id&page[size]=25&page[number]=2
```

**Processing order:** filter → sort → paginate — so page boundaries stay stable
and meaningful.

**Deterministic sort is required** for reliable pagination. If two rows share
`created_at`, add a tie-breaker (e.g. **`id`**) — otherwise cursor or offset
pages drift.

Bracketed page params (`page[size]`, `page[number]`) pair naturally with
bracketed filters; limit/offset and cursor strategies also work — pick **one
pagination style** per API.

---

## 7. When to use POST search (or QUERY)

Query strings have practical limits (~**8 KB** on many proxies) and encode
nested logic poorly. Move complex queries to a **request body**:

| Trigger | Example |
| ------- | ------- |
| Boolean OR/AND groups | `{ "or": [ … ] }` |
| Geospatial shapes | Polygon / radius filters |
| Long ID lists | Hundreds of UUIDs |

```http
POST /orders/search HTTP/1.1
Content-Type: application/json

{
  "filter": {
    "or": [
      { "status": "shipped" },
      { "total": { "gte": 500 } }
    ]
  },
  "sort": ["-created_at"]
}
```

**`/collection/search`** is the pragmatic pattern today — document **idempotent
read** semantics even though the method is POST (no server state change).

The draft HTTP **`QUERY`** method aims to be a safe, cacheable request with a
body. Until broadly supported, documented **`POST …/search`** is the reliable
option.

---

## 8. Caching implications

GET queries with filters and sort are **cacheable** when responses are public
or keyed correctly. User-specific filtered lists need **`private`** cache and
**`Vary: Authorization`**.

---

## 9. Quick checklist

- [ ] One filter convention (flat or `filter[…]`) — consistent across endpoints.
- [ ] Document operators; **400** on unknown operator or field.
- [ ] Whitelist **sortable** and **filterable** fields.
- [ ] **`q`** (or one documented alias) separate from structured filters.
- [ ] Deterministic sort (tie-breaker field) when paginating.
- [ ] Filter → sort → paginate processing order.
- [ ] Complex queries → **`POST /search`** JSON body.
- [ ] Document query parameters in the API spec.

See [reference.md](reference.md) for lookup tables. See [examples.md](examples.md)
for HTTP samples.
