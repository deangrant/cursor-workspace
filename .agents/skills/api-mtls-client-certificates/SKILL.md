---
name: api-mtls-client-certificates
description: >-
  Design mTLS and client-certificate authentication for APIs, including PKI
  rotation, cert-bound tokens (RFC 8705), and proxy header pitfalls. Use when
  securing service-to-service or partner edge access.
trigger: >-
  mTLS, mutual TLS, client certificates, PKI rotation, RFC 8705, cert-bound
  tokens, client cert auth
---

# mTLS and Client Certificates

Use this skill for **certificate-based client authentication**.

---

## 1. Pattern

TLS handshake authenticates both sides. Validate full chain and revocation.
Use short-lived certs with automated rotation.

---

## 2. Edge / gateway

Terminate mTLS at gateway for partners; forward verified cert attributes only
via **trusted** internal headers (never trust client-supplied spoofable
headers at the edge).

Consider RFC 8705 certificate-bound access tokens for OAuth + mTLS.

---

## 3. Quick checklist

- [ ] Chain + revocation checks.
- [ ] Automated rotation; truststore updates.
- [ ] No spoofable cert headers from the public internet.
- [ ] Document identity mapping (CN/SAN → principal).

See [reference.md](reference.md) and [examples.md](examples.md).
