# Pagination — Reference

## Comparison

| | Offset | Cursor |
| - | ------ | ------ |
| Jump to page N | Yes | No |
| Scale | Degrades | O(1) with indexes |
| Concurrent writes | Drift | Stable |
| Complexity | Low | Medium |

## Anti-patterns

- Unbounded lists (no limit)
- Mutable sort without tie-breaker
- Mixing Link and conflicting meta pagination
- Exposing raw SQL offsets as security-sensitive IDs without opacity

## Sources

- RFC 8288 Web Linking
