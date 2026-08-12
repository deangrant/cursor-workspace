# Redis Scaling — Reference

## Anti-patterns

- Multi-key ops without hash tags on Cluster
- Ignoring per-shard CPU while cluster QPS “looks fine”
- Unlimited pool growth on rolling deploys

## Sources

- Scaling Redis for high throughput (BackendBytes)
