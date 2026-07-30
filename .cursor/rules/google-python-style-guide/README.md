# Google Python Style Guide – Cursor Rule

This folder contains a [Cursor rule](.cursorrules) that instructs the AI to follow the [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html) when editing Python in this project.

## When it applies

- **Scope**: Python files only (`**/*.py`).
- **Behavior**: The rule is always applied; it is used when working in this directory or when the AI is given context from these rules.

## What the rule covers

| Section                      | Topics                                                                                          |
| ---------------------------- | ----------------------------------------------------------------------------------------------- |
| **1. Lint and formatting**   | pylint, Black/Pyink, suppression comments, unused-argument handling                             |
| **2. Imports**               | Absolute imports only, import order, import modules (not symbols except typing/collections.abc) |
| **3. Formatting and layout** | 80-char lines, 4-space indent, blank lines, whitespace, no semicolons                           |
| **4. Naming**                | `lower_with_under`, `CapWords`, `CAPS_WITH_UNDER`, internal `_prefix`                           |
| **5. Docstrings**            | PEP 257, Args/Returns/Raises, module/class/function conventions                                 |
| **6. Language rules**        | Exceptions, no mutable defaults, truthiness, comprehensions, decorators, resources              |
| **7. Type annotations**      | Type hints, `X \| None`, `Self`, `collections.abc`, generics                                    |
| **8. Strings and logging**   | f-strings, logging with `%s` pattern (not f-strings in log messages)                            |
| **9. Other**                 | `main()`, `if __name__ == '__main__'`, TODO format, function length                             |

## Priority

When editing Python, the rule says: **match existing style in the file first**, then apply this guide for new code and fixes.

## Reference

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html) (official)
