---
name: api-cors
description: >-
  Configure CORS for browser-facing APIs: simple vs preflight, Allow-* headers,
  credentials, and origin allowlists. Use when enabling SPA access or debugging
  OPTIONS preflight failures.
trigger: >-
  CORS, Cross-Origin Resource Sharing, Access-Control-Allow-Origin, preflight
  OPTIONS, credentials CORS, Allow-Methods
---

# Cross-Origin Resource Sharing (CORS)

Use this skill when browsers call the API from another origin.

---

## 1. Simple vs preflight

Simple requests skip preflight; others trigger `OPTIONS` with
`Access-Control-Request-*`. Respond with `Access-Control-Allow-Origin`,
`Allow-Methods`, `Allow-Headers`, and optional `Max-Age`.

---

## 2. Credentials

With cookies/credentials: **explicit origins** — never `*` with credentials.
Reflect only allowlisted origins.

---

## 3. Quick checklist

- [ ] Explicit origin allowlist (no `*` with credentials).
- [ ] OPTIONS preflight handled.
- [ ] Methods/headers allowlists match real API.
- [ ] Do not use CORS as an authz control (server still enforces auth).

See [reference.md](reference.md) and [examples.md](examples.md).
