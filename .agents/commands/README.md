# Agent Commands

A collection of reusable command prompts and workflows you can invoke from chat
or as custom commands. In this workspace they live under `.agents/commands/` and
are exposed to Cursor via `.cursor/commands` → `../.agents/commands`.

## What’s in this directory

Each markdown file is a self-contained command:

- **Command file (`.md`)** – the full prompt or instructions for the agent. Use
  in chat (e.g. @-mention or paste) or configure as a custom command so the
  agent follows it when the command is run.

## Available commands

| Command | Description |
| ------- | ----------- |
| [code-review-diff](./code-review-diff.md) | Run `git status` and `git diff`, then perform a read-only code review: describe correctness, security, performance, readability, testing gaps, and best-practice issues without modifying or suggesting code changes. |
| [code-review-full](./code-review-full.md) | Explore the full project codebase (source, config, entrypoints), then perform a read-only code review: describe correctness, security, performance, readability, testing gaps, and best-practice issues without modifying or suggesting code changes. |
| [coderabbit-review](./coderabbit-review.md) | Run `coderabbit review --agent`, prioritize findings into Critical / Maintainability / Style, apply fixes autonomously from Critical downward, clean up imports and types, then output a checkbox list of resolved items. |
| [git-conventional-commit](./git-conventional-commit.md) | Run `git status` and `git diff`, then produce a single Conventional Commits 1.0.0–compliant commit message; the agent must not run `git commit` or apply the commit. |

## How to use

- **In chat**: Reference the file (e.g. @-mention the command file or paste its
  contents) so the agent follows the instructions.
- **As a custom command**: Use `.cursor/commands` (symlinked to
  `.agents/commands`) or configure the agent to load the command file; the agent
  will run the workflow when you invoke it.
- **As reference**: Open a command’s `.md` file under `.agents/commands/` to see
  the full prompt and scope.

## Adding commands

Add new commands as `.md` files under `.agents/commands/` (one file per
command), then add an entry to the **Available commands** table above.
