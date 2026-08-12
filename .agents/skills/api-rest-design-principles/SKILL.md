---
name: api-rest-design-principles
description: >-
  Apply Fielding REST constraints when designing or reviewing HTTP APIs:
  resources vs representations, statelessness, uniform interface, correct
  verbs and status codes, Richardson Maturity Model. Use when starting a
  REST API, reviewing endpoint semantics, or choosing RMM Level 2 vs 3.
trigger: >-
  REST principles, Fielding, statelessness, uniform interface, HTTP verbs,
  status codes, Richardson Maturity Model, RMM, resource representation
---

# REST API Design Principles

Use this skill when designing or reviewing **REST-style HTTP APIs**. REST is
an **architectural style** (Fielding), not a protocol — most production APIs
adopt a deliberate subset.

URI naming, pagination dialects, and auth schemes are out of scope here (see
[reference.md](reference.md)).

---

## 1. Resources and representations

A **resource** is a named concept (user, order). A **representation** is the
bytes on the wire (JSON, XML). The same resource can have multiple
representations via `Accept` / `Content-Type`.

```http
GET /orders/42
Accept: application/json
```

---

## 2. Statelessness

Every request is self-contained: auth token, tenant, correlation ID. No
server-side client session affinity. Application state lives on the client;
resource state lives on the server. Enables horizontal scale.

---

## 3. Uniform interface

1. Identify resources with URIs.
2. Manipulate through representations.
3. Self-descriptive messages (headers, media types).
4. HATEOAS links for next actions (optional / pragmatic).

Do **not** tunnel all operations through `POST` (RMM Level 0 anti-pattern).

---

## 4. HTTP method semantics

| Method | Semantics | Safe | Idempotent |
| ------ | --------- | ---- | ---------- |
| **GET** | Retrieve | Yes | Yes |
| **POST** | Create / non-idempotent action | No | No* |
| **PUT** | Replace whole resource | No | Yes |
| **PATCH** | Partial update | No | Conditional |
| **DELETE** | Remove | No | Yes |

\*Make POST idempotent with `Idempotency-Key` when duplicates are costly.

Safe methods must **never** mutate state. Never use GET for delete/create/update.

---

## 5. Status codes

Use the **most specific** outcome. Clients must branch on status without
parsing the body first.

| Outcome | Code |
| ------- | ---- |
| OK with body | 200 |
| Created | **201** + `Location` |
| Accepted (async) | **202** |
| No content | **204** |
| Bad syntax | 400 |
| Unauthorized | 401 |
| Forbidden | 403 |
| Not found | 404 |
| Conflict | 409 |
| Payload too large | 413 |
| Unsupported media type | 415 |
| Semantic validation | **422** |
| Gone (sunset) | 410 |

**Never** return `200` with an in-body error flag. Prefer
`application/problem+json` (RFC 9457) for errors.

---

## 6. Richardson Maturity Model

| Level | Meaning | Typical use |
| ----- | ------- | ----------- |
| 0 | HTTP as RPC tunnel | Avoid for public APIs |
| 1 | Resources / URIs | Baseline |
| **2** | Verbs + status codes | **Pragmatic production target** |
| 3 | Hypermedia (HATEOAS) | Loose coupling; higher cost |

---

## 7. Quick checklist

- [ ] Nouns in URIs; HTTP methods for actions.
- [ ] Stateless requests (auth on every call).
- [ ] Correct verb semantics; GET never mutates.
- [ ] Specific status codes; never 200 + error body.
- [ ] 201 + `Location` on create; 202 for async work.
- [ ] Documented in OpenAPI with working examples.
- [ ] Target RMM Level 2 unless hypermedia is required.

See [reference.md](reference.md) for anti-patterns. See [examples.md](examples.md)
for HTTP samples.
