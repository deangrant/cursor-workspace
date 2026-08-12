---
name: zaproxy-api-scan-ci
description: >-
  Run OWASP ZAP packaged Docker scans in CI (baseline, full, API) with stable
  images, mounted workdirs, and report artifacts. Use when adding DAST against
  a running web app or OpenAPI target.
trigger: >-
  ZAP Docker, OWASP ZAP CI, zap-api-scan, zap-baseline, DAST CI, zaproxy
---

# ZAP Docker CI

Use this skill for **DAST** against running apps (complements deepsec source
scanning).

---

## 1. Image

Prefer `ghcr.io/zaproxy/zaproxy:stable` (or `zap-stable`). Weekly for new AF
exit codes; nightly only experimental; bare has no packaged scripts.

---

## 2. Workdir

Mount a host work directory for reports/hooks. Run as documented UID if
permission issues arise.

---

## 3. Scan type

| Script | Use |
| ------ | --- |
| baseline | Smoke / PR-friendly |
| full | Deeper scheduled scans |
| api | OpenAPI/GraphQL targets |

Point at a reachable staging URL. Fail CI on policy thresholds; publish HTML/JSON
artifacts.

---

## 4. Quick checklist

- [ ] Stable image pinned or digest-tracked.
- [ ] Target up before scan job.
- [ ] Reports archived.
- [ ] Auth/env for staging documented (no secrets in logs).
- [ ] Complements SAST/deepsec — does not replace them.

See [reference.md](reference.md) and [examples.md](examples.md).
