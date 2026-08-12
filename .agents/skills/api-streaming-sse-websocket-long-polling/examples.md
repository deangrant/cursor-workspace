# Streaming — Examples

## SSE

```http
GET /events HTTP/1.1
Accept: text/event-stream
```

```http
HTTP/1.1 200 OK
Content-Type: text/event-stream

id: 17
event: order.updated
data: {"id":42,"status":"shipped"}
```

## Avoid for one-shot report

Opening a WebSocket to wait for a single PDF — use `202` + job instead.
