# Implementation Plan: [Feature Name]

## Metadata
**Author(s):** [Agent/Human Name]
**Reviewer(s):** [Agent/Human Name]
**Date Created:** [YYYY-MM-DD]
**Date Updated:** [YYYY-MM-DD]
**Status:** Draft | In Progress | Completed
**Linked Design Doc:** [Link to Design Doc]
**Branch:** [feature-branch-name]

---

## Overview
Briefly describe the implementation strategy. What is the core transformation?

---

## 🏗 Phase 1: Foundation (Scaffolding & Types)
*Define the skeleton, interfaces, and core types.*

### [ ] Step 1.1: Initialize Types
- **Tests**: `tests/types/feature.test.ts`
- **Criteria**: All interfaces match the design doc.

---

## 🧪 Phase 2: Core Logic (TDD)
*Iterative development using the Red-Green-Refactor loop.*

### [ ] Step 2.1: [Specific Logic Component]
- **TDD Hook**: Define a failing test in `tests/core/logic.test.ts`.
- **Implementation**: Minimal logic to satisfy the test.
- **Verification**: `npm test logic.test.ts` passes.

### [ ] Step 2.2: [Next Logic Component]
- **TDD Hook**: Define a failing test for the next piece of logic.
- **Implementation**: ...
- **Verification**: ...

---

## 🎨 Phase 3: Integration & UI (if needed)
*Connect the core logic to the rest of the application.*

### [ ] Step 3.1: Integration Tests
- **Tests**: `tests/integration/feature_integration.test.ts`
- **Criteria**: Feature works within the full system flow.

---

## 🧹 Phase 4: Final Cleanup & Documentation
- [ ] Refactor for performance/readability.
- [ ] Update README/User Documentation.
- [ ] Verify zero regression with full test suite run.

---

## 🚀 Verification Checklist
- [ ] Unit tests pass.
- [ ] Integration tests pass.
- [ ] Linting and type-checking pass.
- [ ] Performance benchmarks (if applicable) meet goals.
