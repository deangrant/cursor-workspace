---
name: api-health-check-status-endpoints
description: >-
  Design liveness, readiness, and startup health endpoints with dependency
  probes and application/health+json. Use when adding Kubernetes probes or
  platform health checks.
trigger: >-
  health check, liveness, readiness, startup probe, /health, health+json,
  dependency probe, 503 readiness
---

# Health Check and Status Endpoints

Use this skill when exposing **operational health** for orchestrators.

---

## 1. Probe split

| Probe | Purpose | Dependencies |
| ----- | ------- | ------------ |
| **Liveness** `/health/live` | Process up | None (or minimal) |
| **Readiness** `/health/ready` | Can take traffic | Critical deps; **503** if fail |
| **Startup** `/health/startup` | Boot complete | Until ready |

Do not fail liveness on downstream blips — that causes restart storms.

---

## 2. Format

Prefer `application/health+json` with component status. Keep checks fast and
capped.

---

## 3. Quick checklist

- [ ] Separate live/ready/startup.
- [ ] Ready returns 503 when critical deps down.
- [ ] No auth required for probes (or platform-friendly auth).
- [ ] Checks cheap; no heavy queries.

See [reference.md](reference.md) and [examples.md](examples.md).
