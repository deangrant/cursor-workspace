# Code Review (Skill)

Agent skill for a **read-only** technical code review. Scope is either a git
**diff** or the **full** codebase. Does not edit or rewrite code.

## When to use

- User asks to review a diff or the whole project.
- Slash commands `/code-review-diff` or `/code-review-full` (thin pointers that
  set scope).

## Files

| File | Purpose |
| ---- | ------- |
| [SKILL.md](SKILL.md) | Shared review rules and `diff` / `full` scope modes |
