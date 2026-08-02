# API Filtering, Sorting, and Search — Reference

Quick lookup for the skill rules. See [SKILL.md](SKILL.md) for full guidance
and [examples.md](examples.md) for HTTP samples.

## Filter styles

| Style | When | Example |
| ----- | ---- | ------- |
| **Flat** | Small APIs, few filter fields | `GET /orders?status=shipped` |
| **`filter[field]`** | Many filters + operators; clearer namespace | `GET /orders?filter[status]=shipped` |

Pick **one** style and use it on every collection endpoint.

## Operators

| Intent | Example |
| ------ | ------- |
| Equals | `filter[status]=shipped` |
| Greater than or equal | `filter[total][gte]=100` |
| Less than | `filter[created_at][lt]=2026-01-01` |
| In a set | `filter[status]=shipped,delivered` |
| Not equal | `filter[status][ne]=cancelled` |

Document supported operators. Return **400** for unknown operators or fields.

## Search vs filter

| Mechanism | Purpose |
| --------- | ------- |
| **`filter[...]`** (or flat field params) | Exact / structured field matching |
| **`q`** (or one documented alias such as `search`) | Fuzzy full-text search |

Do not overload structured filters for fuzzy text.

## Sorting

- Single `sort` parameter: comma-separated fields.
- Prefix `-` for descending; ascending is default.
- Whitelist sortable fields on the server.
- For pagination, include a deterministic tie-breaker (e.g. `id`).

## Processing order with pagination

1. **Filter**
2. **Sort**
3. **Paginate**

Compose in one GET. Pick one pagination style per API (`page[size]` /
`page[number]`, limit/offset, or cursor).

## When to use POST search

Move to `POST /collection/search` with a JSON body when:

| Trigger | Example |
| ------- | ------- |
| Boolean OR/AND groups | `{ "or": [ … ] }` |
| Geospatial shapes | Polygon / radius filters |
| Long ID lists | Hundreds of UUIDs |
| Query string too large | Practical ~8 KB proxy limits |

Document as an idempotent read (no server state change). Prefer documented
`POST …/search` until a safe-with-body HTTP method is widely supported.

## Caching

| Response type | Guidance |
| ------------- | -------- |
| Public filtered lists | Cacheable when keyed correctly |
| User-specific filtered lists | `private` cache + `Vary: Authorization` |

## API design checklist

- [ ] One filter convention (flat or `filter[…]`) — consistent across endpoints.
- [ ] Document operators; **400** on unknown operator or field.
- [ ] Whitelist **sortable** and **filterable** fields.
- [ ] **`q`** (or one documented alias) separate from structured filters.
- [ ] Deterministic sort (tie-breaker field) when paginating.
- [ ] Filter → sort → paginate processing order.
- [ ] Complex queries → **`POST /search`** JSON body.
- [ ] Document query parameters in the API spec.

## Out of scope (related topics)

This skill does not define full conventions for:

- Pagination strategy choice (offset vs cursor vs keyset)
- Sparse fieldsets / partial responses (`fields`, `include`)
- Detailed HTTP caching and CDN edge rules
- Error response envelope shape
- URI path naming (collection vs identity paths)
