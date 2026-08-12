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
- **`examples.md`** – (optional) runnable or copy-paste examples.

## Available skills

| Skill | Description |
| ----- | ----------- |
| [api-async-long-running-operations](./api-async-long-running-operations/) | 202 Accepted + job resources, polling, Prefer respond-async, webhooks. |
| [api-authentication-schemes](./api-authentication-schemes/) | Bearer, Basic (TLS-only), HTTP message signatures. |
| [api-authorization-rbac-abac](./api-authorization-rbac-abac/) | RBAC/ABAC/ReBAC, PEP/PDP, anti-BOLA/BFLA. |
| [api-bulk-batch-operations](./api-bulk-batch-operations/) | Bulk endpoints, partial success, async bulk jobs. |
| [api-cache-invalidation-strategies](./api-cache-invalidation-strategies/) | TTL, ETag revalidation, SWR, Surrogate-Key purge. |
| [api-cdn-edge-caching](./api-cdn-edge-caching/) | s-maxage, Vary, Surrogate-Key, auth pitfalls. |
| [api-conditional-requests-validation](./api-conditional-requests-validation/) | If-Match, strong ETags, 412/428. |
| [api-content-negotiation-media-types](./api-content-negotiation-media-types/) | Accept/Content-Type, 406/415, Vary. |
| [api-cors](./api-cors/) | Preflight, Allow-* headers, credentials. |
| [api-deprecation-sunsetting](./api-deprecation-sunsetting/) | Deprecation/Sunset/Link, 410 Gone. |
| [api-file-uploads-downloads](./api-file-uploads-downloads/) | Multipart, presigned, Range/206. |
| [api-filtering-sorting-search](./api-filtering-sorting-search/) | Collection filters, sort, `q`, POST /search. |
| [api-hateoas-hypermedia](./api-hateoas-hypermedia/) | Pragmatic HAL/JSON:API links. |
| [api-health-check-status-endpoints](./api-health-check-status-endpoints/) | Liveness/readiness/startup probes. |
| [api-http-caching-conditional-requests](./api-http-caching-conditional-requests/) | Cache-Control, ETag, 304. |
| [api-http-compression](./api-http-compression/) | Brotli/gzip, Accept-Encoding, BREACH. |
| [api-i18n-localization](./api-i18n-localization/) | Accept-Language, country params, UTC. |
| [api-idempotency-request-retries](./api-idempotency-request-retries/) | Idempotency-Key for safe POST retries. |
| [api-input-validation-injection](./api-input-validation-injection/) | Schema allowlists, injection, mass assignment. |
| [api-media-types-vendor-content-types](./api-media-types-vendor-content-types/) | vnd types, +json, MIME versioning. |
| [api-mtls-client-certificates](./api-mtls-client-certificates/) | mTLS, cert-bound tokens, proxy pitfalls. |
| [api-multi-tenancy-patterns](./api-multi-tenancy-patterns/) | Silo/pool/bridge, verified tenantId. |
| [api-oauth-api-keys](./api-oauth-api-keys/) | API keys vs OAuth flows, scopes. |
| [api-observability-distributed-tracing](./api-observability-distributed-tracing/) | JSON logs, RED, W3C, OpenTelemetry. |
| [api-pagination-offset-vs-cursor](./api-pagination-offset-vs-cursor/) | Offset vs keyset cursor pagination. |
| [api-patch-strategies](./api-patch-strategies/) | JSON Patch vs Merge Patch. |
| [api-rate-limiting](./api-rate-limiting/) | Quotas, RateLimit-* headers, 429 vs 503. |
| [api-request-signing](./api-request-signing/) | HMAC, SigV4, RFC 9421. |
| [api-resource-naming-uri-design](./api-resource-naming-uri-design/) | Nouns, plural collections, kebab-case URIs. |
| [api-response-envelope-design](./api-response-envelope-design/) | Enveloped vs bare bodies. |
| [api-rest-design-principles](./api-rest-design-principles/) | Fielding REST, verbs/status, RMM. |
| [api-retries-backoff-resilience](./api-retries-backoff-resilience/) | Backoff+jitter, Retry-After, circuit breakers. |
| [api-security-best-practices](./api-security-best-practices/) | OWASP API Top 10 checklist. |
| [api-sparse-fieldsets-partial-responses](./api-sparse-fieldsets-partial-responses/) | `?fields=`, include/expand caps. |
| [api-standardized-error-handling](./api-standardized-error-handling/) | RFC 9457 problem+json. |
| [api-streaming-sse-websocket-long-polling](./api-streaming-sse-websocket-long-polling/) | SSE vs WebSocket vs long-poll. |
| [api-timestamps-data-formats](./api-timestamps-data-formats/) | RFC 3339, money, enums, casing. |
| [api-token-lifecycle](./api-token-lifecycle/) | Rotation, refresh, revocation. |
| [api-versioning-strategies](./api-versioning-strategies/) | URI/header/query/media versioning. |
| [api-webhook-signature-verification](./api-webhook-signature-verification/) | HMAC raw body verify, replay window. |
| [api-webhooks-event-driven](./api-webhooks-event-driven/) | Outbound webhook delivery/retries. |
| [bff-pattern](./bff-pattern/) | Backend-for-Frontend adopt/skip and design. |
| [caching-at-scale](./caching-at-scale/) | Cache-aside, stampede prevention, invalidation. |
| [deepsec-setup-ci](./deepsec-setup-ci/) | Vercel deepsec init, config, PR/CI scanning. |
| [graphql-authorization](./graphql-authorization/) | Field-level auth via shared business layer. |
| [graphql-client-caching](./graphql-client-caching/) | Normalized store, global IDs, Node refetch. |
| [graphql-error-debugging](./graphql-error-debugging/) | Triage HTTP status vs data/errors body. |
| [graphql-http-transport](./graphql-http-transport/) | Single endpoint, POST/GET, media types, 2xx partial. |
| [graphql-pagination-connections](./graphql-pagination-connections/) | Relay connections, opaque cursors, PageInfo. |
| [graphql-performance](./graphql-performance/) | DataLoader N+1, demand control, tracing. |
| [graphql-schema-design](./graphql-schema-design/) | Domain graph, nullability, versionless evolution. |
| [graphql-security](./graphql-security/) | Trusted docs, depth/complexity, introspection. |
| [h3-hexagonal-hierarchical-spatial-index](./h3-hexagonal-hierarchical-spatial-index/) | Uber H3 hexagonal spatial index. |
| [howde-algorithm](./howde-algorithm/) | HoWDe home/work detection from stop sequences. |
| [idempotency-distributed-patterns](./idempotency-distributed-patterns/) | Idempotency store, outbox, consumer dedupe. |
| [load-balancing-algorithms](./load-balancing-algorithms/) | L4/L7, RR, least-conn, consistent hash/Maglev. |
| [observability-wide-events](./observability-wide-events/) | Wide/canonical events, tail sampling, OTel attrs. |
| [polars-rust](./polars-rust/) | Polars (Rust) performance best practices. |
| [postgresql-production-scale](./postgresql-production-scale/) | Replicas, PgBouncer isolation, query hygiene. |
| [rate-limiter-algorithms](./rate-limiter-algorithms/) | Token bucket/windows, keys, Redis/Lua distribution. |
| [redis-scaling](./redis-scaling/) | Sentinel/Cluster, hot keys, pipelining, maxmemory. |
| [solid-rust](./solid-rust/) | SOLID in Rust with traits and DI. |
| [typescript-project-structure](./typescript-project-structure/) | React + TypeScript layered project structure. |
| [zaproxy-api-scan-ci](./zaproxy-api-scan-ci/) | OWASP ZAP Docker baseline/full/API scans in CI. |

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
