---
name: api-token-lifecycle
description: >-
  Manage access and refresh token lifecycle: TTLs, rotation, reuse detection,
  revocation (RFC 7009), introspection (RFC 7662), JWKS, and DPoP. Use when
  implementing OAuth token services or hardening session security.
trigger: >-
  token rotation, refresh token, token revocation, RFC 7009, RFC 7662, JWKS,
  DPoP, access token TTL, reuse detection
---

# Token Lifecycle: Rotation, Refresh, Revocation

Use this skill when issuing and managing **OAuth/OIDC tokens**.

---

## 1. TTLs

Short-lived **access** tokens; longer **refresh** tokens with rotation. Prefer
short-lived tokens over long-lived API keys.

---

## 2. Rotation and reuse

Rotate refresh tokens on use. Detect reuse of an already-rotated refresh token
→ revoke family (theft signal).

---

## 3. Revocation and validation

- RFC 7009 revocation endpoint
- RFC 7662 introspection (or local JWT + JWKS)
- Consider DPoP / cert-bound tokens for sender-constraining

Scrub tokens from logs.

---

## 4. Quick checklist

- [ ] Access TTL short; refresh rotated.
- [ ] Reuse detection + family revoke.
- [ ] Revoke endpoint; JWKS key rotation.
- [ ] No tokens in logs/URLs.

See [reference.md](reference.md) and [examples.md](examples.md).
