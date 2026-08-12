---
name: api-timestamps-data-formats
description: >-
  Standardize REST JSON wire formats: RFC 3339 UTC timestamps, non-float money,
  string enums, null vs omit, and consistent field casing. Use when defining
  schemas or fixing cross-endpoint data format inconsistencies.
trigger: >-
  RFC 3339, ISO 8601, timestamp format, money decimal, string enums, null vs
  omitted, snake_case camelCase JSON, API data formats
---

# Timestamps and Data Formats

Use this skill when defining **JSON field conventions**. Apply uniformly across
endpoints and versions — quiet mismatches cause most client bugs.

---

## 1. Timestamps

Use RFC 3339 / ISO 8601 strings with `Z` (UTC), e.g. `"2026-07-10T09:00:00Z"`.

Avoid Unix epoch as primary, locale dates (`10/07/2026`), and naive timestamps
without offset. When wall time matters: offset **plus** IANA `timezone` field.

---

## 2. Money

**Never floats.** Prefer integer minor units (`4999` + `"USD"`) or decimal
string (`"49.99"`) + ISO 4217. Document scale.

---

## 3. Enums, null, casing

- String enums (`"shipped"`), not magic ints; clients should tolerate unknowns.
- PATCH: omit = unchanged; `null` = clear (esp. Merge Patch) — document.
- One JSON casing (`snake_case` or `camelCase`); `*_at` timestamps; `is_`/`has_`
  booleans. URI kebab-case is a separate rule.

---

## 4. Quick checklist

- [ ] RFC 3339 UTC everywhere.
- [ ] Money as integer or string + currency.
- [ ] String enums documented in OpenAPI.
- [ ] Null vs omit documented for PATCH.
- [ ] Single casing convention.

See [reference.md](reference.md) and [examples.md](examples.md).
