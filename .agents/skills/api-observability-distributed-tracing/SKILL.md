---
name: api-observability-distributed-tracing
description: >-
  Instrument REST APIs with structured JSON logs, RED/USE metrics, W3C
  Trace Context, X-Request-Id, and OpenTelemetry. Use when adding observability
  or correlating multi-service failures.
trigger: >-
  observability, distributed tracing, OpenTelemetry, traceparent, X-Request-Id,
  RED metrics, structured logging, correlation ID
---

# Observability and Distributed Tracing

Use this skill when making API behavior **debuggable in production**.

---

## 1. Logs

Structured JSON: method, path, status, duration; honor/propagate
`X-Request-Id` / correlation ID; echo in response. No secrets/PII.

---

## 2. Metrics

**RED:** rate, errors, duration percentiles. **USE** on dependencies. Alert on
error rate + p99.

---

## 3. Traces

W3C `traceparent`/`tracestate` on internal calls; OpenTelemetry instrumentation.
One wide contextual event per request per service is ideal.

---

## 4. Quick checklist

- [ ] JSON logs with request id.
- [ ] Generate or honor client request id; propagate downstream.
- [ ] RED metrics + dependency health.
- [ ] W3C trace context + OTel.
- [ ] Scrub secrets from telemetry.

See [reference.md](reference.md) and [examples.md](examples.md).
