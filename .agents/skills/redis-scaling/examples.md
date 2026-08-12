# Redis Scaling — Examples

**Hash tag** so keys hash together: `{user:42}:profile`, `{user:42}:cart`.

**Pipeline:** batch `MGET`/multi `GET` in one RTT per slot group.
