# Bulk and Batch — Reference

## When to offer batch

- Syncing thousands of records
- TLS/handshake overhead dominates
- Rate limits count per HTTP request

## Anti-patterns

- Silent all-or-nothing without documentation
- Unordered results that cannot map to inputs
- Inlining huge result sets in sync responses (prefer async job)

## Sources

- apiguide.dev bulk and batch operations
