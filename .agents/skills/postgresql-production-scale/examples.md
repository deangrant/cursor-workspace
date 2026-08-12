# PostgreSQL Production Scale — Examples

**Prefer:** app → PgBouncer-A → replica; workers → PgBouncer-B → replica/primary.

**Avoid:** thousands of app pods opening direct connections to primary.
