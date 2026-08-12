---
name: api-file-uploads-downloads
description: >-
  Design file upload and download APIs: multipart vs presigned vs resumable,
  Range/206 downloads, Content-Disposition, and content validation. Use when
  adding binary transfer endpoints or reviewing upload security.
trigger: >-
  file upload, multipart form-data, presigned URL, resumable upload, Range
  206, Content-Disposition, download streaming, 413 415 upload
---

# File Uploads and Downloads

Use this skill when transferring **binary assets** through or alongside the API.

---

## 1. Size-based upload strategy

| Size | Mechanism |
| ---- | --------- |
| &lt; ~1MB | Base64 in JSON (overhead) |
| ~1–100MB | `multipart/form-data` |
| &gt; ~100MB | Presigned direct-to-storage PUT |
| Unreliable large | Resumable chunks |

Presigned: short-lived scoped URL; client uploads; notify API on complete.

**PUT must not carry `Content-Range`** (RFC 9110 → 400) — use PATCH or a
dedicated upload protocol for partial writes.

---

## 2. Downloads

Stream in chunks — never buffer whole files in RAM. Support
`Accept-Ranges: bytes` → `Range` → **206** + `Content-Range` (416 if unsatisfiable).

`Content-Disposition: attachment|inline; filename=...; filename*=UTF-8''...`

---

## 3. Security

Validate **magic bytes** (not client Content-Type alone); rate-limit uploads;
malware scan; sanitize filenames (`../`). Errors: **413**, **415**, problem+json.

---

## 4. Quick checklist

- [ ] Mechanism matches size profile.
- [ ] Stream downloads; Range for large assets.
- [ ] Content-Disposition set appropriately.
- [ ] Content-based type validation; 413/415.
- [ ] Limits documented in OpenAPI.

See [reference.md](reference.md) and [examples.md](examples.md).
