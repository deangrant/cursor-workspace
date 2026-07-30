---
name: typescript-project-structure
description: >-
  Organize React + TypeScript projects with atomic design. Use when creating or
  reviewing a React TypeScript folder layout, placing components in atoms,
  molecules, organisms, or templates, applying folder-per-component with CSS
  Modules, or deciding where pages, hooks, contexts, services, stores, routes,
  types, constants, utils, styles, assets, or i18n files belong.
trigger: >-
  React TypeScript project structure, atomic design, atoms, molecules,
  organisms, templates, folder-per-component, CSS Modules, React folder layout,
  pages, hooks, contexts, services, stores, barrel export, component hierarchy
---

# TypeScript Project Structure (React)

Use this skill when you shape a **React + TypeScript** app. Atomic design
groups UI into layers. A clear folder tree keeps shared code apart from page
code.

Do not use this full layout for a tiny prototype. Use it when the app grows and
many people share the code.

---

## 1. Atomic design layers

Atomic design has four UI layers in this skill:

| Layer | Role | Examples |
| ----- | ---- | -------- |
| **Atom** | Smallest UI unit. No business logic. | `Button`, `Input`, `Label` |
| **Molecule** | Small group of atoms. One clear job. | `FormField`, `Card` |
| **Organism** | Large UI block. Uses atoms and molecules. | `Header`, `UserProfile` |
| **Template** | Page skeleton. Holds organisms in layout slots. | `MainLayout`, `AuthLayout` |

**Put each component in the correct layer.**

- Put a leaf UI control in `components/atoms/`.
- Put a small composed control in `components/molecules/`.
- Put a feature section in `components/organisms/`.
- Put a page layout shell in `components/templates/`.

**Move a component when reuse changes.**

- Promote a page-local component to `components/` when two or more pages use it.
- Demote a shared component to a page folder when only one page uses it.

---

## 2. Folder-per-component (default)

Put each shared component in its own folder. Use these files:

| File | Purpose |
| ---- | ------- |
| `index.tsx` | Component logic and JSX. |
| `index.module.css` | Styles for this component (CSS Modules). |
| `index.types.ts` | TypeScript types for this component. |

Export the component from `index.tsx`. Import styles from `index.module.css`.
Keep types in `index.types.ts`.

Add a barrel export file `index.ts` in each layer folder (`atoms/`,
`molecules/`, `organisms/`, `templates/`). Re-export the public components from
that file.

---

## 3. Top-level `src/` layout

| Folder or file | Purpose |
| -------------- | ------- |
| `assets/` | Static files: images, icons, fonts, audio, JSON. |
| `components/` | Shared UI by atomic layer. |
| `constants/` | App-wide constant values. |
| `pages/` | Route pages. Each page may own local components. |
| `contexts/` | React context providers and related types. |
| `hooks/` | Shared custom hooks (`use[Name]`). |
| `routes/` | Route maps and route guard components. |
| `services/` | API calls and external integrations. |
| `stores/` | App state (Redux, Zustand, or similar). |
| `utils/` | Pure helper functions. |
| `styles/` | Global CSS, variables, theme helpers. |
| `types/` | Shared TypeScript types for the whole app. |
| `i18n/` | Locale files and i18n setup. |
| `App.tsx` | Root app component. |
| `index.tsx` | App entry point. |

Put page-only UI in `pages/<PageName>/components/`. Do not put that UI in
`components/` until more than one page needs it.

---

## 4. Barrel exports

A **barrel export** is an `index.ts` that re-exports public symbols from a
folder.

Use barrel exports for:

- Each atomic layer (`components/atoms/index.ts`, and the same for molecules,
  organisms, templates).
- `hooks/`, `constants/`, `types/`, `utils/`, and similar shared folders.

Import from the barrel when the path is stable:

```ts
import { Button, Input } from "@/components/atoms";
```

**Caution:** Avoid circular imports through barrels. Prefer a direct file path
when a barrel causes a cycle. Prefer direct imports when tree-shaking fails for
a large barrel.

---

## 5. Naming conventions

| Item | Rule |
| ---- | ---- |
| Component folder | PascalCase, same as the component name (`Button/`). |
| Component files | `index.tsx`, `index.module.css`, `index.types.ts`. |
| Hook file | `use` + PascalCase remainder (`useAuth.ts`). |
| Constant file | Domain + `.constants.ts` (`api.constants.ts`). |
| Type file (shared) | Domain + `.types.ts` (`api.types.ts`). |
| Service file | Domain + `Service.ts` (`userService.ts`). |
| Store file | Domain + `Store.ts` (`userStore.ts`). |

Use one name for one concept. Do not invent synonyms for the same folder role.

---

## 6. Quick checklist

**Atomic level**

- [ ] Is this a leaf control? Put it in `atoms/`.
- [ ] Is this a small group of atoms? Put it in `molecules/`.
- [ ] Is this a large feature block? Put it in `organisms/`.
- [ ] Is this a page layout shell? Put it in `templates/`.

**Shared vs page-local**

- [ ] Does only one page use this UI? Keep it under that page.
- [ ] Do two or more pages use this UI? Move it to `components/`.

**Folder-per-component**

- [ ] Does the folder have `index.tsx`?
- [ ] Does the folder have `index.module.css` when styles are needed?
- [ ] Does the folder have `index.types.ts` when props or local types exist?
- [ ] Does the layer barrel export the public component?

**Cross-cutting code**

- [ ] Shared logic in a hook? Put it in `hooks/`.
- [ ] Global React state via Context? Put it in `contexts/`.
- [ ] HTTP or vendor API? Put it in `services/`.
- [ ] Client store state? Put it in `stores/`.
- [ ] Pure helper with no React API? Put it in `utils/`.
- [ ] App-wide type used in many places? Put it in `types/`.

---

## 7. Cross-references

- Full trees and lookup tables: [reference.md](reference.md).
- Code snippets for components, pages, hooks, and services:
  [examples.md](examples.md).
