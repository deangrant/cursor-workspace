# Deprecation and Sunsetting — Examples

## Deprecated but live

```http
HTTP/1.1 200 OK
Deprecation: Sat, 01 Mar 2026 00:00:00 GMT
Sunset: Wed, 01 Sep 2027 00:00:00 GMT
Link: <https://docs.example.com/migrate-v2>; rel="sunset"
```

## After cutoff

```http
HTTP/1.1 410 Gone
Content-Type: application/problem+json
```
