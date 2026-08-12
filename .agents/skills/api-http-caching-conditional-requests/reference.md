# HTTP Caching — Reference

## Anti-patterns

- Caching authenticated bodies on shared CDNs without keys
- Missing Vary for Accept/Authorization/Encoding
- Weak ETags where byte-identity matters for writes

## Sources

- RFC 9111
