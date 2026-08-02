---
name: api-resource-naming-uri-design
description: >-
  Design and review REST API resource names and URIs. Use when creating or
  reviewing endpoints, choosing path vs query parameters, nesting collections,
  casing path segments, plural collection names, versioning in the path, or
  running an API design review for URI consistency.
trigger: >-
  REST API URI design, resource naming, endpoint naming, path vs query,
  plural collections, nesting depth, kebab-case paths, API versioning path
  prefix, OpenAPI path review, URI anti-patterns
---

# API Resource Naming and URI Design

Use this skill when you design or review **REST resource URIs**. URIs are the
public contract of an API — the first thing developers read and the hardest
thing to change once clients depend on them.

Goal: a scheme so regular developers **guess the next endpoint correctly**.

Resource modeling granularity, full filter/sort conventions, and deep
versioning tradeoffs are out of scope here (see [reference.md](reference.md)).

---

## 1. Nouns, not verbs

A URI names a **resource**, not an action. The **HTTP method** supplies the
verb.

```http
GET    /orders          # list
POST   /orders          # create
GET    /orders/42       # fetch one
DELETE /orders/42       # delete
```

**Avoid** paths that duplicate method semantics: `/getOrders`, `/createOrder`,
`/orders/42/delete`.

**Pragmatic exception** for non-CRUD actions: a controller-style sub-resource.

```http
POST /orders/42/cancel
```

---

## 2. Plural collection names

Collections are **plural**; members append an identifier.

```http
GET /users       # collection
GET /users/7     # one member
```

Pick **plural or singular** and **never mix** — `/user/7` alongside `/orders`
erodes trust.

Use the pattern **`/collection/{id}`** for predictable CRUD.

---

## 3. Nesting and depth

Nest to express **containment**. Stop at **one level** when you can; in
practice keep nesting to about **two levels**.

```http
GET /users/7/orders                    # good
GET /users/7/orders/42/items/9/tax   # too deep — brittle, verbose
```

Once a resource has its own ID, **address it directly**.

```http
GET /orders/42/items    # acceptable
GET /items/9            # prefer over deep hierarchy
```

For deeper relationships, flatten, use a dedicated endpoint, or put links in
the response body.

---

## 4. Casing and formatting

Prefer **kebab-case** lowercase path segments.

| Style | Example | Verdict |
| ----- | ------- | ------- |
| **kebab-case** | `/shipping-addresses` | **Preferred** |
| snake_case | `/shipping_addresses` | Avoid in paths |
| camelCase | `/shippingAddresses` | Avoid in paths |

Also:

- Use **lowercase** path segments.
- Put **no file extensions** (`.json`) in paths — use the `Accept` header.
- Pick **one trailing-slash policy** and enforce it.

JSON field casing (snake vs camel) is separate — stay **consistent** in
response bodies too.

---

## 5. Path vs query parameters

| Parameter type | Use for | Example |
| -------------- | ------- | ------- |
| **Path** | Identify a **specific resource** | `GET /orders/42` |
| **Query** | **Filter**, **sort**, **paginate** a collection | `GET /orders?status=shipped&sort=-created_at` |

Rule of thumb: if removing the parameter still leaves a valid meaningful
resource, put it in the **query string**.

---

## 6. Versioning in the path

A common operational approach is a version prefix:

```http
GET /v1/orders
GET /v2/orders
```

**Pros:** obvious in logs, proxies, browser testing, and cache keys.  
**Cons:** URL pollution; harder HATEOAS link maintenance.

Header or media-type versioning is more "pure" but harder to debug. Whichever
you choose: **be consistent and document it**.

---

## 7. Consistency above all

The highest-value property of a URI scheme is **internal consistency**:

- Same **ID format** everywhere (UUID vs integer).
- Same **filter param** conventions on every collection.
- Same **nesting depth** rules.
- Same **versioning** mechanism.

Write the rules down. Enforce them in API design review and OpenAPI linting.

---

## 8. Quick checklist

- [ ] Nouns in paths; HTTP methods for actions.
- [ ] Plural collections; `/collection/{id}` pattern.
- [ ] ≤1–2 nesting levels; flatten or link beyond that.
- [ ] **kebab-case** lowercase paths.
- [ ] Path = identity; query = filter/sort/page.
- [ ] Version prefix or documented alternative.
- [ ] No `.json` in paths — negotiate media type with `Accept`.
- [ ] Consistency rules written and reviewed.

See [reference.md](reference.md) for anti-patterns. See [examples.md](examples.md)
for good vs bad URI samples.
