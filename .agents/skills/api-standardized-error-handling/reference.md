# Standardized Error Handling — Reference

## Media type

- `application/problem+json` — RFC 9457 (obsoletes RFC 7807)

## Anti-patterns

| Anti-pattern | Problem |
| ------------ | ------- |
| `200` + error body | Breaks HTTP semantics |
| Different shapes per version | Client parse failures |
| Stack traces in production | Information leak |
| Single field error only | Round-trip churn for forms |
| Domain code only in free-text `detail` | Unstable machine identity |

## Bulk operations

Per-item errors live in `results[]` — top-level status alone is not enough
(see bulk/batch skill).

## Sources

- RFC 9457 Problem Details for HTTP APIs
