---
name: deepsec-setup-ci
description: >-
  Set up Vercel deepsec for AI-assisted vulnerability scanning: init workspace,
  config, matchers, and PR/CI review modes. Use when adding deepsec to a repo or
  wiring scan/process pipelines for first-party code.
trigger: >-
  deepsec, deepsec init, vulnerability scanning agent, deepsec.config,
  deepsec PR CI, custom matchers
---

# deepsec Setup and CI

Use this skill for **first-party codebase** vuln scanning with deepsec (not npm
dependency scanning). Requires **Node.js 22+**.

---

## 1. Initialize

```bash
npx deepsec init
cd .deepsec && pnpm install
```

Check in `.deepsec/` config/INFO.md/matchers; gitignore `data/` output. Review
`deepsec.config.ts` (projects, plugins, matchers, defaultAgent).

---

## 2. Auth / models

Configure AI Gateway / sandbox or BYOK per docs. Expect model cost; start with
defaults. Handle refusals/retries.

---

## 3. CI / PR

Use PR/direct review modes; prefer net-new finding exit codes. Two-job Actions
patterns separate scan vs gate. Do not scan secrets into logs.

---

## 4. Matchers

Add custom matchers for stack-specific sinks; set noise tiers. Prefer additive
merge of findings. Framework detection via tech.json where available.

---

## 5. Quick checklist

- [ ] Node 22+; `.deepsec` committed; data ignored.
- [ ] Config reviewed; agent auth works.
- [ ] CI gates on net-new issues.
- [ ] Custom matchers for critical paths.
- [ ] Complements DAST (ZAP) — source vs running app.

See [reference.md](reference.md) and [examples.md](examples.md).
