# Agent Engineering Manifesto

This repository defines a structured workflow for AI coding assistants. It moves agents from random code generation to a predictable Design -> Plan -> TDD process.

## 🚀 The Core Workflow (3 Stages)

### 1. 📐 System Design Phase
**Before any code is written**, the agent must produce a comprehensive design document in `docs/system_design_<feature>.md`.
- **Reference**: Based on Google's Design Docs.
- **Size**: 150-300 lines for medium/large features. 300+ for the project core.
- **Template**: [docs/templates/system_design_template.md](docs/templates/system_design_template.md)

### 2. 📝 Implementation Planning
Translate the high-level design into a granular, step-by-step roadmap in `docs/implementation_plan_<feature>.md`.
- **TDD-Ready**: Each step defines its verification test.
- **Atomic Steps**: Small, verifiable chunks of work.
- **Template**: [docs/templates/implementation_plan_template.md](docs/templates/implementation_plan_template.md)

### 3. 🧪 TDD Execution (Red-Green-Refactor)
The agent executes the implementation plan step-by-step, following strict TDD principles:
1.  **Red**: Write a failing test for the current step.
2.  **Green**: Write the minimal code to satisfy the test.
3.  **Refactor**: Optimize while maintaining the tests.
4.  **Repeat** until the entire plan is completed.

---

## 🛠 Project Structure

- `docs/templates/` - Standardized blueprints for agent documentation.
- `AGENTS.md` - The master template containing instructions and rules for AI agents.

---

## 🤖 For Visiting AI Agents

If you are an AI assistant tasked with adopting this manifesto in a new repository, follow these exact steps to set up the workspace:

1. **Copy the Templates**: Copy the `docs/templates/` directory from this repository into the target repository.
2. **Establish the Rules File**:
   - Copy the contents of `AGENTS.md` into the root of your target repository.
   - **Rename the file** to ensure the resident agent automatically loads it. Use the appropriate filename for your platform:
     - `AGENTS.md` (for Cursor, Copilot, general editors)
     - `GEMINI.md` (for Gemini CLI)
     - `CLAUDE.md` (for Claude / Cline)
3. **Customize the Rules File**: Fill out the `📋 Project Context` section at the top of the newly copied file with the target project's specific architecture, domain knowledge, and tech stack.

By doing this, you install this manifesto as the "source of truth" workflow for all future agent operations in that project, ensuring high-quality, verifiable code generation.
