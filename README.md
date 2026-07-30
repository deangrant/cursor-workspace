# .agents

Shared **agent** assets for coding assistants: skills, command workflows, rule
packs, and after-edit hooks. Canonical agent content lives under `.agents/`;
Cursor-facing paths under `.cursor/` wire those assets into the editor (rules,
and a skills symlink).

## What’s in this repo

| Directory | Purpose |
| --------- | ------- |
| [**.agents/commands/**](./.agents/commands/) | Agent command prompts and workflows — each `.md` file is a self-contained prompt for chat or custom commands. |
| [**.agents/skills/**](./.agents/skills/) | Agent skills — domain knowledge and when-to-use guidance (`SKILL.md`, optional README/reference/examples). Linked for Cursor as `.cursor/skills` → `.agents/skills`. |
| [**.agents/hooks/**](./.agents/hooks/) | Shell hooks for agent `afterFileEdit` events — format or lint the edited file (Biome, markdownlint). |
| [**.cursor/rules/**](./.cursor/rules/) | Cursor rule packs (`.mdc`) — formatting, style, and conventions the agent follows while editing. |

- **Skills** give the agent focused domain knowledge when a task matches (e.g. H3 geospatial indexing, SOLID in Rust, React TypeScript structure).
- **Commands** are reusable agent workflows (e.g. read-only code review, conventional commit messages).
- **Hooks** run after the agent edits a file (e.g. Biome `--write`, markdownlint `--fix` on that path).
- **Rules** constrain how the agent writes and reviews code (style guides, logging patterns, lint-aligned conventions).

## Quick start

- **Skills**: Canonical location is `.agents/skills/`; this repo links `.cursor/skills` → `.agents/skills` so Cursor can discover them. See [.agents/skills/README.md](./.agents/skills/README.md).
- **Commands**: Invoke from chat (@-mention or paste) or as custom commands. See [.agents/commands/README.md](./.agents/commands/README.md).
- **Hooks**: Scripts under `.agents/hooks/` read Agent `afterFileEdit` JSON from stdin and act on `file_path`. Wire them in your Cursor hooks config to match local tooling.
- **Rules**: Packs live in `.cursor/rules/` here; elsewhere, copy a pack into that project’s `.cursor/rules/` and enable it. See [.cursor/rules/README.md](./.cursor/rules/README.md).

## Adding content

- **New skill**: Add a folder under `.agents/skills/` with a `SKILL.md` (and optional `README.md`), then add an entry to [.agents/skills/README.md](./.agents/skills/README.md).
- **New command**: Add a `.md` file under `.agents/commands/`, then add an entry to [.agents/commands/README.md](./.agents/commands/README.md).
- **New hook**: Add a shell script under `.agents/hooks/` (reuse [`lib/extract-file-path.sh`](./.agents/hooks/lib/extract-file-path.sh) for stdin JSON). Keep scripts focused on one tool or file type.
- **New rule**: Add a folder under `.cursor/rules/` with a `.mdc` and optional `README.md`, then add an entry to [.cursor/rules/README.md](./.cursor/rules/README.md).
