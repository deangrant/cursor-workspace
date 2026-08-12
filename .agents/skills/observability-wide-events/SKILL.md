---
name: observability-wide-events
description: >-
  Implement wide events / canonical log lines: one structured event per request
  per service, high-cardinality fields, handler enrichment, OTel attributes, and
  tail sampling. Use when replacing sparse log spam with queryable request
  outcomes. Complements the wide-event-logging rule.
trigger: >-
  wide events, canonical log line, high cardinality logging, tail sampling,
  request-scoped event, logging sucks
---

# Observability Wide Events

Use this skill to implement **one wide event per request per service**. Keep the
existing `wide-event-logging` rule as the short editing constraint.

---

## 1. Diagnosis

Many lines per request, string-grep debugging, OTel spans with no business
context, and fear of high-cardinality fields are symptoms of logging *code
paths* instead of *request outcomes*.

---

## 2. Implementation

1. Middleware creates event with request/service/deployment fields; emit in `finally`.
2. Handlers enrich: user, cart, payment, flags, errors (nested objects OK).
3. Always include high-cardinality IDs: `request_id`, `trace_id`, `user_id`.
4. Mirror fields onto OTel span attributes.
5. **Tail sample:** keep errors/slow/VIP; sample success ~1–5%.
6. Query in a columnar/SQL-capable backend.

Target query: *checkout failures for premium users last hour on new flow,
grouped by error code* — one query.

---

## 3. Not sufficient alone

JSON logs ≠ wide events. More spans ≠ business context. Dropping `user_id` to
“save cost” often costs more in incident time.

---

## 4. Quick checklist

- [ ] One event per request per hop.
- [ ] Business context attached.
- [ ] High-cardinality IDs present.
- [ ] Tail sampling policy.
- [ ] Queryable store.

See [reference.md](reference.md) and [examples.md](examples.md).
