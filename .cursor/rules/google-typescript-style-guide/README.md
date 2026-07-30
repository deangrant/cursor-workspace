# Google TypeScript Style Guide – Cursor Rule

This folder contains a [Cursor rule](.cursorrules) that instructs the AI to follow the [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html) when editing TypeScript or TSX in this project.

## When it applies

- **Scope**: TypeScript and TSX files (`**/*.ts`, `**/*.tsx`).
- **Behavior**: The rule applies when you are working with matching files (e.g. open in the editor or in context); it is not always-on for every conversation.

## What the rule covers

| Section                           | Topics                                                                                   |
| --------------------------------- | ---------------------------------------------------------------------------------------- |
| **1. Source file structure**      | UTF-8, section order, ES modules only, no `require` / `namespace`                        |
| **2. Imports and exports**        | Named exports only, relative paths, `import type`, no `export let`, no container classes |
| **3. Variables and literals**     | `const`/`let` only, array/object literals, spread rules, `for-in`                        |
| **4. Classes**                    | Semicolons, constructors, `readonly`, no `#private`, static/visibility, getters/setters  |
| **5. Functions**                  | Declarations vs arrows, callbacks, rest/spread, `this` usage                             |
| **6. Strings, numbers, coercion** | Single quotes, template literals, `Number()` parsing, enum coercion                      |
| **7. Control structures**         | Braces, `===`/`!==`, `for-of`, switch/default, exception handling                        |
| **8. Type system**                | Inference, interfaces, `T[]` vs `Array<T>`, avoid `any`, `unknown`, assertions           |
| **9. Naming**                     | UpperCamelCase, lowerCamelCase, CONSTANT*CASE, no `*` prefix/suffix                      |
| **10. Comments and JSDoc**        | When to use JSDoc, placement, no duplicate type info                                     |
| **11. Disallowed**                | No `var`, `eval`, `with`, `const enum`, ASI, custom decorators                           |
| **12. Formatting**                | `this` scope, destructuring defaults, grouping parentheses                               |

## Priority

When editing TypeScript/TSX, the rule says: **match existing style in the file first**, then apply this guide for new code and fixes.

## Reference

- [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html) (official)
