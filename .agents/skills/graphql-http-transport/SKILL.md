---
name: graphql-http-transport
description: >-
  Serve GraphQL over HTTP with a single endpoint, POST/GET contracts, correct
  media types, partial 2xx responses, and auth middleware ordering. Use when
  wiring GraphQL servers or debugging transport mismatches.
trigger: >-
  GraphQL HTTP, /graphql endpoint, application/graphql-response+json, GraphQL
  POST GET, partial response 2xx, GraphQL Content-Type
---

# GraphQL HTTP Transport

Use this skill when configuring **how GraphQL rides on HTTP**.

---

## 1. Endpoint and middleware

Single URL (e.g. `/graphql`). Authenticate in HTTP middleware **before** GraphQL
validation. Authorization during field execution. Allow partial responses.

---

## 2. Request contract

- **POST** required for queries + mutations (`Content-Type: application/json`).
- **GET** optional for queries only.
- Body: `query` required; `operationName` if multiple ops; optional `variables`,
  `extensions`.
- Client `Accept`: `application/graphql-response+json` (+ legacy JSON).

---

## 3. Response contract

`Content-Type: application/graphql-response+json` (or legacy JSON). Body
`{ data, errors?, extensions? }`. Pre-execution failure: `errors` only.
Non-null `data` + field errors → **2xx**.

Modern media type may use 4xx/5xx when execution cannot start; legacy often
returns 2xx + errors — clients must parse `errors`, not status alone.

---

## 4. Caching (optional)

GET + persisted query IDs for CDN. Cache key = persisted ID + variables.

---

## 5. Quick checklist

- [ ] Single endpoint; auth before validation.
- [ ] POST JSON contract documented.
- [ ] Correct Content-Type / Accept.
- [ ] Partial success = 2xx when data present.
- [ ] Clients triage via `errors` array.

See [reference.md](reference.md) and [examples.md](examples.md).
