---
name: graphql-pagination-connections
description: >-
  Design GraphQL list pagination with Relay connections, opaque cursors,
  PageInfo, and max first caps. Use when adding or reviewing paginated GraphQL
  fields.
trigger: >-
  GraphQL pagination, Relay connection, edges pageInfo, opaque cursor, first
  after, GraphQL connection spec
---

# GraphQL Pagination Connections

Use this skill for **list fields that may grow**. Prefer Relay-style
**connections** over unbounded `[Type!]!`.

---

## 1. When to paginate

Any growing list (friends, messages, orders, search). Small fixed sets may stay
as plural lists.

---

## 2. Cursor model

Prefer **opaque cursors** over offset. Clients must not parse cursor format.
Backend may encode keyset/sort keys; change without breaking clients. Avoid
`after: ID` that leaks primary keys as the pagination contract.

---

## 3. Connection shape

- Connection: `edges`, `pageInfo` (required); optional `totalCount`, shortcut list.
- Edge: `node` + `cursor`; edge-only metadata on Edge.
- `PageInfo`: `hasNextPage`, `endCursor`, `startCursor` (and prev counterparts if bidirectional).

Follow the Relay Connection spec for interoperability.

---

## 4. Resolver / abuse

Decode cursor → keyset/seek, not huge OFFSET. Cap `first` (demand control).
Index sort keys. Clients use `hasNextPage` + `endCursor`, not empty edges alone.

---

## 5. Quick checklist

- [ ] No unbounded lists for open-ended domains.
- [ ] Opaque cursors; connection + PageInfo.
- [ ] Max `first` enforced.
- [ ] Keyset-friendly resolver indexes.

See [reference.md](reference.md) and [examples.md](examples.md).
