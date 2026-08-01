# Ultracite / Biome code standards

Cursor rule pack that aligns the AI with
**[Ultracite](https://www.npmjs.com/package/ultracite)** expectations: a
zero-config Biome preset for strict formatting and linting on JavaScript and
TypeScript (including JSX/TSX). Use it alongside Ultracite in your project so
editor assistance matches what `npx ultracite check` and `npx ultracite fix`
enforce.

## Contents

| File | Purpose |
|------|--------|
| **[ultracite-code-standard.mdc](./ultracite-code-standard.mdc)** | Main rule — principles and conventions that complement Biome’s autofixes. Copy into `.agents/rules/` (or `.cursor/rules/`). |

## When it applies

- **Globs:** `**/*.{ts,tsx,js,jsx}`
- **Always apply:** No — the rule applies when matching files are in context
  (for example open in the editor or included in the task), not for every
  conversation.

## Ultracite CLI

Biome is the underlying engine (fast Rust-based lint and format). Typical
commands:

- **Format and apply safe fixes:** `npx ultracite fix`
- **Check without writing:** `npx ultracite check`
- **Diagnose setup:** `npx ultracite doctor`

Run `npx ultracite fix` before committing when your repo uses Ultracite so
tooling and the rule stay aligned.

## What the rule covers

Summarized from the `.mdc` (see the file for full wording):

- **Type safety and explicitness** — Clear types where they help; `unknown` over
  `any`; narrowing over assertions; meaningful names and constants.
- **Modern JavaScript/TypeScript** — Arrows for callbacks, `for...of`, optional
  chaining, nullish coalescing, template literals, destructuring, `const` /
  `let` (no `var`).
- **Async and promises** — `async`/`await`, proper awaiting, error handling, no
  async-as-executor antipatterns.
- **React and JSX** — Function components, hooks rules, keys, semantic HTML and
  ARIA, accessibility habits.
- **Errors and debugging** — No stray `console.log` / `debugger` / `alert` in
  production-minded code; throw `Error` with messages; meaningful `try`/`catch`.
- **Organization** — Small focused functions, early returns, readable
  conditionals, limited ternary nesting.
- **Security** — e.g. `rel="noopener"` on `target="_blank"`, careful use of
  `dangerouslySetInnerHTML`, no `eval`.
- **Performance** — Avoid heavy patterns in hot paths (e.g. spread in tight
  loops), sensible imports, prefer framework image components where applicable.
- **Framework notes** — Brief guidance for Next.js, React 19+ refs, and other
  frameworks’ attribute naming where relevant.
- **Testing** — Assertions inside tests, async tests without `done` callbacks,
  no committed `.only` / `.skip`.
- **When Biome can’t help** — Correctness, naming, architecture, edge cases, UX,
  and documentation are still on you.

## How to use

1. Copy this folder into your project’s `.agents/rules/` (and symlink
   `.cursor/rules` → `.agents/rules`), or copy
   [ultracite-code-standard.mdc](./ultracite-code-standard.mdc) directly into
   `.cursor/rules/`.
2. **Install and configure Ultracite/Biome in the repo** if you want local `npx
   ultracite` commands to match the rule; the rule describes conventions, not
   your `package.json`.
3. Use the rule when editing or reviewing JS/TS/JSX/TSX so AI suggestions stay
   consistent with Ultracite’s preset and the checklist above.

## Reference

- **Rule file:** [ultracite-code-standard.mdc](./ultracite-code-standard.mdc)
- **Ultracite (npm):** [ultracite](https://www.npmjs.com/package/ultracite)
- **Biome:** [biomejs.dev](https://biomejs.dev/)
