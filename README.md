# Agent Engineering Manifesto

This repository packages a small, reusable operating model for AI coding assistants.
The goal is to make agent work more legible, verifiable, and easier to steer in real repositories.

At the center is a 4-step pipeline:

* UI/UX specification to capture what we build from the user's perspective;
* system design to make technical intent explicit;
* implementation tracking to turn intent into executable steps;
* TDD-first execution when logic changes.

Around that pipeline sit two supporting practices:

* investigation when the problem or root cause is still unclear;
* harness engineering when repeated mistakes should become harder to repeat.

The documentation topology is intentionally small:

* `docs/index.md` as the routing layer into the docs tree ("what you're doing → what to read");
* documentation genres with one writer per fact — WHY in `docs/decisions.md`, WHAT in the UI/UX spec and system designs, HOW in `docs/agent_rules/`, recurring mistakes in `docs/anti-patterns.md`;
* explicit links between `README.md`, `AGENTS.md`, `CLAUDE_template.md`, `AGENTS_template.md`, and the docs kit;
* a small set of focused docs instead of one overloaded instruction file.

## Operating Model

### 0. UI/UX Specification

Before designing the system, capture what you are building from the user's perspective.
This document describes the product: what it does, who it's for, user flows, scenarios, and acceptance criteria.

It is typically created by a human in a conversational AI interface (Claude web, ChatGPT, etc.)
and placed into the repository as `docs/ui-ux.md`.
The system design and implementation plans are derived from this file.

