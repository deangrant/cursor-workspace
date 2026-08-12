# Pagination — Examples

## Cursor

```http
GET /orders?filter[status]=shipped&sort=-created_at,id&limit=25&cursor=eyJpZCI6NDJ9
```

```http
HTTP/1.1 200 OK
Link: </orders?cursor=eyJpZCI6MTd9>; rel="next"
```

## Offset (small admin UI)

```http
GET /admin/users?page=3&per_page=20
```

## Avoid

```http
GET /orders
```

(no limit on a multi-million row table)
