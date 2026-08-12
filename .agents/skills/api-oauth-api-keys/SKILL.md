---
name: api-oauth-api-keys
description: >-
  Select credential models for APIs: API keys vs OAuth2 client credentials vs
  authorization code + PKCE, including scopes. Use when designing developer
  credentials or user-delegated access.
trigger: >-
  OAuth 2.0, API keys, client credentials, PKCE, authorization code, scopes,
  M2M auth, access token
---

# OAuth 2.0 and API Keys

Use this skill when choosing **credential models** for humans and machines.

---

## 1. Selection

| Model | Use |
| ----- | --- |
| **API keys** | Simple service access; header-only (never query); rotate |
| **Client credentials** | M2M confidential clients |
| **Auth code + PKCE** | User-delegated apps (public/native) |
| **Refresh tokens** | Long sessions with short-lived access tokens |

Scopes = least privilege. Audit client scope usage.

---

## 2. Quick checklist

- [ ] Keys in headers only; stored hashed server-side when possible.
- [ ] Right OAuth flow for client type.
- [ ] Short-lived access tokens; scoped.
- [ ] Rotation without downtime.

See [reference.md](reference.md) and [examples.md](examples.md).
