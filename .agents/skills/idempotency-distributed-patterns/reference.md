# Idempotency Distributed Patterns — Reference

## Anti-patterns

- Redis SETNX without transactional business commit
- New Idempotency-Key on every retry
- Assuming queue “exactly once”
- No consumer dedupe on at-least-once brokers

## Sources

- Idempotency patterns for distributed systems
