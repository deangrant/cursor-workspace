---
name: graphql-schema-design
description: >-
  Design GraphQL schemas as domain graphs with versionless evolution, careful
  nullability, Node global IDs, and a shared business-logic layer. Use when
  creating or reviewing GraphQL types, fields, or schema migrations.
trigger: >-
  GraphQL schema design, nullability, Node interface, schema evolution,
  thinking in graphs, GraphQL types, versionless GraphQL
---

# GraphQL Schema Design

Use this skill when designing or reviewing a **GraphQL schema**. Model a
**domain graph**, not a DB ERD export.

---

## 1. Mindset

- Schema = client-oriented domain graph; storage stays mutable behind resolvers.
- Shared product/engineering language for nouns and relationships.
- Draft example queries; awkward queries mean rename types/fields.

---

## 2. Structure

- Types reference types (navigable graph).
- Paginate growing lists with connections (`first`/`after`).
- Use fragments for repeated field sets.
- Default fields **nullable**; use `!` only when null is unacceptable (errors
  null the parent). Auth-denied → nullable; stable IDs → `ID!`.

---

## 3. Evolution

Prefer **versionless additive** changes (new fields/types). Deprecate before
remove/rename/type-change. Nullability tightenings are breaking.

---

## 4. Global object identification

- `Node` interface with `id: ID!` and root `node(id: ID!): Node`.
- Cacheable entities implement `Node`; same `id` in one query → equal objects.
- Optional plural identifying roots: `[Input!]!` → aligned `[Node]` list with
  nulls for misses.

---

## 5. Business logic

Validation and auth live in **one domain layer**. Resolvers delegate. Share
rules with REST/RPC. GraphQL stays orchestration.

---

## 6. Quick checklist

- [ ] Domain language before types.
- [ ] Connections on unbounded lists.
- [ ] Nullable defaults; deliberate `!`.
- [ ] Additive evolution; deprecate before break.
- [ ] Node + global IDs for cacheable entities.
- [ ] Auth/validation in domain services, not only resolvers.

See [reference.md](reference.md) and [examples.md](examples.md).
