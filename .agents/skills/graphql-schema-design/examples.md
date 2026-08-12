# GraphQL Schema Design — Examples

## Prefer

```graphql
type User implements Node {
  id: ID!
  email: String
  posts(first: Int, after: String): PostConnection!
}

type Query {
  node(id: ID!): Node
  viewer: User
}
```

## Avoid

```graphql
type tbl_user {
  user_id: Int!
  email: String!
}
```
