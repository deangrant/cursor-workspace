# Token Lifecycle — Examples

```http
POST /oauth/revoke
Content-Type: application/x-www-form-urlencoded

token=REFRESH&token_type_hint=refresh_token
```

On refresh reuse: revoke the token family and require re-auth.
