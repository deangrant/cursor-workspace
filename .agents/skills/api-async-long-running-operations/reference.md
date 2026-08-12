# Async Long-Running Operations — Reference

## When to use async

- Exceeds proxy timeouts (~30–60s)
- Unbounded duration
- Client must not block

## Anti-patterns

- Holding HTTP open for minutes-long work
- Using SSE/WebSocket for one-shot jobs
- Returning 500 on poll when job `failed` (use 200 + error in body)
- Duplicate jobs without Idempotency-Key

## Sources

- RFC 7240 Prefer header
