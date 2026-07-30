# Google Go Style — Official References

This document links to the canonical [Go Style](https://google.github.io/styleguide/go/index) materials at Google and defines terms used across the rule set.

## Source

**Go Style (Overview)**  
https://google.github.io/styleguide/go/index

## Document structure

| Document           | Link | Primary audience   | Normative | Canonical |
| ------------------ | ---- | ------------------ | --------- | --------- |
| **Style Guide**    | [guide](https://google.github.io/styleguide/go/guide) | Everyone | Yes | Yes |
| **Style Decisions**| [decisions](https://google.github.io/styleguide/go/decisions) | Readability mentors | Yes | No |
| **Best Practices** | [best-practices](https://google.github.io/styleguide/go/best-practices) | Anyone interested | No | No |

- **Style Guide**: Foundation of Go style; definitive and used as the basis for the other two.
- **Style Decisions**: More verbose; summarizes decisions on specific style points and reasoning. May change with new language features or patterns.
- **Best Practices**: Patterns that solve common problems and read well. Not canonical; encouraged where they keep the codebase uniform.

## Definitions (from the overview)

- **Canonical**: Prescriptive and enduring. All code (old and new) should follow; not expected to change substantially. Principles must meet a high bar; canonical docs are generally shorter.
- **Normative**: Agreed-upon style for reviewers so suggestions and terminology are consistent. May change over time; authors are not required to know every normative detail; reviewers use it in readability reviews.
- **Idiomatic**: Common and familiar in Go. Prefer idiomatic patterns over unidiomatic ones when both serve the same purpose.

## Additional references

The guide assumes familiarity with [Effective Go](https://go.dev/doc/effective_go), which provides a common baseline for the Go community.

### External

- [Go Language Specification](https://go.dev/ref/spec)
- [Go FAQ](https://go.dev/doc/faq)
- [Go Memory Model](https://go.dev/ref/mem)
- [Go Data Structures](https://research.swtch.com/godata)
- [Go Interfaces](https://research.swtch.com/interfaces)
- [Go Proverbs](https://go-proverbs.github.io/)

### Testing

- Unit Testing Practices (see style guide / best practices)
- TotT: Identifier Naming
- TotT: Testing State vs. Testing Interactions
- TotT: Effective Testing
- TotT: Risk-driven Testing
- TotT: Change-detector Tests Considered Harmful

### Other writings

- [Go and Dogma](https://go.dev/blog/go-and-dogma)
- [Less is exponentially more](https://commandcenter.blogspot.com/2012/06/less-is-exponentially-more.html)
- [Gofmt's style is no one's favorite, yet Gofmt is everyone's favorite](https://www.youtube.com/watch?v=PAAkCSZYW1c)
