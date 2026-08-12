# Webhooks — Examples

```http
POST /customer/hooks HTTP/1.1
Content-Type: application/json
X-Webhook-Id: evt_123
X-Webhook-Timestamp: 1720602000
X-Webhook-Signature: v1=...

{ "id": "evt_123", "type": "order.shipped", "data": { "order_id": 42 } }
```
