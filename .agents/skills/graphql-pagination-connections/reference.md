# GraphQL Pagination — Reference

## Anti-patterns

- `[Type!]!` for unbounded domains
- Offset-only on huge tables
- Inferring end of list from empty edges only
- `first: 1000000` allowed

## Sources

- Relay Connection spec; GraphQL pagination best practices
