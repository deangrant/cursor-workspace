# Wide Event Logging Rule

Framework-agnostic guidance for implementing **wide events** (canonical log lines) so logs are queryable and useful for debugging.

## What it does

- Teaches the wide-event model: one structured event per request per service, built over the request lifecycle and emitted once.
- Defines what to put in the event (request, service, user, business, error) and how to attach it via request context.
- Covers tail sampling and what to avoid (many log lines per request, string-only logs, low context).

## When to use

- When adding or refactoring logging in any service (HTTP, workers, etc.).
- When you want logs optimized for **querying** (e.g. by `user_id`, `error.code`, `status_code`) instead of only text search.
- Applies to any language or framework; use your stack’s request context (e.g. middleware, filters, thread-local, DI) to carry the event.

## Reference

- [Logging Sucks – Your Logs Are Lying To You](https://loggingsucks.com/) — source for wide events, cardinality/dimensionality, tail sampling, and the “one wide event per request” pattern.

## Usage

Copy this folder into your project (e.g. `.cursor/rules/` or `rules/`) and enable the rule. No glob is set so you can scope it in Cursor to the files or areas where you implement logging.
