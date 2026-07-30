# TypeScript / JSDoc inline documentation

Cursor rule for complete JSDoc and inline comments in TypeScript/TSX, assuming documentation will be generated from code (e.g. TypeDoc).

## When it applies

- **Globs:** `**/*.ts`, `**/*.tsx`
- **Always apply:** No (enable when working on docs or public API surface)

## What it covers

- **Core principle:** Document for future readers; explain why, not what.
- **What to document:** Public functions/methods, classes, interfaces/types, exported constants, complex logic, non-obvious decisions.
- **What to skip:** Private trivial helpers, single-line getters, standard patterns, test files.
- **JSDoc structure and tags:** `@description`, `@param`, `@returns`, `@throws`, `@example`, plus class/interface tags.
- **Examples:** Function, class, and interface documentation with full blocks and usage examples.
- **Inline comments:** When to use them, “why not what,” linking to context (RFCs, issues), and marking non-obvious behavior (IMPORTANT, WARNING).
- **Checklist:** Requirements for functions/methods, classes, and interfaces.
- **Anti-patterns:** No docs, stale docs, obvious comments, missing examples, copy-paste docs.

## Reference

- **Rule file:** [typescript-docstrings.mdc](./typescript-docstrings.mdc)

## How to use

Copy this folder into your project’s `.cursor/rules/` (or your rules directory) so the `.mdc` rule is loaded. Enable when writing or reviewing TypeScript/TSX documentation.
