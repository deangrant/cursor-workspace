# API Response Envelope Design — Examples

## Example 1: Enveloped collection

```json
{
  "data": [{ "id": 1 }, { "id": 2 }],
  "meta": {
    "request_id": "req_1",
    "pagination": { "next_cursor": "abc", "has_more": true }
  }
}
```

## Example 2: Bare + Link

```http
HTTP/1.1 200 OK
Link: </orders?cursor=abc>; rel="next"
Content-Type: application/json

[{ "id": 1 }, { "id": 2 }]
```

## Example 3: Anti-pattern

**Avoid**

```http
HTTP/1.1 200 OK

{ "success": false, "error": "not found" }
```

**Prefer** `404` + `application/problem+json`.
