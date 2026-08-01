# .agents

Shared **agent** assets for coding assistants: skills, command workflows, rule
packs, and after-edit hooks. Canonical content lives under `.agents/`.
Cursor-facing paths under `.cursor/` are symlinks into that tree so the editor
can discover commands and rules.

## What’s in this repo

| Directory | Purpose |
| --------- | ------- |
| [**.agents/commands/**](./.agents/commands/) | Agent command prompts and workflows — each `.md` file is a self-contained prompt for chat or custom commands. Linked for Cursor as `.cursor/commands` → `.agents/commands`. |
| [**.agents/skills/**](./.agents/skills/) | Agent skills — domain knowledge and when-to-use guidance (`SKILL.md`, optional README/reference/examples). |
| [**.agents/rules/**](./.agents/rules/) | Cursor rule packs (`.mdc`) — formatting, style, and conventions the agent follows while editing. Linked for Cursor as `.cursor/rules` → `.agents/rules`. |
| [**.agents/hooks/**](./.agents/hooks/) | Shell hooks for agent `afterFileEdit` events — format or lint the edited file (Biome, markdownlint). |

- **Skills** give the agent focused domain knowledge when a task matches (e.g. H3 geospatial indexing, SOLID in Rust, React TypeScript structure).
- **Commands** are reusable agent workflows (e.g. read-only code review, conventional commit messages).
- **Hooks** run after the agent edits a file (e.g. Biome `--write`, markdownlint `--fix` on that path).
- **Rules** constrain how the agent writes and reviews code (style guides, logging patterns, lint-aligned conventions).

### Cursor wiring

| Cursor path | Target |
| ----------- | ------ |
| `.cursor/commands` | `../.agents/commands` |
| `.cursor/rules` | `../.agents/rules` |

## Quick start

- **Skills**: Canonical location is `.agents/skills/`. See [.agents/skills/README.md](./.agents/skills/README.md).
- **Commands**: Invoke from chat (@-mention or paste) or as custom commands via `.cursor/commands`. See [.agents/commands/README.md](./.agents/commands/README.md).
- **Hooks**: Scripts under `.agents/hooks/` read Agent `afterFileEdit` JSON from stdin and act on `file_path`. Wire them in your Cursor hooks config to match local tooling.
- **Rules**: Canonical packs live in `.agents/rules/` and are exposed at `.cursor/rules`. Elsewhere, copy a pack into that project’s `.cursor/rules/` (or keep the same symlink pattern) and enable it. See [.agents/rules/README.md](./.agents/rules/README.md).

## Adding content

- **New skill**: Add a folder under `.agents/skills/` with a `SKILL.md` (and optional `README.md`), then add an entry to [.agents/skills/README.md](./.agents/skills/README.md).
- **New command**: Add a `.md` file under `.agents/commands/`, then add an entry to [.agents/commands/README.md](./.agents/commands/README.md).
- **New hook**: Add a shell script under `.agents/hooks/` (reuse [`lib/extract-file-path.sh`](./.agents/hooks/lib/extract-file-path.sh) for stdin JSON). Keep scripts focused on one tool or file type.
- **New rule**: Add a folder under `.agents/rules/` with a `.mdc` and optional `README.md`, then add an entry to [.agents/rules/README.md](./.agents/rules/README.md).
