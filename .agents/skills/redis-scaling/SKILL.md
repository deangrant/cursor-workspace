---
name: redis-scaling
description: >-
  Scale Redis with Sentinel vs Cluster, hash tags, hot-key mitigation,
  pipelining, pooling, and maxmemory policies. Use when Redis is a bottleneck
  or planning cluster migration.
trigger: >-
  Redis scaling, Redis Cluster, hot keys, Redis pipelining, Sentinel,
  maxmemory-policy, hash tags
---

# Redis Scaling

Use this skill when Redis must sustain **high throughput or large memory**.

---

## 1. Topology

Start Sentinel + single primary until ~100k ops/s or ~25 GB. Move to **Cluster**
when throughput/RAM limits hit. Plan **hash tags** for multi-key ops. Prefer
latency-aware replica reads when available.

---

## 2. Hot keys

Monitor per-shard CPU. Read-heavy → short in-process LRU. Writable hot keys →
N-way key replication across slots. At scale → client-side caching / BCAST.

---

## 3. Throughput and memory

Pipeline batch reads (slot-grouped in Cluster). Size pools by
`conns_per_pod × pods`; stagger restarts; fail-fast timeouts.
`maxmemory` ≈ 50% RAM; `allkeys-lru` (cache) or `volatile-lru` (mixed). Target
hit rate >95%; watch `evicted_keys`; replication lag low.

---

## 4. Quick checklist

- [ ] Sentinel vs Cluster decision explicit.
- [ ] Hash tags planned for multi-key.
- [ ] Hot-key mitigations.
- [ ] Pipelining + pooled clients + timeouts.
- [ ] maxmemory policy set.

See [reference.md](reference.md) and [examples.md](examples.md).
