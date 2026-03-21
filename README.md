# Agent Engineering Manifesto

This repository packages a small, reusable operating model for AI coding assistants.
The goal is to make agent work more legible, verifiable, and easier to steer in real repositories.

At the center is a 3-step pipeline:

- system design to make intent explicit;
- implementation tracking to turn intent into executable steps;
- TDD-first execution when logic changes.

Around that pipeline sit two supporting practices:

- investigation when the problem or root cause is still unclear;
- harness engineering when repeated mistakes should become harder to repeat.

That includes not only scripts and checks, but also documentation routing:

- `docs/index.md` as the entrypoint into the docs tree;
- explicit links between `README.md`, `AGENTS.md`, `AGENTS_template.md`, and the docs kit;
- a small, intentional docs topology instead of one overloaded instruction file.

## Operating Model

### 1. System Design

For non-trivial work, start by capturing the problem, goals, acceptance criteria, design, alternatives, and risks in a concise design doc.

Template:

- `docs/templates/system_design_template.md`

### 2. Implementation Tracking

Translate the design into a step-by-step execution document with exit criteria, verification, progress, and deviations.

Template:

- `docs/templates/implementation_template.md`

### 3. TDD Execution

When business logic changes, the execution loop stays simple:

1. Red
2. Green
3. Refactor
4. Verify against the step contract

## Investigation and Harness Engineering

Not every task should enter the pipeline immediately.

If the root cause is unclear, start with investigation and collect evidence first.
If the same class of mistake keeps repeating, add a harness so the next agent has a better default path.

That harness can be procedural or documentary.
In practice, good harnesses often look like:

- `docs/index.md` that routes the reader to the right source of truth;
- smaller focused docs instead of a single bloated `AGENTS.md`;
- explicit links between docs so the agent does not have to guess where to go next;
- a verification script when the risk is about drift rather than discovery.

Templates and typical harnesses included here cover:

- investigation docs for debugging and open-ended research;
- reusable rule docs for testing, frontend, and backend work;
- starter docs for architecture and data-topology maps;
- a small verification script for published docs in this repository.

## Documentation Kit

This repository is meant to be linked to and copied from as a starter kit for other projects.

Core files:

- `AGENTS.md`
  - the operative instruction set for this repository
- `AGENTS_template.md`
  - the public starting template to adapt into another repository
- `docs/index.md`
  - routing into the docs tree
- `docs/agentic_engineering_guide.md`
  - human-facing rationale for the operating model
- `docs/agent_rules/`
  - focused starter rules for high-signal domains
- `docs/templates/`
  - reusable templates for design, implementation, investigation, and repo docs
- `scripts/check-docs.sh`
  - a small verification harness for published docs in this repository

## Suggested Repository Docs For Adoption

The following docs work well in most non-trivial repositories:

- `docs/index.md`
- `docs/architecture.md`
- `docs/data-topology.md`
- `docs/agent_rules/testing.md`
- `docs/agent_rules/frontend.md`
- `docs/agent_rules/backend.md`

Do not create all of them just because the template exists. Create the smallest useful set, then add more when repeated confusion appears.

## Included Templates

These are bootstrap materials, not mandatory long-lived repo contents.
Instantiate what you need, then remove leftover template files that no longer help the target repository.

- `docs/templates/system_design_template.md`
- `docs/templates/implementation_template.md`
- `docs/templates/investigation_template.md`
- `docs/templates/docs_index_template.md`
- `docs/templates/architecture_template.md`
- `docs/templates/data_topology_template.md`

## Adoption Testing

The most useful test for this project is actual attempted use.

This repository now includes a small adoption-test harness:

- `tests/fixtures/`
  - fake repositories used as adoption targets
- `tests/evals/adoption_checklist.md`
  - a human-first rubric for evaluating the result
- `scripts/run-adoption-eval.sh`
  - prepares a workspace, prompt, and run artifacts for a chosen fixture

Initial fixtures:

- `minimal-service`
  - a tiny TypeScript HTTP service
- `telegram-agent-bridge`
  - a repository for building an integration between AI coding agents and Telegram

## Adoption Into a New Repository

1. Copy `AGENTS_template.md` into the target repository as `AGENTS.md`.
2. Rename it if your platform expects another filename, for example `CLAUDE.md` or `GEMINI.md`.
3. Copy `docs/index.md`, `docs/agentic_engineering_guide.md`, and the relevant docs from `docs/agent_rules/`.
4. Copy the templates from `docs/templates/`.
5. Replace placeholders, repo-specific commands, and project context.
6. Instantiate `docs/architecture.md` and `docs/data-topology.md` in the target repository only if those factual maps are actually useful there.
7. Delete leftover bootstrap artifacts that are no longer useful after setup, especially `AGENTS_template.md` and unused files under `docs/templates/`.
8. Keep the documentation set small; add files only when they reduce repeated ambiguity.

## This Repository's Implementation

`AGENTS.md` is intentionally project-specific and should not be copied blindly.
Use it as a reference implementation for how the manifesto is customized in a real repository.

`AGENTS_template.md` is the public example/template for adopters.
