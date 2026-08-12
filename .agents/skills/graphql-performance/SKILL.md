---
name: graphql-performance
description: >-
  Improve GraphQL performance with DataLoader batching, demand control,
  compression, persisted queries, and operation-level tracing. Use when fixing
  N+1 resolvers or slow GraphQL operations.
trigger: >-
  GraphQL performance, DataLoader, N+1, APQ, persisted queries, GraphQL
  tracing, resolver batching
---

# GraphQL Performance

Use this skill when GraphQL is **slow or chatty** under load.

---

## 1. Client

Normalized store + global IDs to avoid redundant fetches.

---

## 2. Transport

POST default; GET for cacheable queries when supported. Persisted/trusted
queries when URLs are long. Enable gzip/brotli.

---

## 3. Resolvers

**DataLoader** (or equivalent) per entity to batch N+1. Per-request loader
cache. Domain batch methods in the business layer. Consider selection-set → SQL
when ORM allows.

---

## 4. Demand control + observability

Paginate; max `first`; depth/breadth/complexity limits; gateway rate limits.
Trace by `operationName` and field path; OTel; latency/error metrics.

---

## 5. Quick checklist

- [ ] No 1-query-per-list-item resolvers.
- [ ] Loaders scoped per request.
- [ ] Caps on depth/`first`/complexity.
- [ ] Field-level traces for slow paths.

See [reference.md](reference.md) and [examples.md](examples.md).
