# Streaming — Reference

## SSE event fields

`id`, `event`, `data` (JSON line), comment lines for keep-alive (`: ping`).

## Anti-patterns

- Defaulting to WebSocket for one-way feeds
- No reconnect/heartbeat
- Buffering unbounded messages per connection
