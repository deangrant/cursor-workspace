# GraphQL Performance — Examples

**Prefer:** `userLoader.loadMany(ids)` inside a friends connection resolver.

**Avoid:** `friends.map(id => db.user.find(id))` without batching.
