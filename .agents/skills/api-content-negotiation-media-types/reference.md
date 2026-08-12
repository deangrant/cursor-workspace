# Content Negotiation — Reference

## Common types

`application/json`, `application/problem+json`, `application/hal+json`,
`application/vnd.api+json`, patch types, `application/health+json`.

## Anti-patterns

- Guessing format from body without Content-Type
- Ignoring Accept and always returning JSON without documenting default
- Missing Vary on multi-rep URIs

## Sources

- RFC 9110 §12; apiguide.dev content negotiation
