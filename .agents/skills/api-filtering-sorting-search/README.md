# API Filtering, Sorting, and Search (Skill)

Agent skill for designing and reviewing **REST collection query conventions**:
filtering, sorting, full-text search, operators, pagination interplay, and
complex `POST /search` bodies.

## When to use

- **Design or review** collection GET query parameters or search endpoints.
- **Keywords**: filtering, sorting, search, `filter[field]`, `sort=-field`,
  `q`, operators, pagination with filters, `POST /search`.
- **Decisions**: flat vs bracketed filters; which operators to support; how to
  separate fuzzy search from structured filters; when query strings are too
  large or complex for GET.

## What this skill covers

- **Filter style** — one convention (flat or `filter[…]`) across the API.
- **Operators** — equality, comparisons, `in`, `ne`; document; reject unknown
  with 400.
- **Sorting** — single `sort` param; whitelist fields; descending via `-`.
- **Searching** — `q` for fuzzy text; keep separate from structured filters.
- **Pagination interplay** — filter → sort → paginate; deterministic
  tie-breakers.
- **Complex queries** — `POST /collection/search` with a JSON body.
- **Caching** — GET filter/sort cacheability; private + `Vary` for user lists.

## Files

| File | Purpose |
| ---- | ------- |
| [SKILL.md](SKILL.md) | Skill definition: rules, checklist (used by the agent) |
| [reference.md](reference.md) | Tables, checklist, out-of-scope topics |
| [examples.md](examples.md) | Numbered HTTP query and search samples |

## See also

- Narrative and triggers: [SKILL.md](SKILL.md)
- Lookup and checklists: [reference.md](reference.md)
- Copy-paste examples: [examples.md](examples.md)
