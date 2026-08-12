# API Response Envelope Design — Reference

## Style comparison

| Style | Body | Meta | Examples |
| ----- | ---- | ---- | -------- |
| Enveloped | `{ "data", "meta" }` | In body | Common social APIs |
| Bare | Resource / array | Headers (`Link`, …) | GitHub, GitLab |

## Anti-patterns

| Anti-pattern | Problem |
| ------------ | ------- |
| `200` + error flag | Breaks HTTP clients and caches |
| Mixed wrapped/bare silently | Client parsing bugs |
| Both `meta.pagination` and conflicting `Link` | Ambiguous next page |
| Copying GraphQL error-in-200 into REST | Wrong transport model |

## Out of scope

- RFC 9457 field layout (error handling skill)
- Cursor vs offset algorithms (pagination skill)
