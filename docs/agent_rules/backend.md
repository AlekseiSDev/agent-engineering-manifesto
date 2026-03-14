# Backend Rules for Agents

This file is a reusable starter for repository-specific backend rules.

Replace placeholder paths, commands, and boundary names when adopting it in a real project.

## 1. Purpose

Use this file to define:

- backend runtime boundaries;
- API and contract rules;
- persistence and integration change discipline;
- verification expectations for backend work.

## 2. Backend System Map

Document the main backend surfaces in the target repository.

Examples:

- HTTP or RPC services;
- workers and schedulers;
- background jobs and queues;
- integration clients;
- shared backend libraries.

## 3. Boundary Rules

Define which component owns what.

Typical rules:

- do not introduce duplicate entrypoints for the same domain casually;
- keep public contracts explicit;
- prefer existing transport and serialization layers;
- do not let shared packages silently absorb product-specific behavior.

## 4. Contract and Persistence Changes

For changes involving APIs, events, or storage:

- identify the source of truth first;
- map affected readers and writers;
- check whether the contract is public, shared, or versioned;
- prefer integration tests when several modules participate.

If a change affects persistence, cross-check with `docs/data-topology.md`.

## 5. Discovery Before Editing

Before editing backend code, agents should:

1. find the owning module or service;
2. identify existing tests and integration surfaces;
3. check whether there is an architecture or topology doc for the area;
4. confirm the expected validation path before changing behavior.

## 6. Validation Rules

Typical expectations for backend work:

- targeted tests for the affected module;
- typecheck or compile validation for the affected service;
- integration verification when contracts, storage, queues, or external systems are part of the behavior;
- runtime health or smoke-check when the change affects service startup or wiring.

## 7. Blocking Failures

Treat these as blocking unless the task explicitly says otherwise:

- service startup breaks;
- API contracts change without verification;
- persistence ownership is guessed instead of confirmed;
- the code path is changed but no reliable integration check exists.
