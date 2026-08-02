# API Filtering, Sorting, and Search — Examples

See [SKILL.md](SKILL.md) for rules. See [reference.md](reference.md) for
tables and the checklist.

---

## Example 1: Flat filters

```http
GET /orders?status=shipped&currency=USD
```

**Tie-back:** One query param per field — fine for small APIs with few filters.

---

## Example 2: Bracketed filter namespace

```http
GET /orders?filter[status]=shipped&filter[currency]=USD
```

**Tie-back:** Separates filters from `sort` and `page` control params.

---

## Example 3: Operators

```http
GET /orders?filter[status]=shipped
GET /orders?filter[total][gte]=100
GET /orders?filter[created_at][lt]=2026-01-01
GET /orders?filter[status]=shipped,delivered
GET /orders?filter[status][ne]=cancelled
```

**Tie-back:** Document supported operators; reject unknown ones with 400.

---

## Example 4: Sorting

```http
GET /orders?sort=-created_at,total
```

**Tie-back:** Newest first, then `total` ascending. Whitelist sortable fields.

---

## Example 5: Full-text `q` plus structured filter

```http
GET /articles?q=distributed+systems&filter[status]=published
```

**Tie-back:** `q` is fuzzy search; `filter` is exact/structured matching.

---

## Example 6: Filter, sort, and paginate together

```http
GET /orders?filter[status]=shipped&sort=-created_at,id&page[size]=25&page[number]=2
```

**Tie-back:** Process filter → sort → paginate. Include `id` as a tie-breaker.

---

## Example 7: Complex search via POST body

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

**Tie-back:** Use `/collection/search` for OR groups, geospatial shapes, or
long ID lists. Document as an idempotent read.
