---
name: api-authentication-schemes
description: >-
  Choose HTTP API authentication schemes: Bearer tokens, Basic over TLS, and
  HTTP message signatures. Use when selecting authn for public, partner, or
  service APIs.
trigger: >-
  API authentication, Bearer token, Basic auth, WWW-Authenticate, HTTP message
  signatures, RFC 6750, RFC 9421
---

# API Authentication Schemes

Use this skill when selecting **how clients prove identity** (authn ≠ authz).

---

## 1. Common schemes

| Scheme | When |
| ------ | ---- |
| **Bearer** (RFC 6750) | Default for OAuth/JWT access tokens |
| **Basic** (RFC 7617) | TLS-only; simple; prefer short-lived secrets |
| **HTTP Message Signatures** (RFC 9421) | High-assurance S2S / payments |

On failure: **401** + `WWW-Authenticate` (e.g. `Bearer realm="api"`).

---

## 2. Guidance

- Prefer Bearer over putting secrets in query strings.
- Document scheme in OpenAPI `securitySchemes`.
- Separate authentication from authorization checks.

---

## 3. Quick checklist

- [ ] Scheme matches client type (user app vs M2M vs webhook).
- [ ] TLS required; Basic never on plaintext.
- [ ] 401 + WWW-Authenticate.
- [ ] OpenAPI documents security.

See [reference.md](reference.md) and [examples.md](examples.md).
