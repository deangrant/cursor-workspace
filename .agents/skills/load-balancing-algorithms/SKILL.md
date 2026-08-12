---
name: load-balancing-algorithms
description: >-
  Choose load-balancing tiers and algorithms (round-robin, least-conn, consistent
  hash, Maglev-style) for L4 vs L7, with affinity and health-check guidance. Use
  when designing traffic distribution or fixing imbalance.
trigger: >-
  load balancing, round robin, least connections, consistent hashing, Maglev,
  L4 vs L7 load balancer, session affinity
---

# Load Balancing Algorithms

Use this skill when distributing traffic across backends.

---

## 1. Problem shape

Goals: availability, scale, latency. Homogeneous short HTTP vs variable work?
Need affinity (sessions/cache) or fully stateless? Flash crowds may need
admission **before** the LB.

---

## 2. L4 vs L7

- **L7:** content routing (URL, headers, cookies).
- **L4:** TLS passthrough, raw TCP/UDP, max PPS.

---

## 3. Algorithms (common)

| Algo | When |
| ---- | ---- |
| Round-robin / WRR | Homogeneous backends |
| Least connections | Variable request cost |
| Consistent hash / Maglev | Affinity, cache locality, graceful churn |
| Random / power-of-two | Simple good-enough with peer metrics |

Prefer **stateless backends** over sticky sessions when possible. Health checks
must match readiness (not just liveness).

---

## 4. Quick checklist

- [ ] L4 vs L7 chosen deliberately.
- [ ] Algorithm matches workload skew.
- [ ] Affinity justified or eliminated.
- [ ] Health checks = ready to serve.
- [ ] Imbalance metrics watched (p99 per backend).

See [reference.md](reference.md) and [examples.md](examples.md).
