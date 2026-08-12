# Request Signing — Examples

```http
POST /payments HTTP/1.1
Content-Digest: sha-256=:...:
Signature-Input: sig1=("@method" "@path" "content-digest" "created");created=1720602000
Signature: sig1=:...:
```
