# Request Signing — Reference

## Anti-patterns

- Signing only a subset of mutable headers attackers can strip
- Non-constant-time compare
- No timestamp window

## Sources

- RFC 9421; RFC 9530; apiguide.dev request signing
