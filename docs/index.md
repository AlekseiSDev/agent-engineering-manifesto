# Docs Index

## Purpose

This file routes readers to the smallest authoritative document for the current question.

Use it when:

- you need to know which file is canonical for a repo change;
- you are deciding whether something belongs in a factual doc, a rule doc, or a template;
- you are adapting this kit into another repository.

## Reading Paths

- Evaluating the manifesto or sharing the repository:
  start with `README.md`.
- Editing this repository as an agent:
  read `AGENTS.md`, then the smallest relevant doc below.
- Understanding the rationale behind the model:
  use `docs/agentic_engineering_guide.md`.
- Updating reusable starter artifacts:
  use `docs/templates/` and `docs/agent_rules/`.
- Looking for a filled example/template:
  use `AGENTS_template.md`.

Do not load everything by default. Pick the smallest relevant document and expand only when blocked.

## Canonical Roles

- `README.md`
  - public framing and adoption guidance
- `AGENTS.md`
  - operative instructions for this repository
- `AGENTS_template.md`
  - sanitized example/template for adopters
- `docs/agentic_engineering_guide.md`
  - human-facing rationale for the operating model
- `docs/agent_rules/*.md`
  - reusable starter rules for target repositories
- `docs/templates/*.md`
  - reusable starter templates for target repositories

## Workflow Documents for Target Repositories

Create these per task when needed:

- `docs/<feature>_system_design.md`
  - for new features, refactors, high-blast-radius changes, or ambiguous solution spaces
- `docs/<feature>_implementation.md`
  - for execution tracking, step contracts, verification, and deviations from the design
- `docs/<topic>_investigation.md`
  - for debugging, root-cause analysis, evidence gathering, or open-ended research

## Templates

- `docs/templates/system_design_template.md`
  - use before implementation for architecture and acceptance criteria
- `docs/templates/implementation_template.md`
  - use when a change needs explicit step tracking and verification
- `docs/templates/investigation_template.md`
  - use for evidence-driven debugging and root-cause analysis
- `docs/templates/docs_index_template.md`
  - use when setting up documentation routing in a new repository
- `docs/templates/architecture_template.md`
  - use when a repository lacks an up-to-date architecture map
- `docs/templates/data_topology_template.md`
  - use when storage ownership is unclear or fragile

## Rules of Use

- Keep `AGENTS.md` focused on workflow and routing, not project minutiae.
- Prefer small factual docs over placeholder root docs.
- Do not let templates redefine canonical repo terminology.
- Mark examples as non-authoritative and keep them sanitized.
- Treat `AGENTS_template.md` and `docs/templates/*` as bootstrap assets for target repositories, not as files that must remain after setup.
- Create harnesses when agents repeat mistakes: a rule, a script, a template fix, or a better source-of-truth doc.
