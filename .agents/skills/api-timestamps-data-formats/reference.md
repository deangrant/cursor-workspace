# Timestamps and Data Formats — Reference

## Avoid

| Format | Problem |
| ------ | ------- |
| Unix seconds/ms mixed | Ambiguous units |
| IEEE float money | Rounding errors |
| Boolean piles for states | Combinatorial mess |
| Mixed snake/camel | Client mapping bugs |

## Sources

- RFC 3339
