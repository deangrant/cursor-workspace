# GraphQL HTTP Transport — Reference

## Status triage (clients)

| Signal | Meaning |
| ------ | ------- |
| `data` + `errors` | Partial field failure |
| `errors` only | Validation / pre-exec |
| 405 | Wrong method (e.g. mutation on GET) |
| 415 | Wrong Content-Type |

## Sources

- GraphQL over HTTP best practices
