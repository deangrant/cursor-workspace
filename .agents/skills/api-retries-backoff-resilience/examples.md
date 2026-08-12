# Retries and Resilience — Examples

```text
attempt 1 → fail 503
sleep min(Retry-After, exp_backoff * random_jitter)
attempt 2 → ...
```
