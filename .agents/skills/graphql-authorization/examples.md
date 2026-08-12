# GraphQL Authorization — Examples

**Prefer:** `PostService.getDraft(user, id)` enforces “author only”.

**Avoid:** `if (context.user.id !== post.authorId)` copied into every resolver
and missing from the REST handler.
