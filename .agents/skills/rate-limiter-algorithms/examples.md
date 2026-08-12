# Rate Limiter Algorithms — Examples

**Token bucket reject:**

```http
HTTP/1.1 429 Too Many Requests
Retry-After: 2
RateLimit-Remaining: 0
```

**Key:** `rl:tenant:T:user:U:route:POST:/payments`
