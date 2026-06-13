# Docs Index

## Purpose

This file is the **routing layer**: the shortest path from "what you're doing" to the smallest
authoritative document. Load the one row you need — do not read the whole tree.

Use it when:

- you need the canonical file for a repo change;
- you are deciding which genre a fact belongs to;
- you are adapting this kit into another repository.

## Documentation Genres (single-writer-per-fact)

One fact lives in **exactly one** genre. Don't duplicate a fact across genres, and don't restate
in prose what types, tests, or contracts already express.

| Genre | Answers | Where it lives |
| --- | --- | --- |
| WHY — decisions | why the system is the way it is | `docs/decisions.md` (one-liner log; heavy decisions may graduate to optional `docs/adr/NNNN-*.md`) |
| WHAT — product / feature | what we build, from the user's perspective | `docs/ui-ux.md`, then per-feature `docs/<feature>_system_design.md` |
| HOW — conventions | how code must always do X | `docs/agent_rules/*.md` |
| Mistakes — anti-patterns | what keeps going wrong, and the durable fix | `docs/anti-patterns.md` |

- A decision's *in-flight* status (proposed, not yet accepted) lives in its
  `docs/<feature>_implementation.md` `Status` — not in `decisions.md`.
- When an implementation doc reaches `Status: Completed`, **distill** its durable WHY into
  `docs/decisions.md` and any durable HOW into `docs/agent_rules/`. The archived design doc is
  then history, not a source of truth. (See `docs/templates/implementation_template.md`.)

## What you're doing → what to read

| What you're doing | Read |
| --- | --- |
| Evaluating the kit / sharing the repo | `README.md` |
| Editing this repository as an agent | `AGENTS.md`, then the smallest relevant doc below |
| Finding the canonical doc for a change | this file |
| Proposing an alternative to an existing pattern | `docs/decisions.md` (read before you propose) |
| Capturing what to build (product) | `docs/ui-ux.md` (+ `docs/templates/ui_ux_template.md`) |
| Designing a non-trivial change | `docs/templates/system_design_template.md` |
| Tracking execution of a plan | `docs/templates/implementation_template.md` |
| Debugging / unclear root cause | `docs/templates/investigation_template.md` |
| Writing or changing code conventions | `docs/agent_rules/*.md` |
| Recording a recurring mistake | `docs/anti-patterns.md` |
| Adapting this kit into another repo | `AGENTS_template.md` (or `CLAUDE_template.md` for Claude Code) |

## Where NOT to look

- Don't mine archived `docs/<feature>_system_design.md` for current conventions — durable rules
  are distilled into `docs/agent_rules/` and `docs/decisions.md` on completion.
- Don't read `AGENTS_template.md`, `CLAUDE_template.md`, or `docs/templates/*` as authoritative
  for this repo; they are bootstrap artifacts for *target* repositories.
- Don't treat `README.md` as the operating manual; it is public framing. The operative rules
  live in `AGENTS.md`.

## Canonical Roles

- `README.md` — public framing and adoption guidance
- `AGENTS.md` — operative instructions for this repository
- `AGENTS_template.md` — sanitized example/template for adopters (general-purpose)
- `CLAUDE_template.md` — Claude Code-specific template with planning workflow
- `docs/agent_rules/*.md` — reusable starter rules (HOW conventions) for target repositories
- `docs/templates/*.md` — reusable starter templates for target repositories

## Workflow Documents for Target Repositories

Create these per task when needed (one fact, one genre — see above):

- `docs/ui-ux.md` — primary source of truth for what we build; system design is derived from it
- `docs/decisions.md` — WHY log; append on decision, read before planning
- `docs/anti-patterns.md` — recurring mistakes (`AP-NN`); add an entry the second time, not the first
- `docs/<feature>_system_design.md` — for features, refactors, high-blast-radius or ambiguous work
- `docs/<feature>_implementation.md` — execution tracking, step contracts, verification, deviations
- `docs/<topic>_investigation.md` — debugging, root-cause analysis, open-ended research

## Templates

- `docs/templates/ui_ux_template.md` — product/UX specification
- `docs/templates/decisions_template.md` — bootstrap a decision log
- `docs/templates/system_design_template.md` — architecture and acceptance criteria
- `docs/templates/implementation_template.md` — step tracking, verification, distillation on completion
- `docs/templates/investigation_template.md` — evidence-driven debugging
- `docs/templates/docs_index_template.md` — routing layer for a new repository
- `docs/templates/architecture_template.md` — architecture map
- `docs/templates/data_topology_template.md` — storage ownership map

## When to update this file

- Add a new documentation genre, rule doc, template, skill, sub-agent, or command → add **one
  row** to the relevant table. Nothing else.
- Keep this file a router, not a knowledge base: link to the smallest authoritative doc; don't
  inline its content here.

## Rules of Use

- Do not load everything by default. Start with the most relevant doc and expand only when blocked.
- Prefer small factual docs over placeholder root docs.
- Do not let templates redefine canonical repo terminology.
- Mark examples as non-authoritative and keep them sanitized.
- Treat `AGENTS_template.md`, `CLAUDE_template.md`, and `docs/templates/*` as bootstrap assets,
  not as files that must remain after setup.
- Create a harness when agents repeat a mistake: a rule, a script, a template fix, an
  `anti-patterns.md` entry, or a better source-of-truth doc.
