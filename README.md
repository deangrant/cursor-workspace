# cursor-workspace

Reusable [Cursor](https://cursor.com) commands, rules, and agent skills for consistent, AI-assisted coding and domain guidance across projects.

## What’s in this repo

| Directory                    | Purpose                                                                                                       |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------- |
| [**commands/**](./commands/) | Command prompts and workflows — each `.md` file is a self-contained prompt you can run from chat or as a custom command. |
| [**rules/**](./rules/)       | Rule packs (formatting, style, conventions) — each with a rule file (`.mdc`) and optional README.             |
| [**skills/**](./skills/)     | Agent skills (domain knowledge, when-to-use guidance) — each with a `SKILL.md` and optional README/reference. |

- **Commands** are reusable prompts and workflows (e.g. read-only code review) you invoke from chat or as Cursor custom commands.
- **Rules** shape how the AI formats code, follows conventions, and applies style (e.g. Google Python/TypeScript, Rust style guide).
- **Skills** give the agent focused domain knowledge so it can help with specific topics (e.g. H3 geospatial indexing) when relevant.

## Quick start

- **Commands**: Use command files in chat (e.g. @-mention or paste) or configure as Cursor custom commands. See [commands/README.md](./commands/README.md) for the list and usage.
- **Rules**: Copy a rule folder into your project (e.g. `.cursor/rules/` or a `rules/` directory) and enable it in Cursor. See [rules/README.md](./rules/README.md) for the list and usage.
- **Skills**: Place skill folders where Cursor can see them (e.g. `.cursor/skills/` or a linked `skills/` directory). See [skills/README.md](./skills/README.md) for the list and usage.

## Adding content

- **New command**: Add a `.md` file under `commands/`, then add an entry to the table in [commands/README.md](./commands/README.md).
- **New rule**: Add a folder under `rules/` with a rule file (`.mdc`) and optional `README.md`, then add an entry to the table in [rules/README.md](./rules/README.md).
- **New skill**: Add a folder under `skills/` with a `SKILL.md` (and optional `README.md`), then add an entry to the table in [skills/README.md](./skills/README.md).
