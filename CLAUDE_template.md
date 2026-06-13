# Claude Code Instructions (CLAUDE.md)

> **Shim model.** `AGENTS.md` is the source of truth — an open standard most coding agents read
> natively. This file is a thin Claude Code layer: it imports `AGENTS.md` and adds only what is
> specific to Claude Code. Keep durable rules (project context, routing, principles, the verify
> gate, harness rules) in `AGENTS.md`, so one fact has one home. See `docs/config_layers.md`.

@AGENTS.md

## Planning Phase (Claude Code `/plan`)

When asked to implement a phase or feature:

1. Read the relevant section of `docs/<feature>_system_design.md`.
2. Read `docs/ui-ux.md` for affected user flows.
3. Read `docs/decisions.md` and `docs/anti-patterns.md` — don't contradict a prior decision or
   repeat a known mistake.
4. Explore current code in the affected directories.
5. Run the verify gate to confirm a green baseline: `[verify command]`.
6. Propose a plan with test cases per step; wait for human approval before writing code.

If the root cause is unclear, start with investigation (evidence → hypotheses → verify) first.

## During Implementation (Claude Code)

- TDD when changing business logic: Red → Green → Refactor.
- Run the verify gate after each meaningful change.
- Verify each step against the plan before moving to the next.
- Append decisions to `docs/decisions.md` as you make them; distill durable WHY/HOW on completion
  (see `docs/templates/implementation_template.md`).

## Nested modules

A subdirectory can carry its own `<subdir>/CLAUDE.md` that imports the module's `@AGENTS.md`
(the module layer). See `docs/config_layers.md`.
