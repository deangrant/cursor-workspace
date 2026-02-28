# Cursor Rules

A collection of reusable [Cursor](https://cursor.com) rules for consistent AI-assisted coding across projects.

## What’s in this repo

Each subfolder is a self-contained rule pack with:

- **Rule file (`.mdc`)** – the rule Cursor uses (formatting, style, conventions). Copy into `.cursor/rules/` in your project.
- **`README.md`** – what the rule does and when it applies.

## Available rules

| Rule                                                         | Description                                                                                                                                                                   |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [google-python-style-guide](./google-python-style-guide/)    | [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html): lint/formatting, imports, naming, docstrings, types, and language conventions for Python.      |
| [google-go-style-guide](./google-go-style-guide/)            | [Google Go Style Best Practices](https://google.github.io/styleguide/go/best-practices): naming, errors, docs, tests, option structs, global state, and concurrency for Go. |
| [google-typescript-style-guide](./google-typescript-style-guide/) | [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html): modules, naming, types, classes, control flow, and formatting for TypeScript and TSX. |
| [rust-style-guide](./rust-style-guide/)                      | Rust code style: 100-char lines, 500-line files, rustfmt alignment, comments, docs, naming, and alignment with official Rust and API guidelines.                             |

## How to use

- **In a project**: Copy the rule folder into your repo (e.g. `.cursor/rules/` or a `rules/` directory) and reference or enable it in Cursor.
- **As reference**: Clone or link this repo and point Cursor (or your rule config) at the `.mdc` rule file you want.
- **Per rule**: See the rule’s own `README.md` for scope (e.g. file globs) and details.

## Adding rules

Add new rule packs as top-level folders: put a rule file (`.mdc`) and an optional `README.md` in each folder, then add an entry to the **Available rules** table above.
