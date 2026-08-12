---
name: api-media-types-vendor-content-types
description: >-
  Choose and document HTTP media types including vendor trees (vnd), structured
  suffixes (+json), and MIME versioning. Use when minting custom types or
  reviewing Content-Type versioning schemes.
trigger: >-
  vendor media type, vnd, MIME type, +json suffix, media type versioning,
  application/vnd, RFC 6838, nosniff
---

# Media Types and Vendor Content Types

Use this skill when selecting **media type identifiers** beyond plain JSON.

---

## 1. Structure (RFC 6838)

`type/subtype; parameters` — case-insensitive names. Trees: standards, vendor
`vnd.`, personal `prs.`, unregistered `x.` (discouraged).

Structured suffix: `+json` / `+xml` so generic parsers still work.

Example: `application/vnd.api+json; version=2`

---

## 2. Guidance

- Prefer standard types; mint `vnd.*` sparingly when semantics truly differ.
- Prefer OpenAPI/JSON Schema for structure over media-type explosion.
- Versioning: subtype version **or** `; version=` — pick one convention.
- JSON:API allows only `ext` and `profile` params — others → **415**.
- Always set Content-Type; `X-Content-Type-Options: nosniff`; `Vary: Accept`
  when format varies.

---

## 3. Quick checklist

- [ ] Document request/response types.
- [ ] Accurate Content-Type; nosniff.
- [ ] 406/415 behavior defined.
- [ ] Consistent MIME versioning scheme if used.
- [ ] OpenAPI lists allowed types.

See [reference.md](reference.md) and [examples.md](examples.md).
