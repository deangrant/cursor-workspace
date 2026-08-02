# API Resource Naming and URI Design — Reference

Quick lookup for the skill rules. See [SKILL.md](SKILL.md) for full guidance
and [examples.md](examples.md) for HTTP samples.

## Casing and formatting

| Style | Example | Verdict |
| ----- | ------- | ------- |
| **kebab-case** | `/shipping-addresses` | **Preferred** |
| snake_case | `/shipping_addresses` | Avoid in paths |
| camelCase | `/shippingAddresses` | Avoid in paths |

Also:

- Lowercase path segments.
- No file extensions (`.json`) — use `Accept`.
- One trailing-slash policy, enforced.

JSON body field casing is separate; keep response bodies consistent.

## Path vs query parameters

| Parameter type | Use for | Example |
| -------------- | ------- | ------- |
| **Path** | Identify a **specific resource** | `GET /orders/42` |
| **Query** | **Filter**, **sort**, **paginate** a collection | `GET /orders?status=shipped&sort=-created_at` |

If removing the parameter still leaves a valid meaningful resource, put it in
the query string.

## Nesting depth

| Pattern | Verdict |
| ------- | ------- |
| `/users/7/orders` | Good containment |
| `/orders/42/items` | Acceptable |
| `/items/9` | Prefer once the resource has its own ID |
| `/users/7/orders/42/items/9/tax` | Too deep |

Guideline: about **1–2 levels** max in practice.

## Anti-patterns

| Anti-pattern | Problem | Example |
| ------------ | ------- | ------- |
| Verb paths | Duplicates HTTP method semantics | `/getUserOrders` |
| Mixed singular/plural | Inconsistent contract | `/user/7` + `/orders` |
| Deep nesting | Brittle, verbose URLs | `/a/b/c/d/e` |
| DB table names in URL | Leaks schema; couples to storage | `/tbl_order_line` |
| GET mutations | Unsafe side effects via GET | `/users/123/delete` |
| Query for identity | Path already identifies the resource | `/orders?id=42` when `/orders/42` suffices |

## API design checklist

- [ ] Nouns in paths; HTTP methods for actions.
- [ ] Plural collections; `/collection/{id}` pattern.
- [ ] ≤1–2 nesting levels; flatten or link beyond that.
- [ ] **kebab-case** lowercase paths.
- [ ] Path = identity; query = filter/sort/page.
- [ ] Version prefix or documented alternative.
- [ ] No `.json` in paths — negotiate media type with `Accept`.
- [ ] Consistency rules written and reviewed (ID format, filters, nesting,
      versioning).

## Out of scope (related topics)

This skill does not define full conventions for:

- Resource modeling granularity
- Filter / sort / search query dialects
- Pagination strategies
- Deep versioning tradeoffs (header vs media type vs path)
- HATEOAS link design
- OpenAPI lint rule sets
