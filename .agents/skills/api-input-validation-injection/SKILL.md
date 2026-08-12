---
name: api-input-validation-injection
description: >-
  Validate API inputs server-side with schema allowlists, injection prevention,
  mass-assignment guards, and size limits. Use when implementing request DTOs
  or reviewing injection risks.
trigger: >-
  input validation, injection prevention, mass assignment, SQL injection,
  NoSQL injection, additionalProperties false, schema validation, 422
---

# Input Validation and Injection Prevention

Use this skill when accepting **untrusted request input**.

---

## 1. Core rules

- Validate **server-side** with schema before business logic.
- **Allowlists** over denylists; canonicalize; ReDoS-safe regex.
- `additionalProperties: false` (or equivalent) on request objects.
- Parameterized queries only; sanitize NoSQL operators; secure XML parsers.

---

## 2. Mass assignment (API3)

DTO + whitelist writable fields — never bind raw JSON to persistence models.

---

## 3. Limits

Cap body/array sizes → **413**. Return **400/422** with problem+json. Never
leak stacks.

---

## 4. Quick checklist

- [ ] Schema validation on all inputs.
- [ ] Allowlisted fields; no mass assignment.
- [ ] Parameterized DB access.
- [ ] Size caps; 413/422.
- [ ] Safe parsers for XML/YAML if used.

See [reference.md](reference.md) and [examples.md](examples.md).
