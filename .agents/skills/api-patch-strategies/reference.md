# PATCH Strategies — Reference

## Comparison

| | JSON Patch | Merge Patch |
| - | ---------- | ----------- |
| Media type | `application/json-patch+json` | `application/merge-patch+json` |
| Null | `replace` with null | Deletes field |
| Arrays | Path to element | Replace whole array |
| Atomic ops | Yes | Document-level merge |

## Anti-patterns

- PATCH without concurrency control on contested resources
- Assuming arrays merge element-wise under Merge Patch
- Ad-hoc partial JSON without a media type

## Sources

- RFC 6902, RFC 7386; apiguide.dev patch strategies
