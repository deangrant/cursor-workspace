# Idempotency — Reference

## Anti-patterns

- New key on every retry
- Keys without tenant scope
- No body-hash check (key reuse with different payload)

## Sources

- Stripe-style Idempotency-Key patterns
