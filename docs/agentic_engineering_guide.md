# Agentic Engineering Guide

This document is for humans operating coding agents.

`AGENTS.md` tells the agent what to do in this repository.
This guide explains why the workflow is structured that way and how to apply it without creating documentation bloat.

## 1. Default Delivery Path: The 3-Step Pipeline

The default delivery path is simple:

1. make intent explicit with a concise system design;
2. turn that intent into executable steps with implementation tracking;
3. execute with TDD when logic changes.

This keeps decisions durable without forcing every task into a heavyweight process.

## 2. Investigation Is an Entry Path, Not a Final Phase

Investigation is not "step 4 after coding".
It is the entry path when the root cause or solution space is still unclear.

Use an investigation doc when you need evidence, hypotheses, and a decision about what to do next.
Once the uncertainty is reduced, move into the normal delivery pipeline.

## 3. Harness Engineering Wraps the Whole Loop

Harness engineering is a cross-cutting practice, not a final cleanup phase.

Use it when:

- an agent guessed the wrong owner, boundary, or source of truth;
- a repeated task failed because verification was too manual;
- a private or stale example made the public docs unsafe to reuse;
- several agents would likely repeat the same mistake.

Typical harnesses:

- a clearer rule in `AGENTS.md` or `docs/agent_rules/*.md`;
- a factual source-of-truth doc;
- a small verification script;
- a template or naming fix that removes ambiguity.

## 4. Separate Routing, Facts, Rules, and Task Docs

These document types solve different problems:

- **Routing docs**
  - tell the reader where to go next
- **Factual docs**
  - describe how the repository is actually shaped
- **Rule docs**
  - describe how an agent should work within that shape
- **Task docs**
  - capture design, implementation tracking, or investigation for a concrete change

Mixing all four into one markdown file creates drift and context bloat.

## 5. Keep Canonical Terms and Filenames Stable

Agents do better when one concept has one name.

For this manifesto, the canonical model is:

- `3-step pipeline`
  - system design -> implementation tracking -> TDD execution
- `investigation`
  - used before the pipeline when the problem is unclear
- `harness engineering`
  - used whenever repeated mistakes need a durable guardrail

When naming changes, update the canonical docs and templates in the same change.

## 6. Keep Docs Small and Factual

Large docs go stale quickly.
Placeholder root docs are often worse than missing docs because they look authoritative while saying nothing.

Good defaults:

- factual docs describe the current repository;
- templates stay in `docs/templates/`;
- examples are marked as non-authoritative;
- repeated rationale is collapsed into one canonical place instead of being restated everywhere.

## 7. Task Contracts and Anti-Loop Discipline

Agents need a clear finish line and a clear stop condition.

For non-trivial work, define:

- the exact checks that close the task;
- the document that owns execution state;
- what evidence is needed before changing direction.

If the same fix keeps failing after several attempts, stop and review the assumptions instead of spending more tokens on the same guess.

## 8. Publishing Hygiene for Reusable Kits

If a repository is meant to be linked publicly, examples must be treated as part of the product.

That means:

- no company-specific details in public examples unless intentionally published;
- no stale terms that contradict the current model;
- no placeholder root docs pretending to be factual maps;
- no relying on git history as the source of truth when the current docs say otherwise.
