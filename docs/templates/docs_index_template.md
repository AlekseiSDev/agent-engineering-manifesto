# Docs Index

## Purpose

This file is the entrypoint into the repository documentation.

Use it when:

- you are new to the repo;
- you need to find the right doc quickly;
- you want the shortest path from task type to the right source of truth.

## Recommended Reading Order

1. `README.md`, if it contains useful public framing
2. `AGENTS.md`
3. `docs/architecture.md`
4. `docs/data-topology.md`
5. relevant `docs/agent_rules/*.md`
6. relevant feature docs in `docs/`
7. relevant templates in `docs/templates/`

## Core Docs

- `docs/architecture.md`
  - repo topology, runtime boundaries, dependency directions, architecture risks
- `docs/data-topology.md`
  - runtime-to-storage map, source-of-truth ownership, connection entrypoints, local inspection paths

## Agent Rules

- `docs/agent_rules/testing.md`
  - test surfaces, risk-based validation, runtime expectations
- `docs/agent_rules/frontend.md`
  - frontend placement, reuse rules, browser validation
- `docs/agent_rules/backend.md`
  - backend boundary rules, contract and integration validation

## Templates

- `docs/templates/system_design_template.md`
- `docs/templates/implementation_template.md`
- `docs/templates/investigation_template.md`
- `docs/templates/docs_index_template.md`
- `docs/templates/architecture_template.md`
- `docs/templates/data_topology_template.md`

## Rule of Use

- Do not load all docs by default.
- Start with the most relevant doc.
- Prefer small factual docs over one giant knowledge base.
- Add a new doc when repeated mistakes show that an invariant is currently too implicit.
- If the repo also ships an `AGENTS_template.md`, mark it clearly as a template and keep `AGENTS.md` authoritative.
- Treat template files as bootstrap material by default: instantiate useful docs, then remove leftover template-only files unless the repo intentionally keeps local scaffolding.
