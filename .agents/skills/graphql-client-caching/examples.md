# GraphQL Client Caching — Examples

```graphql
query {
  viewer { id name }
  node(id: "User:1") { ... on User { id name } }
}
```

After `updateUser`, write the normalized `User:1` entry — do not leave stale
duplicates keyed only by query path.
