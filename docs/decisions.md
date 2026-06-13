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
