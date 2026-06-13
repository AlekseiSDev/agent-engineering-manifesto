---
name: docs-review
description: Use this skill when a change touches docs/, AGENTS.md, CLAUDE.md, or a module README, or when a diff changes a public contract or spans more than one area. It audits documentation for drift (doc vs reality) and for sprawl/bloat, and reports findings without modifying anything.
---

# docs-review

A read-only audit of documentation health on a change. Reports; does not edit.

## When to use

- A diff touches `docs/`, `AGENTS.md`, `CLAUDE.md`, or a module README.
- A diff changes a public contract or spans more than one area (its docs likely drifted).

## Steps

1. **List the docs in blast radius** — what the change touches or makes stale.
2. **Drift check (doc vs reality):** does any doc now describe something the change altered?
   Terminology still canonical? Routing still correct? A decision now superseded?
3. **Sprawl/bloat check:** is the same fact written in two genres? A doc that should be a one-liner
   in `docs/decisions.md`? A template left behind after setup?
4. **Report** each finding with a recommended disposition.

## Findings format

```
- [drift|bloat] <file>: <what's wrong>
  -> fix in this PR | separate PR | ignore (reason)
```

## What this skill does NOT do

- It does not modify any file — it only reports.
- It does not block pre-existing violations unrelated to the change.
- It does not judge subjective style.

## Reference

- Genres + routing (the single-writer-per-fact rule it audits against): `docs/index.md`
- The mechanical floor it complements: `.claude/skills/check-docs/SKILL.md`
