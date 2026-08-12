# Webhook Signature Verification — Examples

Signed payload string often looks like: `{timestamp}.{raw_body}`.

```text
expected = HMAC_SHA256(secret, f"{timestamp}.{body}")
secure_compare(expected, provided)
```
