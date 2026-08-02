# API Resource Naming and URI Design — Examples

See [SKILL.md](SKILL.md) for rules. See [reference.md](reference.md) for
tables and the checklist.

---

## Example 1: CRUD with nouns and HTTP methods

**Prefer**

```http
GET    /orders
POST   /orders
GET    /orders/42
DELETE /orders/42
```

**Avoid**

```http
GET    /getOrders
POST   /createOrder
DELETE /orders/42/delete
```

**Tie-back:** The path names the resource; the method is the verb.

---

## Example 2: Plural collections

**Prefer**

```http
GET /users
GET /users/7
```

**Avoid**

```http
GET /user/7
GET /orders
```

**Tie-back:** Pick plural (or singular) once and never mix.

---

## Example 3: Nesting depth

**Prefer**

```http
GET /users/7/orders
GET /orders/42/items
GET /items/9
```

**Avoid**

```http
GET /users/7/orders/42/items/9/tax
```

**Tie-back:** Nest for containment; once a resource has an ID, address it
directly.

---

## Example 4: Non-CRUD controller action

**Prefer**

```http
POST /orders/42/cancel
```

**Avoid**

```http
GET /orders/42/cancel
POST /cancelOrder
```

**Tie-back:** Use a sub-resource for intent; keep the HTTP method meaningful.

---

## Example 5: Path vs query

**Prefer**

```http
GET /orders/42
GET /orders?status=shipped&sort=-created_at
```

**Avoid**

```http
GET /orders?id=42
GET /orders/shipped
```

**Tie-back:** Path identifies one resource; query filters or sorts a
collection.

---

## Example 6: Casing

**Prefer**

```http
GET /shipping-addresses
GET /shipping-addresses/19
```

**Avoid**

```http
GET /shipping_addresses
GET /shippingAddresses
GET /shipping-addresses.json
```

**Tie-back:** kebab-case lowercase paths; negotiate format with `Accept`.

---

## Example 7: Version prefix

**Prefer (when using path versioning)**

```http
GET /v1/orders
GET /v2/orders
```

**Tie-back:** Be consistent and document the versioning mechanism. Do not mix
path, header, and media-type versioning without a clear policy.

---

## Example 8: Anti-pattern contrasts

| Bad | Better |
| --- | ------ |
| `GET /getUserOrders` | `GET /users/7/orders` |
| `GET /users/123/delete` | `DELETE /users/123` |
| `GET /orders?id=42` | `GET /orders/42` |
| `GET /tbl_order_line/9` | `GET /order-lines/9` |
