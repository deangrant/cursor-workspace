---
name: api-streaming-sse-websocket-long-polling
description: >-
  Choose SSE, WebSocket, or long-polling for realtime API push: directionality,
  reconnect, auth limits, and when to use 202 jobs instead. Use when designing
  event feeds, chat, or live updates.
trigger: >-
  SSE, Server-Sent Events, WebSocket, long polling, realtime API, event-stream,
  Last-Event-ID, duplex streaming
---

# Streaming APIs: SSE, WebSocket, Long-Polling

Use this skill for **continuous push**. One-shot slow work → async **202 + job**,
not streaming.

---

## 1. Long-polling

Hold GET until data or timeout (~30s); client reconnects. High header overhead;
fallback for restrictive networks / infrequent updates. Client backoff.

---

## 2. SSE (one-way)

`Content-Type: text/event-stream`. Browser `EventSource`; auto-reconnect +
`Last-Event-ID`; keep-alive comments; stop with `204`. Cannot set custom
headers — auth via query token or cookie. Prefer HTTP/3; scale with broker
fan-out.

---

## 3. WebSocket (duplex)

Upgrade `101`; full-duplex; heartbeats; reconnect+jitter; sticky LB or shared
registry/pub-sub.

---

## 4. Selection

| Need | Prefer |
| ---- | ------ |
| One-way server→client | **SSE** |
| Two-way high-frequency | **WebSocket** |
| Restricted networks | Long-poll |
| Minutes-long CRUD | **202 job** |

---

## 5. Quick checklist

- [ ] Correct transport for direction/frequency.
- [ ] Reconnect + keep-alive strategy.
- [ ] Auth compatible with EventSource limits if SSE.
- [ ] Fan-out/broker plan at scale.
- [ ] Not using streams for one-shot jobs.

See [reference.md](reference.md) and [examples.md](examples.md).
