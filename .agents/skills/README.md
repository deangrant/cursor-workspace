# Cursor Skills

A collection of reusable [Cursor](https://cursor.com) agent skills for domain
knowledge and specialized guidance. Canonical location in this workspace:
`.agents/skills/`. Cursor discovers them via `.cursor/skills` →
`.agents/skills`.

## What’s in this directory

Each subfolder is a self-contained skill with:

- **`SKILL.md`** – the skill Cursor uses (name, description, when to use, and
  domain content).
- **`README.md`** – (optional) human-facing overview of the skill and how to use
  it.
- **`reference.md`** – (optional) quick reference, links, or API notes.
- **`examples.md`** – (optional) runnable or copy-paste examples (naming varies
  by skill; some use `example.md`).

## Available skills

| Skill | Description |
| ----- | ----------- |
| [h3-hexagonal-hierarchical-spatial-index](./h3-hexagonal-hierarchical-spatial-index/) | Uber's H3 hexagonal hierarchical spatial index: hexagonal grids, location bucketing, geo-indexing, k-ring neighbors, compact/uncompact, directed edges. |
| [howde-algorithm](./howde-algorithm/) | HoWDe (Home and Work location Detection): detect home/work from stop sequences in Python or Rust, parameter tuning, mobility preprocessing. |
| [polars-rust](./polars-rust/) | Polars (Rust) performance best practices: lazy API, expression-based queries, Cargo features, allocators, tuning for production. |
| [solid-rust](./solid-rust/) | SOLID design principles in Rust: traits as interfaces, SRP/OCP/LSP/ISP/DIP, module boundaries, generics vs `dyn Trait`, dependency injection, refactoring for testability. |
| [typescript-project-structure](./typescript-project-structure/) | React + TypeScript project structure with atomic design: atoms, molecules, organisms, templates, folder-per-component (CSS Modules), pages, hooks, contexts, services, stores, barrel exports, naming rules. |

## How to use

- **In this workspace**: Skills live under `.agents/skills/` and are linked at
  `.cursor/skills`. The agent uses `SKILL.md` when the description matches the
  user’s task.
- **As reference**: Open a skill’s `README.md` or `reference.md` for scope and
  details.
- **Per skill**: See each skill’s `README.md` for when it applies and what it
  covers.

## Adding skills

Add new skills as subfolders under `.agents/skills/`: put a `SKILL.md` (with
frontmatter `name` and `description`) and an optional `README.md` in each
folder, then add an entry to the **Available skills** table above.
