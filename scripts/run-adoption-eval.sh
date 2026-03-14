#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  scripts/run-adoption-eval.sh <fixture-name> [--output-root <dir>] [-- <runner command...>]

Examples:
  scripts/run-adoption-eval.sh minimal-service
  scripts/run-adoption-eval.sh telegram-agent-bridge --output-root /tmp/adoption-evals
  scripts/run-adoption-eval.sh minimal-service -- ./my-runner-wrapper.sh

The optional runner command is executed inside the prepared workspace with these env vars:
  ADOPTION_MANIFESTO_REPO
  ADOPTION_FIXTURE
  ADOPTION_WORKSPACE
  ADOPTION_PROMPT_FILE
  ADOPTION_CHECKLIST_FILE
EOF
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fixtures_root="$repo_root/tests/fixtures"
checklist_file="$repo_root/tests/evals/adoption_checklist.md"
output_root="$repo_root/tests/runs"
fixture_name="$1"
shift

runner_cmd=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output-root)
      output_root="$2"
      shift 2
      ;;
    --)
      shift
      runner_cmd=("$@")
      break
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

fixture_dir="$fixtures_root/$fixture_name"
seed_dir="$fixture_dir/seed"
scenario_file="$fixture_dir/scenario.md"

if [[ ! -d "$seed_dir" ]]; then
  echo "Unknown fixture: $fixture_name" >&2
  exit 1
fi

if [[ ! -f "$scenario_file" ]]; then
  echo "Missing scenario file for fixture: $fixture_name" >&2
  exit 1
fi

mkdir -p "$output_root"

timestamp="$(date -u +%Y%m%dT%H%M%SZ)"
run_dir="$output_root/$timestamp-$fixture_name"
workspace_dir="$run_dir/workspace"
prompt_file="$run_dir/prompt.md"
instructions_file="$run_dir/run_instructions.md"

mkdir -p "$workspace_dir"
cp -R "$seed_dir"/. "$workspace_dir"/

cat >"$prompt_file" <<EOF
You are configuring a fresh repository according to the Agent Engineering Manifesto.

Reference repository:
$repo_root

Use these files from the manifesto repository as your main reference material:
- README.md
- AGENTS_template.md
- docs/index.md
- docs/agentic_engineering_guide.md
- docs/agent_rules/
- docs/templates/

Do not copy the manifesto repository's AGENTS.md directly. It is repository-specific.

Your task:
- configure the current repository so resident coding agents follow the manifesto;
- create only the smallest useful set of docs;
- replace placeholders with repo-specific facts;
- keep routing explicit if supporting docs are created;
- avoid cargo-culting docs that do not help this repo.

Fixture-specific scenario:
$(cat "$scenario_file")

After the setup is done, review the result against:
$checklist_file
EOF

cat >"$instructions_file" <<EOF
Adoption run prepared.

Fixture: $fixture_name
Manifesto repo: $repo_root
Workspace: $workspace_dir
Prompt file: $prompt_file
Checklist: $checklist_file

Manual flow:
1. cd "$workspace_dir"
2. Launch your agent or subagent in this workspace.
3. Give it the prompt from "$prompt_file".
4. Review the resulting docs using "$checklist_file".
EOF

echo "Prepared adoption run:"
echo "  fixture:    $fixture_name"
echo "  workspace:  $workspace_dir"
echo "  prompt:     $prompt_file"
echo "  checklist:  $checklist_file"

if [[ ${#runner_cmd[@]} -gt 0 ]]; then
  (
    cd "$workspace_dir"
    ADOPTION_MANIFESTO_REPO="$repo_root" \
    ADOPTION_FIXTURE="$fixture_name" \
    ADOPTION_WORKSPACE="$workspace_dir" \
    ADOPTION_PROMPT_FILE="$prompt_file" \
    ADOPTION_CHECKLIST_FILE="$checklist_file" \
    "${runner_cmd[@]}"
  )
else
  echo
  echo "No runner command supplied."
  echo "Use the generated prompt and workspace for a manual subagent run."
fi
