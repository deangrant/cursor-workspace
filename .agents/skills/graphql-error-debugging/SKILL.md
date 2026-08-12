---
name: graphql-error-debugging
description: >-
  Triage GraphQL failures using HTTP status, Content-Type, and the errors vs
  data body shape. Use when debugging 400/405/415 responses or partial GraphQL
  errors in development or on-call.
trigger: >-
  GraphQL errors, GraphQL debugging, data vs errors, 400 GraphQL, 405 mutation
  GET, GraphQL triage, partial errors
---

# GraphQL Error Debugging

Use this skill when **diagnosing GraphQL request failures**.

---

## 1. Capture

Method, URL, `Content-Type`/`Accept`, raw body, status, response Content-Type,
full body, `operationName`.

---

## 2. Transport table

| Status | Check |
| ------ | ----- |
| 400 | Valid JSON? `{ "query" }`? Syntax? |
| 405 | Mutation on GET? Wrong method? |
| 415 | POST without `application/json`? |
| 422 | Implementation-specific — still read body |

---

## 3. Body triage

- Parse `errors` (`message`, `locations`, `path`).
- **`data` present** → runtime/execution (resolver, auth, non-null).
- **`data` absent** → validation (unknown field, bad args, missing op name).
- Partial `data` + `errors` → field failure; often **2xx**.

Never trust HTTP status alone — especially with legacy `application/json`.

---

## 4. Server 500s

Check logs/stacks; schema load; middleware order; masked prod errors → use
traces.

---

## 5. Quick checklist

- [ ] Captured request/response fully.
- [ ] Classified transport vs GraphQL body.
- [ ] Used `errors[].path` for field failures.
- [ ] Verified fix against schema (dev introspection).

See [reference.md](reference.md) and [examples.md](examples.md).
