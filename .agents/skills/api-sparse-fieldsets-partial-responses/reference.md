# Sparse Fieldsets — Reference

## Conventions

| Mechanism | Typical param |
| --------- | ------------- |
| Sparse fields | `fields`, `fields[type]` |
| Embed related | `include`, `expand`, `expand[]` |

## Anti-patterns

- Default deep nesting of all relations
- Unbounded include depth
- Silent acceptance of arbitrary field names into SQL

## Sources

- JSON:API sparse fieldsets
