# Cursor Rules

A collection of reusable [Cursor](https://cursor.com) rules for consistent AI-assisted coding across projects.

## What’s in this repo

Each subfolder is a self-contained rule pack with:

- **`.cursorrules`** – the rule Cursor uses (formatting, style, conventions).
- **`README.md`** – what the rule does and when it applies.

## Available rules

| Rule                                                      | Description                                                                                                                                                              |
| --------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [google-python-style-guide](./google-python-style-guide/) | [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html): lint/formatting, imports, naming, docstrings, types, and language conventions for Python. |

## How to use

- **In a project**: Copy the rule folder into your repo (e.g. `.cursor/rules/` or a `rules/` directory) and reference or enable it in Cursor.
- **As reference**: Clone or link this repo and point Cursor (or your rule config) at the `.cursorrules` file you want.
- **Per rule**: See the rule’s own `README.md` for scope (e.g. file globs) and details.

## Adding rules

Add new rule packs as top-level folders: put a `.cursorrules` file and an optional `README.md` in each folder, then add an entry to the **Available rules** table above.
