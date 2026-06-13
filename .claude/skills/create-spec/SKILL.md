---
name: create-spec
description: Use this skill when starting or updating a spec for a non-trivial change — a new feature, a refactor, a high-blast-radius change, or an ambiguous solution space — or when returning to one. It walks the UI/UX → system design → implementation flow, points to the templates, and covers the distillation step on completion.
---

# create-spec

Turn a task into the right tracked documents before writing code, so plan and execution are
legible and reviewable.

## When to use

- A change is non-trivial: new behavior, a refactor, high blast radius, or an unclear solution space.
- You are resuming work and need to find or update the existing spec.

Do **not** use it for a one-line fix or a change with an obvious, local scope — that is overhead.

## Steps

1. **Capture WHAT (product).** If user-facing, start from `docs/ui-ux.md` (template:
   `docs/templates/ui_ux_template.md`). The system design is derived from it.
2. **Design.** Write `docs/<feature>_system_design.md` from
   `docs/templates/system_design_template.md`: context, goals, success criteria, key decisions,
   alternatives, risks.
3. **Plan execution.** Write `docs/<feature>_implementation.md` from
   `docs/templates/implementation_template.md`: steps with exit criteria, TDD hooks, verification.
4. **Read before proposing.** Check `docs/decisions.md` (don't re-propose a rejected option) and
   `docs/anti-patterns.md` (don't repeat a known mistake).
5. **Distill on completion.** When the implementation reaches `Status: Completed`, move durable WHY
   to `docs/decisions.md` and durable HOW to `docs/agent_rules/` (see the implementation template).

## Checklist

- [ ] One fact, one genre — no rationale duplicated across docs.
- [ ] Acceptance criteria are observable and checkable.
- [ ] The plan names a verify step per phase.
- [ ] Out-of-scope is explicit.

## What this skill does NOT do

- It does not write production code.
- It does not create every template "because it exists" — create the smallest useful set.

## Reference

- Genres + routing: `docs/index.md`
- Templates: `docs/templates/`
- Sub-agent that fills specs under a write scope: `.claude/agents/spec-writer.md`
