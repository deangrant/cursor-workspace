---
name: api-security-best-practices
description: >-
  Apply OWASP API Security Top 10 practices for REST APIs: TLS, BOLA, authn/authz
  separation, rate limits, secrets hygiene, and least privilege. Use when
  hardening APIs or running a security design review.
trigger: >-
  OWASP API Top 10, API security, BOLA, TLS HSTS, least privilege, secrets,
  API hardening, security review
---

# API Security Best Practices

Use this skill for a **security design review** of HTTP APIs.

---

## 1. Transport

HTTPS only; redirect HTTP→HTTPS; HSTS with `includeSubDomains` (preload when
ready). mTLS for high-assurance S2S when needed.

---

## 2. Identity and access

Authn ≠ authz. Object-level checks (BOLA). Privileged function checks (BFLA).
Least-privilege scopes. Short-lived credentials.

---

## 3. Input and abuse

Schema validation; mass-assignment guards; payload/page size caps; per-identity
and per-endpoint rate limits; 429 vs 503 with Retry-After.

---

## 4. Secrets and errors

No secrets in git/clients/logs. Scrub Authorization. Error bodies omit stacks
and internals. CORS explicit origins.

---

## 5. Quick checklist

- [ ] TLS + HSTS.
- [ ] Object + function authz.
- [ ] Validation + size caps.
- [ ] Rate limits + Retry-After.
- [ ] Secrets manager; log scrubbing.
- [ ] Security documented in OpenAPI.

See [reference.md](reference.md) and [examples.md](examples.md).
