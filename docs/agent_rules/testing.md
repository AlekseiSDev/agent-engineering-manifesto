# Testing Rules for Agents

This file is a reusable starter for repository-specific testing rules.

Replace placeholder commands and paths when adopting it in a real project.

## 1. Purpose

Use this file to define:

- what test surfaces exist in the repository;
- how to choose the right level of validation;
- what counts as sufficient verification for different change types;
- when runtime or UI checks are mandatory.

Core principle:

- do not stop at "some tests passed";
- choose the cheapest reliable test surface for the invariant being changed;
- increase the validation level when blast radius increases.

## 2. Test Surfaces

Document the real commands used in the target repository.

### 2.1 Broad repository-level commands

```bash
[root test command]
[root integration command]
[typecheck command]
[lint command]
```

### 2.2 Targeted package or service commands

```bash
[service or package test command]
[service or package typecheck command]
```

### 2.3 Black-box or end-to-end surfaces

```bash
[api smoke command]
[browser or e2e command]
```

## 3. How to Choose the Right Test Level

Before writing or running tests, answer:

1. What invariant is changing?
2. At which level can that invariant be checked most reliably?
3. Does a live runtime or user-facing flow need to be validated?

Prefer unit or narrow integration checks when:

- pure business logic changes;
- mapping, parsing, or transformation logic changes;
- dependencies can be mocked without losing the invariant.

Prefer broader integration or end-to-end checks when:

- public contracts change;
- several modules participate in the behavior;
- storage, queues, or external systems are part of the scenario;
- a user-facing flow can be broken while local tests still pass.

## 4. Large-Feature Validation

A large or fragile change usually needs more than local tests.

Typical signals:

- multiple layers are touched;
- a public API or shared state changes;
- a critical user flow changes;
- the work crosses several bounded contexts.

Minimum expected validation for fragile work:

1. targeted tests for changed code;
2. at least one broader check that validates the full behavior;
3. runtime verification when the feature depends on integration;
4. browser or UI smoke-checks for user-facing changes.

## 5. UI or Runtime Smoke-Checks

If the change affects a user-facing flow, document the expected live behavior explicitly.

Example:

- main shell renders;
- no critical console errors;
- the changed control can be exercised;
- the result is visible in the UI or API response.

If the repository has browser automation, document the preferred smoke-check path here.

## 6. Exit Criteria by Change Type

### Small local change

Usually enough:

- targeted tests;
- typecheck for the affected area;
- a quick contract check if an API surface is involved.

### Integration-heavy change

Usually required:

- targeted tests;
- integration or end-to-end test;
- runtime or service-level verification.

### User-facing change

Usually required:

- affected tests;
- live runtime check;
- browser or visual verification;
- console or error log check.

## 7. Reporting Results

Record verification in the implementation doc or final task report:

- command or check used;
- result;
- known gaps;
- what was not validated and why.
