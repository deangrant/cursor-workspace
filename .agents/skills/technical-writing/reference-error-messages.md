# Technical Writing — Error Messages Reference

Failure copy is often the primary product surface when things break (IDE, CLI,
UI, API `message`). Formula from Google's error-messages course:

```
1. What went wrong?
2. How does the user fix it?
```

## General rules

- Do not fail silently.
- Raise early with a clear message.
- Prefer stable machine codes + human `message` (e.g. AIP-193 style) when APIs.
- Same problem → same wording when possible.

## Question 1 — Cause

Be **specific**, not labeled:

| Anti-pattern | Prefer |
| ------------ | ------ |
| `Bad directory.` | Named path; exists but not writable; how to fix |
| `Invalid field 'picture'.` | Rule (once only); observed count; version note if changed |

Include: named entity, actual condition, rule violated, fix path, context.

## User inputs

When the user entered the bad value, echo **both** value and rule:

| Pattern | Example |
| ------- | ------- |
| `{entity} ({actual}) {relation} {constraint} ({limit})` | Bid ($5) is below the minimum ($8) |

Long inputs: truncate or progressive disclosure — don't flood.

## Requirements and constraints

Do not assume users know quotas, groups, or timeouts. State limits explicitly
(size caps, required roles, timeout seconds).

## Question 2 — How to fix

Actionable recovery steps. Prefer UI/CLI actions the user can take. Offer
multi-path fixes when valid. Link to docs for deep procedures.

## Examples in the message

For format/rules: show valid patterns; Incorrect/Correct pairs when helpful.

## Concise, not cryptic

Cut filler; use active voice. Do not over-trim into opaque labels
("Invalid ID" → show the expected shape).

## Double negatives

Avoid *cannot … not*, *unless* piles. Prefer positive phrasing or bulleted roles.

## Audience and terminology

Match vocabulary (consumer vs ops). One term per entity; glossary-aligned.
Don't blame the user; no *sorry* / *please* / humor in system errors. Prefer
positive imperatives ("Enter a date as YYYY-MM-DD").

## Format for readability

- Doc links for deep fixes.
- Progressive disclosure for long details.
- Inline carets / field paths when useful.
- Color **and** non-color cues for accessibility.

## Sources

- Google Developers Technical Writing: Error Messages course
