# API Resource Naming and URI Design (Skill)

Agent skill for designing and reviewing **REST resource names and URIs**: nouns
not verbs, plural collections, nesting depth, kebab-case paths, path vs query
parameters, and path versioning.

## When to use

- **Design or review** REST endpoints and OpenAPI paths.
- **Keywords**: resource naming, URI design, REST paths, plural collections,
  nesting, kebab-case, path vs query, API versioning prefix.
- **Decisions**: whether a value belongs in the path or query string; how deep
  to nest; how to name non-CRUD actions; which casing and versioning scheme to
  keep consistent.

## What this skill covers

- **Nouns vs verbs** — HTTP methods supply actions; controller-style exceptions
  for non-CRUD intents.
- **Collections** — plural names and `/collection/{id}` for predictable CRUD.
- **Nesting** — containment at ≤1–2 levels; prefer direct IDs over deep trees.
- **Formatting** — kebab-case lowercase paths; no extensions; stable slash
  policy.
- **Parameters** — path for identity; query for filter/sort/page.
- **Versioning** — path prefix as a common operational choice; consistency
  over purity.
- **Consistency** — same ID, filter, nesting, and versioning rules everywhere.

## Files

| File | Purpose |
| ---- | ------- |
| [SKILL.md](SKILL.md) | Skill definition: rules, checklist (used by the agent) |
| [reference.md](reference.md) | Tables, anti-patterns, checklist |
| [examples.md](examples.md) | Numbered good vs bad HTTP URI samples |

## See also

- Narrative and triggers: [SKILL.md](SKILL.md)
- Lookup and checklists: [reference.md](reference.md)
- Copy-paste examples: [examples.md](examples.md)
