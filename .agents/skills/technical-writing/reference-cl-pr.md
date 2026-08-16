# Technical Writing — CL / PR Descriptions

How to write change-list and pull-request descriptions so reviewers and future
readers understand **what** changed and **why**. From Google Engineering
Practices (writing good CL descriptions), reinforced by TW One clarity rules.

## Purpose

The description becomes **permanent VCS history**. Future readers search it;
rationale that lives only in code is hard to find (Chesterton's fence).

## Required content

| Question | Include |
| -------- | ------- |
| **What** | Major changes summarized — grasp without reading every file |
| **Why** | Context, decisions not in source, tradeoffs, rejected alternatives |

Even small changes need context.

## First line

- Short, focused **what** that **stands alone** in history lists.
- **Complete sentence**, **imperative** mood (active voice).
- Blank line after the first line.
- Tags on the first line only if short — don't obscure the content.

**Example:** `Replace the FizzBuzz RPC with the OrderService gateway.`

## Body

- Expand what/why; link bugs/docs; note test plan or risk.
- Prefer scannable bullets for multi-part changes.
- Consistent terminology with the codebase.
- No ambiguous "this/that" without antecedents.

## Anti-patterns

- Empty or "fix stuff" descriptions.
- Only a ticket number with no summary.
- Past tense / vague first lines that don't stand alone.
- Rationale only in chat — never recorded in the CL.

## Sources

- Google Engineering Practices: Writing good CL descriptions
- Technical Writing One (active voice, audience, paragraphs)
