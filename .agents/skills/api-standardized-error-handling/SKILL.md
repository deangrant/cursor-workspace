---
name: api-standardized-error-handling
description: >-
  Design RFC 9457 Problem Details error responses for REST APIs: type, title,
  status, detail, field-level errors, and correct HTTP status pairing. Use when
  defining error contracts, OpenAPI error schemas, or fixing ad-hoc error JSON.
trigger: >-
  RFC 9457, problem+json, Problem Details, API errors, validation errors,
  error envelope, 422 field errors, standardized errors
---

# Standardized Error Handling (RFC 9457)

Use this skill when defining or reviewing **API error responses**. Prefer
`application/problem+json` over ad-hoc `{ "status": "error", "msg": "..." }`.

---

## 1. Problem Details core fields

| Field | Role |
| ----- | ---- |
| `type` | Stable URI identifying the problem class / docs |
| `title` | Short, static summary for that `type` |
| `status` | Echo of the HTTP status |
| `detail` | Occurrence-specific explanation |
| `instance` | Optional URI for this occurrence |

---

## 2. Validation errors

Return **all** field errors in one response. Extend with an `errors` map:

```json
{
  "type": "https://api.example.com/errors/validation",
  "title": "Validation failed",
  "status": 422,
  "detail": "One or more fields are invalid",
  "errors": {
    "email": ["must be a valid email"],
    "qty": ["must be >= 1"]
  }
}
```

Domain codes belong in `type` (preferred) or a documented `code` extension —
keep the HTTP status correct for the transport class.

---

## 3. Status pairing

| Case | Status |
| ---- | ------ |
| Syntax / malformed | 400 |
| Payload too large | 413 |
| Auth | 401 / 403 |
| Missing | 404 |
| Sunset | **410** (not 404) |
| Conflict / in-flight idempotency | 409 |
| Semantic validation | 422 |
| Readiness / overload | 503 |

**Never** return `200` with an error object. Omit stack traces, internal IDs,
and secrets in production.

---

## 4. Consistency

Use the **same** error envelope across all active API versions. Catalogue every
`type` in OpenAPI / docs. Treat the error shape as a contract.

---

## 5. Quick checklist

- [ ] Default `Content-Type: application/problem+json`.
- [ ] `type`, `title`, `status`, `detail` present.
- [ ] Multi-field `errors` on validation failures.
- [ ] HTTP status matches problem class.
- [ ] No secrets/stack traces in production.
- [ ] Types documented; shape stable across versions.

See [reference.md](reference.md) and [examples.md](examples.md).
