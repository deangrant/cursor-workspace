# Google Go Style Guide

Cursor rules for [Go Style at Google](https://google.github.io/styleguide/go/index): the Style Guide, Style Decisions, and Best Practices.

## Rules in this folder

| Rule | Source | Description |
|------|--------|--------------|
| **google-go-style.mdc** | [Overview](https://google.github.io/styleguide/go/index) | Principles, definitions, document structure, core guidelines. **Start here**; apply with the others. |
| **guide.mdc** | [Guide](https://google.github.io/styleguide/go/guide) | Normative + canonical: clarity, simplicity, concision, maintainability, consistency, formatting, naming. |
| **style-decisions.mdc** | [Decisions](https://google.github.io/styleguide/go/decisions) | Normative: naming, commentary, imports, errors, language, common libraries, test structure. |
| **best-practices.mdc** | [Best practices](https://google.github.io/styleguide/go/best-practices) | Naming, errors, docs, variables, functions, tests, strings, global state, CLI. |

**references.md** — Official links, document table, definitions (canonical, normative, idiomatic), and extra references.

## What they cover

- **Principles**: Consistency, maintainability, concision, simplicity, clarity (in that order; consistency breaks ties).
- **Naming**: No underscores (with narrow exceptions), MixedCaps, package/receiver/parameter repetition, getters, initialisms, test doubles, util packages.
- **Formatting**: `gofmt`, line length, literal formatting, nil slices, indentation.
- **Errors**: Structure, context, `%v` vs `%w`, logging, init/panic.
- **Documentation**: Parameters, context, concurrency, cleanup, errors, godoc.
- **Variables**: Initialization, composite literals, size hints, channel direction.
- **Functions**: Option structs, variadic options, argument lists.
- **Tests**: Assert in test, helpers, table-driven, subtests, no assertion libraries, useful failures.
- **Global state**: Prefer instance-based APIs; when globals are acceptable.
- **Language**: Interfaces, generics, receivers, control flow, copying, context.

## Scope

- **Globs**: `**/*.go`
- **alwaysApply**: `false` — active when Go files are in context.

## Usage

Copy this folder into your project’s rules directory (e.g. `.cursor/rules/`). Enable **google-go-style.mdc** for the overview and principles; enable **guide.mdc**, **style-decisions.mdc**, and **best-practices.mdc** for full coverage.
