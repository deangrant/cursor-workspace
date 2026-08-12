# PATCH Strategies — Examples

## Merge Patch

```http
PATCH /users/7 HTTP/1.1
Content-Type: application/merge-patch+json
If-Match: "abc123"

{ "name": "Ada", "nickname": null }
```

(`nickname` cleared; other fields unchanged)

## JSON Patch

```http
PATCH /orders/42 HTTP/1.1
Content-Type: application/json-patch+json
If-Match: "etag1"

[
  { "op": "test", "path": "/status", "value": "pending" },
  { "op": "replace", "path": "/status", "value": "paid" }
]
```

## Avoid

```http
PATCH /users/7
Content-Type: application/json

{ "name": "Ada" }
```

(ambiguous null/omit; no media type contract)
