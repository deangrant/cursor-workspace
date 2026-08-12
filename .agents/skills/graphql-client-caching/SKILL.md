---
name: graphql-client-caching
description: >-
  Design GraphQL client cache normalization with global IDs, Node refetch, field
  stability, and mutation cache updates. Use when configuring Apollo/Relay-style
  stores or debugging duplicate entities.
trigger: >-
  GraphQL client cache, normalized store, global ID, Node refetch, __typename,
  Apollo cache, Relay store
---

# GraphQL Client Caching

Use this skill for **client normalized stores** (not CDN/Redis origin cache).

---

## 1. Global keys

Cacheable entities expose a stable global `id`. Implement `Node` + `node(id:)`
for refetch. Resolvers enforce field stability (same id → equal object).

---

## 2. ID encoding

Prefer UUIDs; else `Type:localId` (+ optional base64). Migration: expose
`previousApiId` for legacy consumers. Do not silently rename `id`.

---

## 3. Store behavior

Merge overlapping queries into one map. Update/invalidate by global id after
mutations. Auth-denied null fields must not corrupt unrelated entities.
Document if clients may key via `__typename` + local id instead.

---

## 4. Quick checklist

- [ ] Global IDs on cacheable types.
- [ ] Node refetch path.
- [ ] Mutation updates by id.
- [ ] No nested objects without identity in cacheable graphs.

See [reference.md](reference.md) and [examples.md](examples.md).
