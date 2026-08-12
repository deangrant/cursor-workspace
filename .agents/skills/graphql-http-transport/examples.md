# GraphQL HTTP Transport — Examples

```http
POST /graphql HTTP/1.1
Content-Type: application/json
Accept: application/graphql-response+json

{ "query": "query { viewer { id } }" }
```

```http
HTTP/1.1 200 OK
Content-Type: application/graphql-response+json

{ "data": { "viewer": { "id": "1" } } }
```
