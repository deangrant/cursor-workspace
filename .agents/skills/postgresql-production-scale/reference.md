# PostgreSQL Production Scale — Reference

## Anti-patterns

- One shared PgBouncer for app + batch workers
- 12-table joins on OLTP paths
- Unbounded idle transactions holding locks/snapshots

## Sources

- OpenAI ChatGPT PostgreSQL scaling; PgBouncer isolation posts
