# SOLID Design Principles — Rust (Skill)

Agent skill for applying **SOLID** (SRP, OCP, LSP, ISP, DIP) when designing and
reviewing **Rust** code: traits as interfaces, module boundaries, generics vs
`dyn Trait`, constructor injection, and dependency direction.

## When to use

- **Design or review** Rust modules, traits, and public APIs for
  maintainability.
- **Keywords**: SOLID, SRP, OCP, LSP, ISP, DIP, traits, trait objects, `dyn
  Trait`, dependency injection, refactoring for tests, abstraction boundaries.
- **Decisions**: whether to split a type or trait, when generics beat `dyn`, how
  high-level code should depend on infrastructure.

## What this skill covers

- **SOLID mapped to Rust** — cohesion, `impl` extension, behavioral contracts on
  traits, small role traits, traits at domain boundaries.
- **Mechanisms** — `pub` / `pub(crate)`, ownership and borrowing at API edges,
  static vs dynamic dispatch, test doubles via traits.
- **Balance** — when extra abstraction is justified vs over-engineering (per
  principle checklists).

## Files

| File | Purpose |
|------|--------|
| [SKILL.md](SKILL.md) | Skill definition: narrative guide, quick checklist, links (used by the agent) |
| [reference.md](reference.md) | Tables, expanded checklists, trait composition, “when to apply vs overkill” |
| [examples.md](examples.md) | Numbered Rust snippets for SRP through DIP (including `ExportRequest` / `ChunkBuffer` patterns) |

## See also

- Narrative and triggers: [SKILL.md](SKILL.md)
- Lookup and checklists: [reference.md](reference.md)
- Copy-paste examples: [examples.md](examples.md)