See [Creating a UI/UX Specification](#creating-a-uiux-specification) below for a ready-to-use prompt.

Template:

* `docs/templates/ui_ux_template.md`

### 1. System Design

For non-trivial work, start by capturing the problem, goals, acceptance criteria, design, alternatives, and risks in a concise design doc.
The system design is derived from the UI/UX spec — it answers "how" after UI/UX answers "what".

Template:

* `docs/templates/system_design_template.md`

### 2. Implementation Tracking

Translate the design into a step-by-step execution document with exit criteria, verification, progress, and deviations.

Before writing an implementation plan, the agent performs a lightweight research step:
reads the relevant system design section, affected UI/UX flows, existing decisions, and explores current code.

Template:

* `docs/templates/implementation_template.md`

### 3. TDD Execution

When business logic changes, the execution loop stays simple:

1. Red
2. Green
3. Refactor
4. Verify against the step contract

## Investigation and Harness Engineering

Not every task should enter the pipeline immediately.

**Investigation** is the entry path when the problem or solution space is unclear.
Before proposing a plan, the agent gathers evidence: reads code, checks logs, forms hypotheses, verifies them.
This prevents premature solutions to misunderstood problems.

**Harness engineering** is a cross-cutting practice.
When the same class of mistake keeps repeating, add a guardrail so the next session has a better default path.
A harness can be:

* a lint rule or test that catches the pattern automatically (preferred for an architectural invariant);
* a documentation fix — clearer routing, better naming, explicit constraints;
* a `docs/decisions.md` entry that records the convention so it isn't relitigated;
* an `AP-NN` entry in `docs/anti-patterns.md` when the same mistake recurs (added the second time, not the first);
* a verification script when the risk is drift rather than discovery.

The guiding principle: patch the system, not just the symptom.
If an agent repeatedly confuses two concepts, renaming or restructuring the docs
is a better fix than adding a warning comment.

## Documentation Kit

This repository is meant to be linked to and copied from as a starter kit for other projects.

Core files:

* `AGENTS.md`
  + the operative instruction set for this repository
* `AGENTS_template.md`
  + the public starting template to adapt into another repository (the source of truth, general-purpose)
* `CLAUDE_template.md`
  + a thin Claude Code shim that imports `@AGENTS.md` and adds only Claude-specific workflow
* `docs/index.md`
  + the routing layer into the docs tree
* `docs/agent_rules/`
  + focused starter rules for high-signal domains
* `docs/templates/`
  + reusable templates for design, implementation, investigation, UI/UX, decisions, and repo docs
* `.claude/`
  + Claude Code harness: permissions (`settings.json`), sub-agents, skills, and commands (see `.claude/README.md`)
* `scripts/check-docs.sh`
  + the verify gate for published docs in this repository

## Suggested Repository Docs For Adoption

The following docs work well in most non-trivial repositories:

* `docs/ui-ux.md`
* `docs/decisions.md`
* `docs/anti-patterns.md`
* `docs/index.md`
* `docs/architecture.md`
* `docs/data-topology.md`
* `docs/agent_rules/testing.md`
* `docs/agent_rules/frontend.md`
* `docs/agent_rules/backend.md`

Do not create all of them just because the template exists. Create the smallest useful set, then add more when repeated confusion appears.

## Included Templates

These are bootstrap materials, not mandatory long-lived repo contents.
Instantiate what you need, then remove leftover template files that no longer help the target repository.

* `docs/templates/ui_ux_template.md`
* `docs/templates/decisions_template.md`
* `docs/templates/system_design_template.md`
* `docs/templates/implementation_template.md`
* `docs/templates/investigation_template.md`
* `docs/templates/docs_index_template.md`
* `docs/templates/architecture_template.md`
* `docs/templates/data_topology_template.md`
* `docs/templates/adoption_status_template.md`

## Creating a UI/UX Specification

The UI/UX spec (`docs/ui-ux.md`) is the starting point for any project. It is best created in a conversational AI interface (Claude web, ChatGPT) where you can iterate with the AI on product vision before committing to code.

### What to prepare

You can bring any combination of:
* your general idea of the project and thoughts on its development;
* notes, sketches, photos of whiteboard / paper brainstorms;
* existing documents, PRDs, competitor analysis;
* the UI/UX template from this repository (`docs/templates/ui_ux_template.md`);
* optionally, a good example UI/UX file from another project for reference.

### Ready-to-use prompt

Copy and paste this prompt into Claude or ChatGPT. Attach your materials as files or images.

```
I need to create a UI/UX & Product Specification for my project.

## Your role
You are a senior product designer and UX writer. Your job is to help me
produce a complete, structured UI/UX spec document that I will use as the
primary source of truth for system design and implementation.

## Inputs I'm providing
- [The template to follow is attached / pasted below]
- [My project description / notes / sketches / documents are attached]
- [Optionally: an example of a good UI/UX spec from another project is attached]

## How to work
1. Read ALL my inputs carefully before responding.
2. If you have enough information to fill every section of the template
   meaningfully — produce the complete UI/UX spec immediately.
3. More likely, you will have gaps. In that case:
   - First, show me what you CAN fill in based on my inputs.
   - Then, ask me focused questions grouped by section
     (don't ask about things I've already answered).
   - After I answer, produce the updated spec.
4. Iterate until I confirm the spec is complete.

## Output format
- Follow the structure of the attached template exactly.
- Use clear, concrete language. Avoid vague requirements.
- Every user flow should have explicit steps and success criteria.
- Flag open questions in the "Open Questions" section instead of guessing.
- Include a Changelog table at the bottom.

## Quality criteria for a good spec
- A developer who reads only this document should understand WHAT we're
  building and for WHOM, without needing to ask the product owner.
- Every scenario has a trigger, steps, and edge cases.
- Non-functional requirements are specific (numbers, not "fast" or "secure").
- Out of scope is explicit — what we are NOT building.

Please start.
```

### Tips

* Attach `docs/templates/ui_ux_template.md` as a file — the AI will follow its structure.
* If you have a working example from another project (e.g. `ai-psychologist-ux.md`), attach it too — the AI will match the quality level.
* Photos of paper sketches work well — Claude and ChatGPT can read handwriting.
* After 2-3 iterations the spec is usually ready. Copy the final version into `docs/ui-ux.md` in your repository.

## Adoption Testing

The most useful test for this project is actual attempted use.

This repository now includes a small adoption-test harness:

* `tests/fixtures/`
  + fake repositories used as adoption targets
* `tests/evals/adoption_checklist.md`
  + a human-first rubric for evaluating the result
* `scripts/run-adoption-eval.sh`
  + prepares a workspace, prompt, and run artifacts for a chosen fixture

Initial fixtures:

* `minimal-service`
  + a tiny TypeScript HTTP service
* `telegram-agent-bridge`
  + a repository for building an integration between AI coding agents and Telegram

## Adoption Into a New Repository

1. Copy `AGENTS_template.md` into the target repository as `AGENTS.md` — the source of truth.
2. For Claude Code, also copy `CLAUDE_template.md` as `CLAUDE.md` — a thin shim that imports
   `@AGENTS.md` and adds only Claude-specific workflow. Other agents read `AGENTS.md` natively
   (or rename it to the expected filename, e.g. `GEMINI.md`).
3. Copy `docs/index.md` and the relevant docs from `docs/agent_rules/`.
4. Copy the templates from `docs/templates/`.
5. Optionally copy `.claude/` (permissions, sub-agents, skills, commands) and adapt its placeholders.
6. Replace placeholders, repo-specific commands, and project context — including a single
   `[verify command]` (the verify gate).
7. Instantiate `docs/architecture.md` and `docs/data-topology.md` in the target repository only if those factual maps are actually useful there.
8. Delete leftover bootstrap artifacts that are no longer useful after setup, especially `AGENTS_template.md` and unused files under `docs/templates/`.
9. Keep the documentation set small; add files only when they reduce repeated ambiguity.

## This Repository's Implementation

`AGENTS.md` is intentionally project-specific and should not be copied blindly.
Use it as a reference implementation for how the manifesto is customized in a real repository.

`AGENTS_template.md` is the public example/template for adopters (general-purpose, the source of truth).
`CLAUDE_template.md` is a thin Claude Code shim that imports `@AGENTS.md` and adds only Claude-specific workflow.