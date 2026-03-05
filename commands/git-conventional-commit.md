# Git Conventional Commit

**First:** Run `git status` and `git diff` in the project (or use the status/diff output the user provides). **Then:** Produce a single Conventional Commits 1.0.0–compliant commit message. **You must not run `git commit` or apply the commit—only output the commit message text.**

---

You are helping write a commit message that follows [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/). Your job is to analyze the changes and output one commit message. Do not run `git add` or `git commit`; do not modify repository state.

### Inputs / Analyze & understand

- Run `git status` and `git diff` (or use status/diff the user pasted).
- Fully understand: **WHAT** changed, **WHY** it changed, the scope and impact, and any architectural or behavioral implications.
- Infer from the diff whether anything is breaking.
- The commit message must serve as: a semantic versioning signal, a changelog entry, and technical documentation for future maintainers.

### Format (Conventional Commits 1.0.0)

All commit messages **MUST** follow:

```
<type>(<scope>): <short summary>

<detailed description explaining WHAT changed and WHY it changed>

* <bullet point describing each logical change>
* <bullet point describing each new file/component>
* <bullet point describing each refactor or structural modification>
```

**Header:** `<type>(<scope>): <short summary>`

- **Type:** Required. Infer from diff. Use the table below. Per spec, type is a noun (e.g. `feat`, `fix`) followed by the required terminal colon and space.
- **Scope:** Required. Infer from diff. Per spec, scope MUST be a noun describing a section of the codebase in parentheses, e.g. `feat(parser):`, `fix(auth):`.
- **Summary:** Required. Must immediately follow the colon and space. Under 72 characters. Sentence case. No trailing period. Imperative mood. Clear and specific. MUST NOT include PR numbers.

**Allowed types** (infer based on diff):

| Type       | Use case                                      | Version impact |
|------------|-----------------------------------------------|----------------|
| `feat`     | New functionality                             | MINOR bump     |
| `fix`      | Bug fix                                       | PATCH bump     |
| `refactor` | Code restructuring without behavior change    | —              |
| `perf`     | Performance improvements                       | —              |
| `docs`     | Documentation only                            | —              |
| `test`     | Adding or modifying tests                      | —              |
| `style`    | Formatting only                               | —              |
| `build`    | Build system or dependencies                   | —              |
| `ci`       | CI configuration                              | —              |
| `chore`    | Maintenance tasks                             | —              |
| `revert`   | Revert a previous commit                      | —              |

**Breaking changes:** Use `!` after type/scope (e.g. `feat(api)!: change authentication flow`) OR add a footer: `BREAKING CHANGE: <description>`. When using the footer, the token MUST be uppercase `BREAKING CHANGE` (or `BREAKING-CHANGE`; both are valid per spec).

**Body:** Required. One blank line after the header. The body **MUST**:
- Explain **WHAT** changed and **WHY** it was changed.
- Explain impact (technical, user-facing, architectural).
- Avoid low-level implementation details (not HOW).
- Be written in professional technical language.
- Read like release notes + architectural documentation.

**Bullets:** Required after the body. One blank line after the body, then:
- Use `*` bullets.
- One bullet per logical change.
- Include: new files/modules, major refactors, API changes, schema changes, dependency updates, config changes.
- Bullets must be concise but specific.
- Each bullet MUST be a complete, human-readable sentence (not fragments or shorthand).
- Each bullet MUST end with a period (`.`).

**Footers:** Optional. One blank line after the bullets. Per spec: each footer = a word token + `:<space>` or `<space>#` + value (git trailer style). Footer tokens MUST use `-` in place of spaces (e.g. `Acked-by`, `Reviewed-by`). Exception: `BREAKING CHANGE` or `BREAKING-CHANGE` may be used as the token. Multiple footers allowed, e.g. `Refs: #123`, `Reviewed-by: Name`.

### Description, language & quality

- Per spec §15: type, scope, and description are not case-sensitive; use lowercase consistently for type and scope. The footer token `BREAKING CHANGE` MUST be uppercase (or `BREAKING-CHANGE`).
- MUST be written in English with a professional tone.
- MUST avoid vague phrases: “stuff”, “various fixes”, “minor changes”.
- MUST avoid generic summaries: “update code”, “fix bug”. Be precise.
- Every commit message must: be understandable 6 months later without context; clearly justify the change; map cleanly to semantic versioning; be suitable for auto-generated changelogs.

### Output

Produce **one** commit message:
1. Header line: `type(scope): summary`
2. Blank line, then body paragraph(s).
3. Blank line, then bullet list.
4. Optional footers with correct blank lines.

The message must be ready for the user to paste into `git commit -m "..."` or `git commit -F -`. Output only the commit message (or a clear code block containing it).

### Prohibited

- Do **not** run `git add` or `git commit`. Do **not** modify the repository or apply the commit.
- Do **not** output multiple commit messages.
- Do **not** omit scope or body.
- Do **not** describe implementation minutiae.
- Do **not** produce overly short or overly verbose commit messages.
- Do **not** treat the description as optional—it MUST immediately follow the type/scope prefix (spec §5).
- Only produce the suggested commit message text.

### Example

```
feat(api): add cursor-based pagination to list endpoints

Replace offset-based listing with cursor-based pagination so
large result sets can be traversed without timeouts or
inconsistent ordering. This reduces memory pressure on the
server and gives clients a stable contract for incremental
fetching.

* Add optional query parameters `cursor` and `limit` to list endpoints.
* Return `next_cursor` and `has_more` in list response envelopes.
* Persist cursor encoding as base64-encoded (timestamp, id) tuple.
* Update OpenAPI spec and request validation for new parameters.
* Add integration tests for pagination and cursor expiry behavior.
```
