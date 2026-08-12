# REST API Design Principles — Reference

See [SKILL.md](SKILL.md) for full guidance and [examples.md](examples.md) for
HTTP samples.

## Method semantics

| Method | Use for | Notes |
| ------ | ------- | ----- |
| GET | Read | Cacheable when public/keyed correctly |
| POST | Create, controllers, search body | Not idempotent unless keyed |
| PUT | Full replace | Client sends complete representation |
| PATCH | Partial update | Prefer RFC 6902 or 7386 media types |
| DELETE | Remove | Idempotent; often 204 |

## Status code pairing

| Situation | Prefer |
| --------- | ------ |
| Malformed JSON / syntax | 400 |
| Auth missing/invalid | 401 + `WWW-Authenticate` |
| Authenticated but not allowed | 403 |
| Unknown resource | 404 |
| Retired resource | 410 |
| State conflict / in-flight idempotency | 409 |
| Schema/semantic validation | 422 |
| Wrong `Content-Type` | 415 |
| Oversized body | 413 |
| Dependency down (readiness) | 503 |

## Anti-patterns

| Anti-pattern | Problem |
| ------------ | ------- |
| POST-everything | Hides caching, safety, semantics |
| `200` + `{ "success": false }` | Breaks proxies, clients, caches |
| Session-sticky “REST” | Breaks stateless scale-out |
| GET mutations | Unsafe, cached, logged as reads |
| Treating resource ≡ one JSON doc | Blocks content negotiation |

## Out of scope

- URI naming conventions (separate skill)
- Pagination, filtering, auth, versioning depth
- Full HATEOAS format design

## Sources

- apiguide.dev REST principles
- Fielding REST dissertation; RFC 9110 HTTP semantics
- Richardson Maturity Model (QCon 2008)
