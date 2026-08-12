# GraphQL Client Caching — Reference

## Layers

| Layer | Concern |
| ----- | ------- |
| Client normalized store | This skill |
| CDN/HTTP GET + APQ | Transport skill |
| Server Redis/DB | caching-at-scale skill |

## Anti-patterns

- Expecting REST URL caching on POST `/graphql`
- Nested objects without `id`
- Parsing opaque global IDs client-side

## Sources

- GraphQL caching + global object identification best practices
