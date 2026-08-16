# Technical Writing — TW Two Reference

Advanced craft from Google Technical Writing Two. Use after a solid first draft.

## Self-editing loop

```
Draft → refine → peer review → publish
         ↑________________|
```

1. Adopt a style guide (project guide or Google developer style highlights).
2. Prefer **second person** ("you"); put **conditions before instructions**.
3. Use **code font** for identifiers in prose.
4. Read aloud; edit on a fresh pass; invite a peer editor when stakes are high.
5. Make chosen tips routine — not one-off heroics.

## Large documents

| Reader behavior | Prefer |
| --------------- | ------ |
| Site search for answers | Shorter linked docs |
| In-page browser search | Longer standalone pages |
| How-to / intro for new readers | Shorter docs |
| Deep tutorial / CLI reference | Longer docs (scanned, not one sitting) |

- Outline as a **narrative** the reader can follow.
- Add navigation / signposting; use **progressive disclosure** (overview → detail).
- Prefer task-oriented headings over cute titles.
- Split when a single page hurts navigation; keep tutorials coherent.

## Illustrations

Instructive graphics teach; decorative graphics only increase liking.

**Caption-first:** write the takeaway caption → draw to match → revise both.

| Good caption | Bad caption |
| ------------ | ----------- |
| Brief; states takeaway | Long prose under figure |
| Focuses attention | Restates the obvious |

Prefer SVG when practical; constrain detail; use callouts; re-illustrate when
architecture changes. Provide alt text / accessible descriptions.

## Sample code

Treat samples as first-class docs: **correct, concise, understandable,
commented, reusable, sequenced**.

| Requirement | Practice |
| ----------- | -------- |
| Compiles / runs | Test and maintain; mark untested snippets |
| Does what it claims | Match surrounding prose |
| Production quality | Secure; idiomatic; canonical pattern |
| Educates | Why-comments; complexity ladder; anti-examples for subtle pitfalls |

Explain before run: dependencies, install, env/config, expected output.

Unit tests verify behavior; samples educate readers — don't confuse the goals.

## Using LLMs in technical writing

Workflows: **Draft → Revise → Format → Summarize** with human QA each step.

| Workflow | Guardrail |
| -------- | --------- |
| First draft | Verify facts; don't skip thinking |
| Revise | Reorganize before copy edit |
| Format | Check headings, links, style |
| Summarize | Accuracy over brevity |

Prompt checklist: audience, goal, prerequisites, tone, constraints, good/bad
examples, required structure. Attach private or current material — models invent
gaps. Good prompts are good technical writing aimed at a model.

## Sources

- Google Technical Writing Two (developers.google.com/tech-writing/two)
- Units: self-editing, organizing large documents, illustrating, sample code, LLMs
