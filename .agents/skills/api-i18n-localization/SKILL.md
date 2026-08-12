---
name: api-i18n-localization
description: >-
  Design internationalized REST APIs: Accept-Language, UTC storage, localized
  messages vs data, and explicit country/region params for business rules. Use
  when adding locales or fixing mixed timezone/locale bugs.
trigger: >-
  i18n, l10n, Accept-Language, locale, localization API, country parameter,
  translated error messages
---

# Internationalization and Localization

Use this skill when APIs serve **multiple locales/regions**.

---

## 1. Split concerns

| Concern | Approach |
| ------- | -------- |
| Message language | `Accept-Language` → localized `detail`/UI strings |
| Data timestamps | Store/transmit UTC RFC 3339; client displays |
| Business rules (tax, catalog) | Explicit `country` / `region` param — not only language |

---

## 2. Guidance

- Do not overload `Accept-Language` for currency/tax jurisdiction.
- Keep machine-stable `type` URIs in problem+json; localize `detail`/`title` if needed.
- Document default locale when header absent.

---

## 3. Quick checklist

- [ ] Accept-Language honored for user-facing text.
- [ ] Timestamps UTC on the wire.
- [ ] Country/region explicit for business logic.
- [ ] Defaults documented.

See [reference.md](reference.md) and [examples.md](examples.md).
