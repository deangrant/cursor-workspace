---
name: api-http-compression
description: >-
  Negotiate and apply HTTP compression for APIs: Brotli/gzip/zstd,
  Accept-Encoding, Vary, and BREACH mitigations. Use when enabling compression
  or debugging encoding issues.
trigger: >-
  HTTP compression, gzip, Brotli, zstd, Accept-Encoding, Vary Accept-Encoding,
  BREACH, content encoding
---

# HTTP Compression

Use this skill when compressing API response bodies.

---

## 1. Negotiation

Client: `Accept-Encoding: br, gzip`. Server picks; set `Content-Encoding` and
`Vary: Accept-Encoding`. Prefer Brotli with gzip fallback; consider size
threshold (~1KB+).

---

## 2. Safety

Avoid compressing secrets alongside attacker-controlled input over TLS without
BREACH mitigations (separate secrets, disable compression on sensitive
endpoints, or randomize).

Do not double-compress already compressed binaries (images, zip).

---

## 3. Quick checklist

- [ ] Accept-Encoding honored; Content-Encoding set.
- [ ] Vary: Accept-Encoding present.
- [ ] Min-size threshold; skip precompressed types.
- [ ] Sensitive endpoints reviewed for BREACH.

See [reference.md](reference.md) and [examples.md](examples.md).
