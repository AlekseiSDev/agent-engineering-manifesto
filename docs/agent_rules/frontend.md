# Frontend Rules for Agents

This file is a reusable starter for repository-specific frontend rules.

Replace placeholder paths and patterns when adopting it in a real project.

## 1. Purpose

Use this file to define:

- where frontend code should live;
- which patterns must be reused before inventing new abstractions;
- how frontend changes should be validated;
- which failures are considered blocking.

This should be a practical rulebook, not a generic style guide.

## 2. Frontend System Map

Document the main frontend surfaces in the target repository.

Examples:

- app entrypoints;
- routing layer;
- shared transport layer;
- feature modules;
- shared UI primitives;
- shared state containers.

Project-specific example:

- in a monorepo, this may look like `apps/web`, `packages/ui-kit`, and `packages/service`.

## 3. Placement Rules

Define where code belongs.

Typical rules:

- keep product-specific UI close to the owning app or feature;
- move code into shared UI libraries only when the reuse is real;
- keep generic hooks and helpers in shared packages only when they are not feature-specific;
- avoid speculative abstractions that hide product semantics.

## 4. Discovery Before Editing

Before changing frontend code, agents should:

1. locate the current owner of the feature or screen;
2. search for an existing pattern nearby;
3. look for existing selectors, component tests, or page objects;
4. check the testing rules for validation expectations.

Reuse existing selectors, modal/state patterns, and transport layers when they already fit.

## 5. Legibility Rules

Frontend code should stay legible to both humans and agents.

Prefer:

- stable selectors for critical UI;
- explicit ownership of state and effects;
- visible validation paths;
- domain logic near the feature that owns it.

Avoid:

- hidden business logic in generic helpers;
- one-off parallel state systems;
- transport bypasses with ad hoc network calls everywhere.

## 6. Validation Rules

Minimum validation should be documented explicitly for the target repository.

Typical expectations:

- run affected tests;
- run typecheck for the relevant frontend package or app;
- start the app when the shell, routing, or shared primitives are affected;
- perform browser validation for user-facing or visually fragile work.

## 7. Blocking Failures

Treat these as blocking unless the task explicitly says otherwise:

- the main shell does not render;
- critical console errors appear after the change;
- routing or primary navigation breaks;
- the changed control exists in code but is not actually usable in the live app.
