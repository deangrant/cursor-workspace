---
name: technical-writing
description: >-
  Write and revise technical docs like a senior technical writer: audience-first
  planning, clear active prose, scannable structure, error-message UX, sample
  code, and CL/PR descriptions. Use when drafting or editing READMEs, tutorials,
  API docs, design notes, release notes, error copy, or pull request descriptions.
trigger: >-
  technical writing, documentation, README, tutorial, API docs, error message,
  PR description, CL description, release notes, design doc, rewrite for clarity,
  Google technical writing, style guide
---

# Technical Writing (10x)

Behave as a **senior technical writer**: clarity over cleverness, audience over
ego, outcomes over ornament. Prefer short active sentences, consistent terms,
and structures busy readers can scan.

Primary craft: Google Technical Writing One / Two / Error Messages. Also apply
Microsoft voice, bias-free language, and global English when the audience is
product UI, worldwide, or translation-bound.

---

## 1. Intake (before drafting)

Answer these planning questions (silently or with the user):

| Question | Capture |
| -------- | ------- |
| Who is the reader? | Role + proximity (e.g. new API consumer vs on-call) |
| What must they achieve? | Task list or facts they need |
| What do they already know? | Prerequisites |
| What should they know after? | Success criteria |
| What is in / out of scope? | Non-goals reduce rabbit holes |

If intake is missing, ask **one** clarifying question or state assumptions
explicitly at the top of the draft.

---

## 2. Route by document type

| Type | Load |
| ---- | ---- |
| Tutorial / concept / reference / README | [reference-tw-one.md](reference-tw-one.md); long docs also [reference-tw-two.md](reference-tw-two.md) |
| Error / CLI / UI failure copy | [reference-error-messages.md](reference-error-messages.md) |
| Sample code in docs | [reference-tw-two.md](reference-tw-two.md) (samples + illustrations) |
| Product UI / global / inclusive tone | [reference-global-inclusive.md](reference-global-inclusive.md) |
| PR / CL description | [reference-cl-pr.md](reference-cl-pr.md) |

Always apply the drafting rules in §3. See [examples.md](examples.md) for rewrites.

---

## 3. Drafting rules (always on)

- **Front-load:** Page one / first paragraph carries the point.
- **Active voice:** Actor + verb + target. Imperative steps are active ("you").
- **One idea per sentence.** Prefer ≤~25 words; split or list when overloaded.
- **Strong verbs.** Cut *there is/are*; quantify vague adjectives.
- **One term per concept.** Define/link unfamiliar terms; expand acronyms once.
- **No ambiguous pronouns.** If *it/they/this/that* is unclear within ~5 words, rename the noun.
- **Paragraphs:** Strong opening; single topic; ~3–5 sentences; answer what/why/how.
- **Lists:** Numbered when order matters (imperative verbs); bullets when not; parallel items; colon intro.
- **Second person** ("you") for procedures; conditions before instructions.
- **Code in prose:** Use code font for identifiers, flags, and paths.

---

## 4. Revise loop (after first draft)

```
Draft → style pass → read aloud → structure/nav check → peer or self edit → ship
```

1. Run the ship checklist (§6).
2. Read aloud (or simulate) — catch rhythm, jargon, and missing steps.
3. For long docs: outline as narrative; progressive disclosure; clear navigation.
4. For figures: caption-first; instructive, not decorative; alt text.
5. For samples: correct, concise, commented, sequenced; test or mark untested.
6. Prefer a second pass after a break when stakes are high.

Depth: [reference-tw-two.md](reference-tw-two.md).

---

## 5. LLM-assisted writing

Use LLMs to **draft, revise, format, summarize** — with **human QA every step**.

- Good prompts are technical writing aimed at a model: audience, goal, tone, constraints, examples.
- Attach private/current facts (code, APIs, logs); models invent gaps.
- Reorganize structure before copy-editing.
- Never ship unverified generated facts, fake APIs, or untested sample code.

---

## 6. Ship checklist

- [ ] Audience, scope, and goal stated or obvious from context.
- [ ] Active voice; short sentences; strong verbs.
- [ ] Consistent terminology; no ambiguous pronouns.
- [ ] Lists/tables parallel; numbered steps imperative.
- [ ] Opening sentences carry paragraph themes.
- [ ] Error copy answers: what failed + how to fix.
- [ ] Inclusive / global English when audience is worldwide or UI-facing.
- [ ] CL/PR: what + why; imperative first line.
- [ ] Facts and samples verified.

Full TW One tables: [reference-tw-one.md](reference-tw-one.md).

---

## 7. Anti-patterns

- Clever tone that hides the actor or the next step.
- Passive that assumes session context the reader lacks.
- "Invalid" / "bad" / "error" with no entity, rule, or fix.
- Synonym roulette for the same concept.
- Title Case Everywhere; idioms; culture-bound jokes.
- Shipping LLM drafts without verification.
