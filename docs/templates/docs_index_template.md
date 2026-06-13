# Docs Index

## Purpose

This file is the **routing layer**: the shortest path from "what you're doing" to the smallest
authoritative document. Load the one row you need — do not read the whole tree.

## Documentation Genres (single-writer-per-fact)

One fact lives in exactly one genre. Don't duplicate a fact across genres, and don't restate in
prose what types, tests, or contracts already express.

| Genre | Answers | Where it lives |
| --- | --- | --- |
| WHY — decisions | why the system is the way it is | `docs/decisions.md` (heavy decisions may graduate to `docs/adr/NNNN-*.md`) |
| WHAT — product / feature | what we build, from the user's perspective | `docs/ui-ux.md`, then `docs/<feature>_system_design.md` |
| HOW — conventions | how code must always do X | `docs/agent_rules/*.md` |
| Mistakes — anti-patterns | what keeps going wrong, and the durable fix | `docs/anti-patterns.md` |

## What you're doing → what to read

| What you're doing | Read |
| --- | --- |
| Onboarding to the repo | `README.md`, then `AGENTS.md` |
| Finding the canonical doc for a change | this file |
| Understanding system topology | `docs/architecture.md` |
| Working with storage / data | `docs/data-topology.md` |
| Proposing an alternative to an existing pattern | `docs/decisions.md` (read before you propose) |
| Designing a non-trivial change | `docs/<feature>_system_design.md` |
| Tracking execution | `docs/<feature>_implementation.md` |
| Debugging / unclear root cause | `docs/<topic>_investigation.md` |
| Writing or changing code conventions | `docs/agent_rules/*.md` |
| Recording a recurring mistake | `docs/anti-patterns.md` |
| `[your repo's common task]` | `[the smallest doc that answers it]` |

## Where NOT to look

- Don't mine archived `docs/<feature>_system_design.md` for current conventions — durable rules
  are distilled into `docs/agent_rules/` and `docs/decisions.md` on completion.
- Don't treat any `*_template.md` as authoritative; templates are bootstrap material.
- `[name any doc that is commonly mis-used as a source of truth, and where to look instead]`

## When to update this file

- Add a new doc genre, rule, template, skill, sub-agent, or command → add **one row** to the
  relevant table above. Nothing else.
- Keep this file a router, not a knowledge base: link to the smallest authoritative doc; don't
  inline its content here.

## Rule of Use

- Do not load all docs by default. Start with the most relevant doc and expand only when blocked.
- Prefer small factual docs over one giant knowledge base.
- Add a new doc only when repeated mistakes show an invariant is currently too implicit.
- If the repo ships an `AGENTS_template.md`, mark it clearly as a template and keep `AGENTS.md`
  authoritative.
