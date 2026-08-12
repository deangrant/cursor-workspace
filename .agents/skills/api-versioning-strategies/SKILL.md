---
name: api-versioning-strategies
description: >-
  Choose REST API versioning strategies (URI, header, query, media type), define
  breaking vs additive changes, and plan evolution. Use when introducing
  versions, reviewing breaking changes, or picking a portfolio-wide scheme.
trigger: >-
  API versioning, /v1/, version header, media type version, breaking change,
  API evolution, semver API
---

# API Versioning Strategies

Use this skill when deciding **how and when** to version an HTTP API.

---

## 1. Prefer evolution first

Design for extensibility (additive fields, tolerant readers) so most changes
need **no** new version. Explicit versions for architectural/breaking changes.

---

## 2. Routing mechanisms

| Mechanism | Example | Notes |
| --------- | ------- | ----- |
| URI prefix | `/v1/orders` | Obvious in logs; common |
| Header | `API-Version: 2026-01-15` | Cleaner URLs |
| Query | `?version=1` | Easy to misuse/cache |
| Media type | `vnd.example.v2+json` | Fits HATEOAS |

Pick **one** portfolio-wide. Do not mix without a clear policy. Avoid
method-based versioning.

---

## 3. Breaking vs additive

Breaking: rename, optional→required, restructure, stricter validation.
Additive: new optional fields, new endpoints — usually same version.

Same error format (RFC 9457) across active versions.

---

## 4. Quick checklist

- [ ] Extensibility before bumping version.
- [ ] Breaking change definition documented.
- [ ] Single routing scheme chosen and consistent.
- [ ] Clients pin version explicitly (no silent default reliance).
- [ ] Analytics before costly multi-version support.

See [reference.md](reference.md) and [examples.md](examples.md).
