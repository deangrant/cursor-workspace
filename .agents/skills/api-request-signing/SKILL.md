---
name: api-request-signing
description: >-
  Design HTTP request signing for APIs: HMAC, SigV4-style, RFC 9421 signatures,
  Content-Digest, and replay defenses. Use when securing webhooks, payments, or
  high-assurance service calls.
trigger: >-
  request signing, HMAC signature, SigV4, RFC 9421, Content-Digest, nonce,
  replay protection, signed requests
---

# Request Signing

Use this skill when Bearer tokens alone are insufficient — payments, webhooks,
or high-assurance S2S.

---

## 1. Approaches

| Approach | Notes |
| -------- | ----- |
| HMAC over canonical string | Common for webhooks |
| Cloud SigV4-style | Scoped credentials, signed headers |
| RFC 9421 HTTP Message Signatures | Standardized header signatures |
| Content-Digest | Integrity of body (RFC 9530) |

---

## 2. Replay defense

Include timestamp and/or nonce; reject skew outside window; constant-time
compare; sign method+path+body digest+timestamp.

---

## 3. Quick checklist

- [ ] Canonicalization documented and tested.
- [ ] Timestamp/nonce replay window.
- [ ] Constant-time signature compare.
- [ ] Key rotation supported.
- [ ] Body digest covered when body matters.

See [reference.md](reference.md) and [examples.md](examples.md).
