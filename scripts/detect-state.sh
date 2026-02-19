#!/bin/bash
# detect-state.sh — Detect AI-DLC project state in the workspace
# Returns JSON with project status information

STATE_FILE="aidlc-docs/aidlc-state.md"
AUDIT_FILE="aidlc-docs/audit.md"

if [ -f "$STATE_FILE" ]; then
  # Extract current phase and stage from state file
  CURRENT_PHASE=$(grep -m1 "Current Phase" "$STATE_FILE" | sed 's/.*: *//' | tr -d '[:space:]')
  CURRENT_STAGE=$(grep -m1 "Current Stage" "$STATE_FILE" | sed 's/.*: *//')
  PROJECT_TYPE=$(grep -m1 "Project Type" "$STATE_FILE" | sed 's/.*: *//' | tr -d '[:space:]')

  echo "{\"exists\": true, \"phase\": \"${CURRENT_PHASE}\", \"stage\": \"${CURRENT_STAGE}\", \"projectType\": \"${PROJECT_TYPE}\"}"
else
  # Check for existing code to determine greenfield/brownfield
  CODE_FILES=$(find . -maxdepth 3 -type f \( -name "*.ts" -o -name "*.js" -o -name "*.py" -o -name "*.java" -o -name "*.go" -o -name "*.rs" -o -name "*.rb" -o -name "*.php" -o -name "*.cs" -o -name "*.cpp" -o -name "*.c" \) ! -path "./aidlc-docs/*" ! -path "./node_modules/*" ! -path "./.git/*" 2>/dev/null | head -5)

  if [ -n "$CODE_FILES" ]; then
    echo "{\"exists\": false, \"hasCode\": true, \"projectType\": \"brownfield\"}"
  else
    echo "{\"exists\": false, \"hasCode\": false, \"projectType\": \"greenfield\"}"
  fi
fi
