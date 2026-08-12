# Health Checks — Reference

## Anti-patterns

- Single `/health` that restarts pods on DB blips
- Expensive readiness queries
- Requiring end-user auth for probes

## Sources

- apiguide.dev health checks; Kubernetes probe semantics
