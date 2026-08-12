# GraphQL Pagination — Examples

```graphql
friends(first: 10, after: $cursor) {
  edges { cursor node { id name } }
  pageInfo { hasNextPage endCursor }
}
```
