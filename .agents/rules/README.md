# Agent Rules

A collection of reusable rules for consistent AI-assisted coding across
projects. In this workspace they live under `.agents/rules/` and are exposed to
Cursor via `.cursor/rules` → `../.agents/rules`.

## What’s in this directory

Each subfolder is a self-contained rule pack with:

- **Rule file (`.mdc`)** – the rule the agent uses (formatting, style,
  conventions).
- **`README.md`** – what the rule does and when it applies.

## Available rules

| Rule | Description |
| ---- | ----------- |
| [ai-slop-mitigation](./ai-slop-mitigation/) | Concrete diffs, no filler, match repo style, verify claims. Opt-in (`alwaysApply: false`). |
| [api-errors-problem-json](./api-errors-problem-json/) | RFC 9457 Problem Details; never 200 with error body. Opt-in. |
| [api-idempotency-retries](./api-idempotency-retries/) | Idempotency-Key; Retry-After; backoff + jitter. Opt-in. |
| [api-observability-health](./api-observability-health/) | Request IDs, structured logs, live/ready split. Opt-in. |
| [api-pagination-query-conventions](./api-pagination-query-conventions/) | One pagination style; filter→sort→page. Opt-in. |
| [api-security-baseline](./api-security-baseline/) | TLS, authn≠authz, BOLA, secrets, rate limits. Opt-in. |
| [api-versioning-deprecation](./api-versioning-deprecation/) | Breaking vs additive; Sunset headers; 410. Opt-in. |
| [conventional-commits](./conventional-commits/) | `type(scope): description` commit message shape. Opt-in. |
| [graphql-conventions](./graphql-conventions/) | Nullability, connections, domain-layer auth. Opt-in. |
| [graphql-security-baseline](./graphql-security-baseline/) | Trusted docs / demand control, introspection off, field auth. Opt-in. |
| [incident-response-basics](./incident-response-basics/) | Prepare → identify → contain → eradicate → recover → lessons. Opt-in. |
| [npm-supply-chain-hardening](./npm-supply-chain-hardening/) | Lockfiles, pin/audit deps, install-script caution. Opt-in (package/lock globs). |
| [rest-api-conventions](./rest-api-conventions/) | URI/verbs/status/envelope REST conventions. Opt-in. |
| [ultracite-lint-format](./ultracite-lint-format/) | Ultracite/Biome JS/TS conventions. |
| [wide-event-logging](./wide-event-logging/) | Wide event / canonical log line logging. |

## How to use

- **In this workspace**: Packs live under `.agents/rules/` and are linked at
  `.cursor/rules`. Enable the `.mdc` rule(s) you need in the agent.
- **In another project**: Copy the rule folder into that project’s
  `.agents/rules/` and symlink `.cursor/rules` → `.agents/rules`, or copy
  directly into `.cursor/rules/` if you are not using the hoist layout.
- **As reference**: Open a pack’s `README.md` or `.mdc` for scope and details.
- **Per rule**: See the rule’s own `README.md` for scope (e.g. file globs) and
  details.

## Adding rules

Add new rule packs as subfolders under `.agents/rules/`: put a rule file
(`.mdc`) and an optional `README.md` in each folder, then add an entry to the
**Available rules** table above.
