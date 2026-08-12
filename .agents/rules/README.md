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
| [api-errors-problem-json](./api-errors-problem-json/) | RFC 9457 Problem Details; never 200 with error body; field errors. Opt-in (`alwaysApply: false`). |
| [api-idempotency-retries](./api-idempotency-retries/) | Idempotency-Key on costly POSTs; Retry-After; backoff + jitter. Opt-in (`alwaysApply: false`). |
| [api-observability-health](./api-observability-health/) | X-Request-Id, structured logs, W3C traces, live/ready probe split. Opt-in (`alwaysApply: false`). |
| [api-pagination-query-conventions](./api-pagination-query-conventions/) | One pagination style; deterministic sort; filter→sort→page. Opt-in (`alwaysApply: false`). |
| [api-security-baseline](./api-security-baseline/) | TLS/HSTS, authn≠authz, BOLA, secrets hygiene, rate limits. Opt-in (`alwaysApply: false`). |
| [api-versioning-deprecation](./api-versioning-deprecation/) | Breaking vs additive; Deprecation/Sunset/Link; 410 Gone. Opt-in (`alwaysApply: false`). |
| [google-python-style-guide](./google-python-style-guide/) | [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html): lint/formatting, imports, naming, docstrings, types, and language conventions for Python. |
| [google-go-style-guide](./google-go-style-guide/) | [Google Go Style Best Practices](https://google.github.io/styleguide/go/best-practices): naming, errors, docs, tests, option structs, global state, and concurrency for Go. |
| [google-typescript-style-guide](./google-typescript-style-guide/) | [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html): modules, naming, types, classes, control flow, and formatting for TypeScript and TSX. |
| [rest-api-conventions](./rest-api-conventions/) | Nouns/plural/kebab URIs, verbs, status codes, envelopes; no GET mutations. Opt-in (`alwaysApply: false`). |
| [rust-style-guide](./rust-style-guide/) | Rust code style: 100-char lines, 500-line files, rustfmt alignment, comments, docs, naming, and alignment with official Rust and API guidelines. |
| [typescript-docstrings](./typescript-docstrings/) | TypeScript/JSDoc inline documentation: complete JSDoc and inline comments for public APIs, classes, and complex logic; “why not what”; TypeDoc-friendly. |
| [ultracite-lint-format](./ultracite-lint-format/) | Ultracite/Biome-oriented JS/TS/TSX/JSX: lint and format alignment, `npx ultracite` workflows, and principles (types, React, async, security, testing) alongside Biome autofixes. |
| [wide-event-logging](./wide-event-logging/) | Wide event / canonical log line logging: one structured event per request per service, high cardinality/dimensionality, tail sampling. Framework-agnostic; reference [loggingsucks.com](https://loggingsucks.com/). |

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
