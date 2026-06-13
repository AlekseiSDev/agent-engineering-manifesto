# Configuration Layers

A harness is **layered**, not a single shared instruction file. Three layers compose, each owned by
a different role and changed for a different reason.

| Layer | Where it lives | Who changes it | Governs |
| --- | --- | --- | --- |
| **Team** | root `AGENTS.md` / `CLAUDE.md`, `docs/`, mechanical rules, shared `.claude/` (settings, skills, sub-agents, commands) | tech lead / architect | invariants and conventions for the whole repo |
| **Module** | `<subdir>/AGENTS.md`, module README, module-specific rules | module owner | rules local to one area, **added by fact, not preventively** |
| **Personal** | `~/.claude/CLAUDE.md` (global), `./CLAUDE.local.md` (project, gitignored) | the individual developer | personal ergonomics and shortcuts |

## Override policy

- **Module overrides are stricter, never looser.** A module may add constraints the team layer
  doesn't have; it may not relax a team invariant.
- **Personal layers never override architectural invariants.** A personal preference can't disable
  a team rule — and you shouldn't rely on trust for this: enforce invariants with a **mechanical
  rule** (lint / test / CI / the verify gate), so a personal override simply can't pass.
- **Good personal patterns graduate upward.** A personal convention that proves useful becomes a
  candidate for the team layer via a normal change/PR.

## Context loading (agent-agnostic)

- `AGENTS.md` is the source of truth (an open standard most agents read natively).
- `CLAUDE.md` is a thin shim that imports `@AGENTS.md` (Claude Code doesn't auto-load `AGENTS.md`).
- A nested `<subdir>/AGENTS.md` is the **module layer** for that directory.
- `./CLAUDE.local.md` (gitignored) is the personal project layer.

See the agent-agnostic shim model in `CLAUDE_template.md` and the team-layer permissions in
`.claude/settings.json`.

## Anti-pattern: "a single shared AGENTS.md and nothing else"

Putting every rule in one root file — no module layers, no mechanical enforcement, no personal
layer — collapses the three concerns into one. It forces unrelated modules to share one set of
rules, makes invariants un-enforceable (they're prose, not checks), and leaves no place for
personal ergonomics that don't belong in the team layer. Split by layer; enforce invariants
mechanically; keep module rules local.
