#!/bin/bash
# validate-content.sh — Validate content before file creation
# Usage: validate-content.sh <file-path>
# Exit 0: valid, Exit 2: blocked (validation failed)

FILE_PATH="$1"

if [ -z "$FILE_PATH" ]; then
  echo "Usage: validate-content.sh <file-path>" >&2
  exit 1
fi

if [ ! -f "$FILE_PATH" ]; then
  echo "File not found: $FILE_PATH" >&2
  exit 1
fi

ERRORS=0

# Check for Unicode box-drawing characters (forbidden in ASCII diagrams)
if grep -Pn '[\x{2500}-\x{257F}\x{2580}-\x{259F}]' "$FILE_PATH" 2>/dev/null; then
  echo "ERROR: Unicode box-drawing characters detected. Use basic ASCII only (+, -, |, ^, v, <, >)." >&2
  ERRORS=$((ERRORS + 1))
fi

# Check for tab characters in diagram blocks
if grep -Pn '\t' "$FILE_PATH" 2>/dev/null | head -5; then
  echo "WARNING: Tab characters detected. Use spaces for alignment." >&2
fi

# Basic Mermaid syntax check (if mermaid blocks exist)
if grep -q '```mermaid' "$FILE_PATH"; then
  # Check for unclosed mermaid blocks
  OPEN=$(grep -c '```mermaid' "$FILE_PATH")
  CLOSE=$(grep -c '```$' "$FILE_PATH")
  if [ "$OPEN" -gt "$CLOSE" ]; then
    echo "ERROR: Unclosed mermaid code block detected." >&2
    ERRORS=$((ERRORS + 1))
  fi
fi

if [ "$ERRORS" -gt 0 ]; then
  echo "Content validation failed with $ERRORS error(s)." >&2
  exit 2
fi

echo "Content validation passed."
exit 0
