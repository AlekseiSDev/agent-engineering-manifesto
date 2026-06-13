---
name: parallel-review
description: Run the read-only review sub-agents in parallel on the current diff and merge their findings into one consolidated report.
---

# /parallel-review

Launch independent review sub-agents over the same change, then consolidate. Each runs with a clean
context — an agent should not be the sole judge of its own work.

## What it runs (in parallel)

1. **code-reviewer** — correctness, rule conformance, scope discipline, verification.
2. **explore** — maps the blast radius the change touches (what else depends on it).
3. *(add your own, e.g. a docs-review or dependency-auditor pass.)*

## How to use

```
/parallel-review                 # review the working diff vs the base branch
/parallel-review --against <ref> # diff against <ref>
```

## Behavior

1. Determine scope (the working diff, or explicit files).
2. Launch the sub-agents concurrently, each with the scoped diff.
3. Wait for all, then merge into one report (deduplicated, severity-sorted).

## When it helps / when it doesn't

- Helps: a diff that spans more than one area or changes a public contract.
- Skip: a trivial one-file change — the overhead isn't worth it.

## Reference

- Sub-agents: `.claude/agents/code-reviewer.md`, `.claude/agents/explore.md`
- Deferred: a strong generator–evaluator pass plugs into the review layer (see `code-reviewer`).
