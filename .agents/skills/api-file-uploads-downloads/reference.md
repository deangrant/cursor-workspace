# File Uploads and Downloads — Reference

## Headers

| Header | Role |
| ------ | ---- |
| `Content-Disposition` | attachment vs inline + filename |
| `Accept-Ranges` / `Range` / `Content-Range` | Partial download |
| Upload-Offset / Upload-Complete | Resumable protocols |

## Anti-patterns

- Buffering entire uploads/downloads in memory
- Trusting client `Content-Type` alone
- Path traversal via filenames

## Sources

- apiguide.dev file uploads/downloads; RFC 7578 multipart; RFC 9110
