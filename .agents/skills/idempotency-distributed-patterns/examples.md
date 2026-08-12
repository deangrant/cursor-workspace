# Idempotency Distributed Patterns — Examples

**Outbox (same TX):**

```sql
BEGIN;
INSERT INTO orders (...);
INSERT INTO outbox (topic, payload) VALUES ('order.created', ...);
COMMIT;
```

**Consumer:** insert `processed_events(event_id)` unique — skip if conflict.
