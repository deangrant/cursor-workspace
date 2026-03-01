# Cursor Skills

A collection of reusable [Cursor](https://cursor.com) agent skills for domain knowledge and specialized guidance.

## What’s in this repo

Each subfolder is a self-contained skill with:

- **`SKILL.md`** – the skill Cursor uses (name, description, when to use, and domain content).
- **`README.md`** – (optional) human-facing overview of the skill and how to use it.
- **`reference.md`** – (optional) quick reference, links, or API notes.

## Available skills

| Skill | Description |
| ----- | ----------- |
| [h3-hexagonal-hierarchical-spatial-index](./h3-hexagonal-hierarchical-spatial-index/) | Uber's H3 hexagonal hierarchical spatial index: hexagonal grids, location bucketing, geo-indexing, k-ring neighbors, compact/uncompact, directed edges. |
| [howde-algorithm](./howde-algorithm/) | HoWDe (Home and Work location Detection): detect home/work from stop sequences in Python or Rust, parameter tuning, mobility preprocessing. |
| [polars-rust](./polars-rust/) | Polars (Rust) performance best practices: lazy API, expression-based queries, Cargo features, allocators, tuning for production. |

## How to use

- **In Cursor**: Place skill folders where Cursor can see them (e.g. `.cursor/skills/` or a linked `skills/` directory). The agent uses `SKILL.md` when the description matches the user’s task.
- **As reference**: Clone or link this repo and open a skill’s `README.md` or `reference.md` for scope and details.
- **Per skill**: See each skill’s `README.md` for when it applies and what it covers.

## Adding skills

Add new skills as top-level folders: put a `SKILL.md` (with frontmatter `name` and `description`) and an optional `README.md` in each folder, then add an entry to the **Available skills** table above.
