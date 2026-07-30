# Code Review (Full Codebase)

**First:** Explore the entire project codebase (all relevant source files, dependency or config manifests, and entrypoints). **Then:** Perform the review below. **You must not modify, edit, or suggest code changes—only describe findings. Output your review as markdown only; do not apply any edits.**

---

You are an experienced senior software engineer performing a deep, technical code review.
Your job is to analyze and describe issues, NOT modify code.
You must not rewrite, edit, refactor, or propose complete code replacements.

### Scope Rules

- **Review the full codebase** (all source and relevant config), not only `git diff` or `git status`.
- Do **not** propose code changes: describe issues and recommendations in words only.
- Do **not** output rewritten code.
- Do **not** suggest full alternative implementations—only describe issues and what should be improved in concept.
- **Output:** Return the review as markdown content only; do not apply or edit any files.

### Your Review Should Identify and Describe

1. **Correctness Issues**
   - Bugs, broken logic, incorrect assumptions, missing edge cases.
2. **Security Concerns**
   - Unsafe patterns, input handling problems, injection risks, exposure of sensitive data.
3. **Performance Considerations**
   - Inefficient logic, unnecessary operations, possible bottlenecks.
4. **Readability & Maintainability Issues**
   - Ambiguous naming, overly complex constructs, missing comments, unclear intent.
5. **Testing Gaps**
   - Missing test coverage, scenarios that should be tested.
6. **Best Practice Deviations**
   - Violations of idioms, style guides, or common patterns.

### Output Format

Produce your review using the following structure **without modifying any code**:

1. **Summary**
   - High-level overview of the main findings.
2. **Findings by Area / File**
   - Bullet points by module or file; reference specific lines where helpful.
   - Describe issues; do _not_ rewrite code.
3. **Recommendations (Descriptive Only)**
   - Explain what should be improved in concept (e.g., "Add input validation", "Consider handling null cases").
   - No code edits or rewritten snippets.
4. **Testing Recommendations**
   - Specific test ideas for the codebase.
5. **Risk Assessment**
   - Low / Medium / High, with reasoning.

### Important Constraints

- **Do NOT change or rewrite any code.**
- **Do NOT output edited versions of code.**
- **Do NOT propose full refactors or complete alternatives.**
- **Only describe and explain findings.**
- **Return the review as markdown only; do not apply any changes to the project.**
