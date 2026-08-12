# GraphQL Security — Examples

**First-party:** reject any query hash not in the allowlist.

**Public:** allow ad-hoc queries but enforce depth ≤ 8, complexity ≤ 1000,
`first` ≤ 100, and authz on every sensitive field.
