# Media Types — Reference

## Trees

| Tree | Example |
| ---- | ------- |
| Standards | `application/json` |
| Vendor | `application/vnd.example.order+json` |
| Personal | `application/prs.*` |
| Unregistered | `application/x-*` (avoid) |

## Anti-patterns

- Registering `q` as a media-type parameter
- Silent format guessing
- Many one-off vnd types for minor schema tweaks

## Sources

- RFC 6838; apiguide.dev media types
