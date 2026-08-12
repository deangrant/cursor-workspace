---
name: postgresql-production-scale
description: >-
  Scale PostgreSQL for read-heavy production: replicas, PgBouncer isolation,
  query hygiene, WAL fan-out planning, and write-path limits. Use when hardening
  Postgres under high QPS or connection storms.
trigger: >-
  PostgreSQL scaling, PgBouncer, read replicas, Postgres connection pooling,
  idle_in_transaction, cascading replication, ChatGPT Postgres
---

# PostgreSQL Production Scale

Use this skill for **read-heavy Postgres** at high QPS (single primary + replicas).

---

## 1. Architecture

Confirm read-heavy workload. Plan write sharding before MVCC/write limits bite.
Avoid new hot tables on a write-constrained legacy primary. Plan **cascading
replication** before WAL fan-out saturates the primary (~50 replicas class).

---

## 2. Primary protection

Offload reads to replicas; minimize reads inside write transactions. Hot standby
+ tested failover. Lazy writes; rate-limited backfills; eliminate redundant writes.

---

## 3. Query hygiene

Ban heavy OLTP multi-table joins. Audit ORM SQL. Set
`idle_in_transaction_session_timeout`. Query digest rate limits + emergency
blocking.

---

## 4. Connections

PgBouncer per replica (statement/transaction mode). **Separate pools** for app
vs workers — do not share one pooler. Co-locate pooler + app + replica in region.

---

## 5. Quick checklist

- [ ] Replica-first reads; protected primary.
- [ ] Cascading replication plan if replica count grows.
- [ ] Pool isolation per consumer class.
- [ ] Idle-in-tx timeout; ORM SQL audited.
- [ ] Failover tested.

See [reference.md](reference.md) and [examples.md](examples.md).
