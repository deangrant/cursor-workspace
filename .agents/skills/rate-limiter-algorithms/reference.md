# Rate Limiter Algorithms — Reference

## Comparison (short)

| Algo | Burst | Precision | Cost |
| ---- | ----- | --------- | ---- |
| Token bucket | Yes | Good | Low |
| Leaky bucket | Smooth out | Good | Low–med |
| Fixed window | Boundary spike | Coarse | Lowest |
| Sliding counter | Controlled | Good | Low |
| Sliding log | Exact | Best | Higher |

## Sources

- BackendBytes rate limiter series
