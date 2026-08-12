---
name: api-deprecation-sunsetting
description: >-
  Deprecate and sunset API versions or fields using Deprecation, Sunset, and
  Link headers, plus 410 Gone. Use when retiring endpoints, publishing
  migration timelines, or reviewing compatibility windows.
trigger: >-
  API deprecation, Sunset header, Deprecation header, 410 Gone, sunsetting,
  migration timeline, API retirement
---

# API Deprecation and Sunsetting

Use this skill when **retiring** versions, fields, or endpoints without
surprising clients.

---

## 1. Signal early on success responses

On still-working (`200`) responses for deprecated resources:

- `Deprecation:` (RFC 9745) — when deprecation took effect
- `Sunset:` (RFC 8594) — when it will be removed
- `Link: …; rel="sunset"` / `rel="deprecation"` — migration docs

---

## 2. After removal

Return **410 Gone** (not 404) with problem+json and migration guidance.

---

## 3. Timeline

Publish announce → support → remind → monitor → remove. Example windows: 6mo
announce / 12mo support / 18–24mo removal (adjust for audience; public APIs
often need ≥24mo).

Track adoption metrics against migration expectations. Clients should **pin**
versions explicitly.

---

## 4. Quick checklist

- [ ] Deprecation + Sunset (+ Link) on deprecated-but-live responses.
- [ ] Published timeline and migration docs.
- [ ] 410 at cutoff with problem+json.
- [ ] Metrics for remaining traffic.
- [ ] Clients instructed to pin versions.

See [reference.md](reference.md) and [examples.md](examples.md).
