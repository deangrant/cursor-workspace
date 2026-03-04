# Cursor Commands

A collection of reusable [Cursor](https://cursor.com) command prompts and workflows you can invoke from chat or as custom commands.

## What’s in this repo

Each markdown file is a self-contained command:

- **Command file (`.md`)** – the full prompt or instructions for the agent. Use in chat (e.g. @-mention or paste) or configure as a Cursor custom command so the agent follows it when the command is run.

## Available commands

| Command | Description |
| ------- | ----------- |
| [code-review-diff](./code-review-diff.md) | Run `git status` and `git diff`, then perform a read-only code review: describe correctness, security, performance, readability, testing gaps, and best-practice issues without modifying or suggesting code changes. |

## How to use

- **In chat**: Reference the file (e.g. @-mention the command file or paste its contents) so the agent follows the instructions.
- **As a custom command**: Configure Cursor to use the command file as a custom command; the agent will run the workflow when you invoke it.
- **As reference**: Clone or link this repo and open a command’s `.md` file to see the full prompt and scope.

## Adding commands

Add new commands as `.md` files in this directory (one file per command), then add an entry to the **Available commands** table above.
