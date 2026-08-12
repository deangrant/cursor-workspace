# Agent Skills

A collection of reusable agent skills for domain knowledge and specialized
guidance. Canonical location in this workspace: `.agents/skills/`.

## What’s in this directory

Each subfolder is a self-contained skill with:

- **`SKILL.md`** – the skill the agent uses (name, description, when to use, and
  domain content).
- **`README.md`** – (optional) human-facing overview of the skill and how to use
  it.
- **`reference.md`** – (optional) quick reference, links, or API notes.
- **`examples.md`** – (optional) runnable or copy-paste examples (naming varies
  by skill; some use `example.md`).

## Available skills

| Skill | Description |
| ----- | ----------- |
| [api-async-long-running-operations](./api-async-long-running-operations/) | 202 Accepted + job resources, polling, Prefer respond-async, webhooks for long-running work. |
| [api-authentication-schemes](./api-authentication-schemes/) | Bearer, Basic (TLS-only), and HTTP message signatures (RFC 6750/7617/9421). |
| [api-authorization-rbac-abac](./api-authorization-rbac-abac/) | RBAC/ABAC/ReBAC, PEP/PDP, OAuth scopes, anti-BOLA/BFLA object checks. |
| [api-bulk-batch-operations](./api-bulk-batch-operations/) | Bulk endpoints, ordered operations/results, partial success, async bulk jobs. |
| [api-cache-invalidation-strategies](./api-cache-invalidation-strategies/) | TTL, ETag revalidation, stale-while-revalidate, Surrogate-Key purge. |
| [api-cdn-edge-caching](./api-cdn-edge-caching/) | s-maxage, Vary cardinality, Surrogate-Key, auth pitfalls on shared caches. |
| [api-conditional-requests-validation](./api-conditional-requests-validation/) | If-Match / If-Unmodified-Since, strong ETags, 412/428 optimistic concurrency. |
| [api-content-negotiation-media-types](./api-content-negotiation-media-types/) | Accept/Content-Type negotiation, q-values, 406/415, Vary. |
| [api-cors](./api-cors/) | Simple vs preflight CORS, Allow-* headers, credentials, origin allowlists. |
| [api-deprecation-sunsetting](./api-deprecation-sunsetting/) | Deprecation/Sunset/Link headers, 410 Gone, migration timelines. |
| [api-file-uploads-downloads](./api-file-uploads-downloads/) | Multipart, presigned, resumable uploads; Range/206 downloads; magic-byte validation. |
| [api-filtering-sorting-search](./api-filtering-sorting-search/) | REST collection filtering, sorting, and search: flat vs `filter[field]`, operators, `sort`, full-text `q`, pagination interplay, `POST /search` for complex queries. |
| [api-hateoas-hypermedia](./api-hateoas-hypermedia/) | Pragmatic HATEOAS with HAL/JSON:API links, self/next, state transitions. |
| [api-health-check-status-endpoints](./api-health-check-status-endpoints/) | Liveness/readiness/startup probes, health+json, dependency criticality. |
| [api-http-caching-conditional-requests](./api-http-caching-conditional-requests/) | Cache-Control, ETag, If-None-Match → 304, private vs public caches. |
| [api-http-compression](./api-http-compression/) | Brotli/gzip/zstd, Accept-Encoding, Vary, BREACH mitigations. |
| [api-i18n-localization](./api-i18n-localization/) | Accept-Language, UTC timestamps, country/region params for business rules. |
| [api-idempotency-request-retries](./api-idempotency-request-retries/) | Idempotency-Key for safe POST retries, replay store, 409 in-flight. |
| [api-input-validation-injection](./api-input-validation-injection/) | Server-side schema allowlists, injection prevention, mass-assignment guards. |
| [api-media-types-vendor-content-types](./api-media-types-vendor-content-types/) | RFC 6838 trees, vnd types, +json suffix, MIME versioning, nosniff. |
| [api-mtls-client-certificates](./api-mtls-client-certificates/) | mTLS, PKI rotation, RFC 8705 cert-bound tokens, proxy header pitfalls. |
| [api-multi-tenancy-patterns](./api-multi-tenancy-patterns/) | Silo/pool/bridge isolation, verified tenantId, noisy-neighbor limits. |
| [api-oauth-api-keys](./api-oauth-api-keys/) | API keys vs OAuth client credentials vs auth code + PKCE, scopes. |
| [api-observability-distributed-tracing](./api-observability-distributed-tracing/) | JSON logs, RED/USE metrics, W3C traceparent, X-Request-Id, OpenTelemetry. |
| [api-pagination-offset-vs-cursor](./api-pagination-offset-vs-cursor/) | Offset vs keyset cursor pagination, Link headers, deterministic sort. |
| [api-patch-strategies](./api-patch-strategies/) | JSON Patch (RFC 6902) vs Merge Patch (RFC 7386), Accept-Patch, If-Match. |
| [api-rate-limiting](./api-rate-limiting/) | Token bucket/windows, RateLimit-* headers, 429 vs 503, scoping. |
| [api-request-signing](./api-request-signing/) | HMAC, SigV4-style, RFC 9421, Content-Digest, replay defenses. |
| [api-resource-naming-uri-design](./api-resource-naming-uri-design/) | REST API resource naming and URI design: nouns not verbs, plural collections, nesting depth, kebab-case paths, path vs query, path versioning, consistency checklist. |
| [api-response-envelope-design](./api-response-envelope-design/) | Enveloped data/meta vs bare bodies, pagination placement, never 200+error. |
| [api-rest-design-principles](./api-rest-design-principles/) | Fielding REST constraints, statelessness, verbs/status, Richardson Maturity Model. |
| [api-retries-backoff-resilience](./api-retries-backoff-resilience/) | Transient retries, backoff+jitter, Retry-After, timeouts, circuit breakers. |
| [api-security-best-practices](./api-security-best-practices/) | OWASP API Top 10 checklist: TLS, BOLA, secrets, rate limits, least privilege. |
| [api-sparse-fieldsets-partial-responses](./api-sparse-fieldsets-partial-responses/) | `?fields=` allowlists, `?include=`/expand with depth caps, complete defaults. |
| [api-standardized-error-handling](./api-standardized-error-handling/) | RFC 9457 problem+json, field-level errors, status pairing. |
| [api-streaming-sse-websocket-long-polling](./api-streaming-sse-websocket-long-polling/) | SSE vs WebSocket vs long-poll selection, reconnect, when to use 202 jobs. |
| [api-timestamps-data-formats](./api-timestamps-data-formats/) | RFC 3339 UTC, non-float money, string enums, null vs omit, JSON casing. |
| [api-token-lifecycle](./api-token-lifecycle/) | Access/refresh TTLs, rotation, reuse detection, RFC 7009/7662, JWKS, DPoP. |
| [api-versioning-strategies](./api-versioning-strategies/) | URI/header/query/media-type versioning, breaking vs additive changes. |
| [api-webhooks-event-driven](./api-webhooks-event-driven/) | Outbound webhook delivery, retries, 2xx-only success, idempotent receivers. |
| [api-webhook-signature-verification](./api-webhook-signature-verification/) | HMAC-SHA256 raw body verify, constant-time compare, timestamp replay window. |
| [h3-hexagonal-hierarchical-spatial-index](./h3-hexagonal-hierarchical-spatial-index/) | Uber's H3 hexagonal hierarchical spatial index: hexagonal grids, location bucketing, geo-indexing, k-ring neighbors, compact/uncompact, directed edges. |
| [howde-algorithm](./howde-algorithm/) | HoWDe (Home and Work location Detection): detect home/work from stop sequences in Python or Rust, parameter tuning, mobility preprocessing. |
| [polars-rust](./polars-rust/) | Polars (Rust) performance best practices: lazy API, expression-based queries, Cargo features, allocators, tuning for production. |
| [solid-rust](./solid-rust/) | SOLID design principles in Rust: traits as interfaces, SRP/OCP/LSP/ISP/DIP, module boundaries, generics vs `dyn Trait`, dependency injection, refactoring for testability. |
| [typescript-project-structure](./typescript-project-structure/) | React + TypeScript project structure with role-based component layers: core, patterns, containers, layouts, folder-per-component (CSS Modules), pages, hooks, contexts, services, stores, barrel exports, naming rules. |

## How to use

- **In this workspace**: Skills live under `.agents/skills/`. The agent uses
  `SKILL.md` when the description matches the user’s task.
- **As reference**: Open a skill’s `README.md` or `reference.md` for scope and
  details.
- **Per skill**: See each skill’s `README.md` for when it applies and what it
  covers.

## Adding skills

Add new skills as subfolders under `.agents/skills/`: put a `SKILL.md` (with
frontmatter `name` and `description`) and an optional `README.md` in each
folder, then add an entry to the **Available skills** table above.
