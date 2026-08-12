# Idempotency — Examples

```http
POST /payments HTTP/1.1
Idempotency-Key: 6b86b273-...
Content-Type: application/json

{ "amount_cents": 4999, "currency": "USD" }
```

Retry with the **same** key after timeout to avoid double charge.
