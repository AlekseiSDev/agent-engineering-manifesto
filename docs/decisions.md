# Decision Log

> Architectural and design decisions made while developing this repository.
> Append new entries at the bottom. Do not edit or remove past decisions — if a decision is
> reversed, add a new entry that supersedes it.
>
> **What lives here:** durable WHY, one line per accepted decision. This is the genre an agent
> loads *before every planning step*, so default to a single line ("we chose X because Y").
> In-flight, not-yet-accepted status lives in the relevant implementation doc's `Status`, not
> here. A heavy decision (real alternatives analysis, large blast radius, or one that keeps
> getting relitigated) may graduate to a full ADR at `docs/adr/NNNN-*.md` — link it from its
> one-liner here. See `docs/index.md` → Documentation Genres.

## Format

```
- **[YYYY-MM-DD] Title**: Decision. Reason. [Supersedes: YYYY-MM-DD Title, if applicable]
```

## Decisions

- **[2026-06-13] Port harness form, not product content**: We uplift this kit toward a mature
  reference harness by copying its *structure* (genres, anti-pattern log, verify gate, agent
  infrastructure) and stripping all stack specifics to placeholders. Reason: the kit's value is
  portability and small size; importing product concretes would bloat it into a clone.
- **[2026-06-13] Map genres onto the existing flat vocabulary**: WHY→`docs/decisions.md`,
  WHAT→UI/UX spec + per-feature `system_design`/`implementation` docs, HOW→`docs/agent_rules/`.
  We did NOT introduce `decision-logs/` + `conventions-*/` folders. Reason: smallest useful set;
  the flat vocabulary already covers the three genres, and per-decision status is carried by the
  implementation doc's `Status` lifecycle.
- **[2026-06-13] `docs/anti-patterns.md` is the only genuinely new genre**: A recurring mistake
  graduates to an `AP-NN` entry. Reason: harness-the-mistake previously lived only in prose;
  it needs a durable, append-only record with a clear "second time" trigger.
- **[2026-06-13] Real `.claude/` at repo root, no symlinks**: Agent infrastructure ships as real
  `.claude/settings.json`, `.claude/agents/`, `.claude/commands/`, and real
  `.claude/skills/<name>/SKILL.md` files. Reason: directly adoptable and functional for this
  repo's own agent; symlinks are fragile on Windows, so the reference repo's
  `.claude/skills → .agents/skills` symlink is resolved to its originals.
- **[2026-06-13] Enforcement hook loop ships opt-in, not auto-blocking**: `.claude/settings.json`
  carries real permissions, but the PostToolUse/Stop verify-loop is delivered as a documented,
  opt-in scaffold. Reason: a docs repo should not silently change its own agent's stop behavior;
  the deterministic hook loop is still frontier even in mature harnesses.
- **[2026-06-13] Documentation genres mapped to the flat vocabulary; `docs/anti-patterns.md` is the
  one new genre**: routing lives in `docs/index.md` as a "what you're doing → what to read" table.
  Reason: the existing `decisions.md` / `agent_rules/` / per-feature design split already covers
  WHY/HOW/WHAT; only "recurring mistakes" lacked a home.
- **[2026-06-13] Translate all repo prose to English**: P1 discovered Russian prose in five tracked
  files (two design/impl records + three templates). Translated them as part of the uplift.
  Reason: the English-only guardrail and "sanitized public" principle apply to every shipped
  artifact, and Russian prose in a public starter-kit is a real wart.
- **[2026-06-13] Verify gate is a single named, stack-agnostic slot**: templates use `[verify
  command]` (`[typecheck] && [lint] && [unit tests]`); this repo's gate is `./scripts/check-docs.sh`.
  Reason: name the gate once instead of hardcoding a package manager across docs.
- **[2026-06-13] `.claude/settings.json` is real and functional for this repo**: it pre-approves the
  read-mostly commands an agent runs here and denies destructive ones, rather than shipping dead
  placeholder config. Reason: the operator chose a real `.claude/`; making it functional avoids
  shipping config that governs this repo but does nothing.
- **[2026-06-13] Config layers documented as a standalone `docs/config_layers.md`**: team/module/
  personal layers + override policy + the "single shared AGENTS.md" anti-pattern. Reason: it is
  cross-cutting harness guidance, discoverable via the routing table, not a section buried in a template.
- **[2026-06-13] `CLAUDE_template.md` is a thin shim that imports `@AGENTS.md`**: removed the generic
  content it duplicated (project context, routing, decision-log format, code style, harness rules);
  kept only Claude-specific planning/implementation workflow. Reason: AGENTS.md is the source of
  truth; duplicating it in CLAUDE.md violates one-fact-one-home. Adopters now create both AGENTS.md
  and a thin CLAUDE.md, not CLAUDE.md "instead of" AGENTS.md.
- **[2026-06-13] Sub-agents are read-only by default; only `spec-writer` may write, scoped to `docs/`**:
  `explore` and `code-reviewer` are read-only context firewalls; `spec-writer` has Write/Edit limited
  to `docs/`. Reason: a sub-agent should reduce blast radius, not expand it.
- **[2026-06-13] Adoption-status tracker reconceived for manifesto practices**: the tier table groups
  Foundations / single-agent discipline / mechanical enforcement / agent infrastructure / advanced,
  with a `✓ / partial / doc-only / deferred / ✗` legend — not the reference harness's tiers verbatim.
  Reason: the kit's own practices differ; an honest self-describing map matters more than copying tiers.
  The three deferred items (outcome-eval, generator-evaluator, long-horizon) each have a real
  plug-point in the repo, not just an intention.
