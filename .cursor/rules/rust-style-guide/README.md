# Rust style guide

A Cursor rule pack that enforces consistent Rust formatting and style (line length, file size, rustfmt alignment, comments, naming, and API guidelines).

## Contents

| File | Purpose |
|------|--------|
| **rust-style-guide.mdc** | Main style rule — formatting, comments, naming, API guidelines. Copy into `.cursor/rules/`. |
| **rust-style-documentation.mdc** | Documentation rule — first sentence, module docs, canonical sections, `#[doc(inline)]`. Copy into `.cursor/rules/`. |
| **reference.md** | Links to official style guides and checklists (Rust, API guidelines, Microsoft, rustfmt). |

## Usage

1. Copy this folder into your project, or copy the `.mdc` rule file(s) you need into `.cursor/rules/`.
2. **rust-style-guide.mdc** and **rust-style-documentation.mdc** both apply when editing `**/*.rs` (and are set to always apply in their frontmatter).
3. For full context, the rules reference **reference.md**; keep that file next to the rules or adjust paths in the rules if needed.

## What it enforces

**rust-style-guide.mdc**

- **Formatting**: 100-char line length, 500-line file limit, 4-space indent, rustfmt-compatible style.
- **Comments & docs**: Line comments, doc comment placement, canonical sections.
- **Style**: Small functions, early returns, naming conventions, `Debug`/`Display` for public types, panic vs `Result`.
- **References**: Rust style guide, Rust API guidelines, Microsoft Pragmatic Rust, rustfmt.

**rust-style-documentation.mdc**

- **First sentence**: One-line summary (~15 words) for item and module docs; outer `///` / inner `//!` usage.
- **Module docs**: Public modules must have `//!` docs; what the module contains, when to use it, examples, side effects.
- **Canonical sections**: Summary plus `# Examples`, `# Errors`, `# Panics`, `# Safety`, `# Abort` when applicable.
- **Re-exports**: `#[doc(inline)]` for crate re-exports (not std/third-party). Aligns with Microsoft doc guidelines (M-FIRST-DOC-SENTENCE, M-MODULE-DOCS, M-CANONICAL-DOCS, M-DOC-INLINE).
