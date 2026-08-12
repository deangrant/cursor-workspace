# API Security — Examples

**Prefer:** deny by default; allowlist fields; verify tenant on every ID.

**Avoid:** returning other tenants' objects; logging bearer tokens; `Access-Control-Allow-Origin: *` with cookies.
