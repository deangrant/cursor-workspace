# REST API Design Principles — Examples

See [SKILL.md](SKILL.md) for rules.

---

## Example 1: Resource + representation

**Prefer**

```http
GET /orders/42 HTTP/1.1
Accept: application/json
```

```http
HTTP/1.1 200 OK
Content-Type: application/json

{ "id": 42, "status": "shipped" }
```

**Avoid:** tunneling `getOrder` via `POST /rpc` with a procedure name.

---

## Example 2: Create with 201

**Prefer**

```http
POST /orders HTTP/1.1
Content-Type: application/json

{ "sku": "ABC", "qty": 1 }
```

```http
HTTP/1.1 201 Created
Location: /orders/42
```

**Avoid:** `200 OK` with no `Location` for a newly created resource.

---

## Example 3: Status vs in-body error

**Prefer**

```http
HTTP/1.1 422 Unprocessable Content
Content-Type: application/problem+json

{
  "type": "https://api.example.com/errors/validation",
  "title": "Validation failed",
  "status": 422,
  "detail": "qty must be >= 1"
}
```

**Avoid**

```http
HTTP/1.1 200 OK
Content-Type: application/json

{ "success": false, "error": "qty must be >= 1" }
```

---

## Example 4: Safe GET

**Prefer:** `DELETE /orders/42`

**Avoid:** `GET /orders/42/delete`
