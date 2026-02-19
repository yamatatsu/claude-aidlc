#!/bin/bash
# check-artifacts.sh — Check existence of AI-DLC artifacts for a given stage
# Usage: check-artifacts.sh <stage-name>
# Returns JSON with artifact status

STAGE="$1"
DOCS_DIR="aidlc-docs"

if [ -z "$STAGE" ]; then
  echo "Usage: check-artifacts.sh <stage-name>" >&2
  exit 1
fi

check_file() {
  local path="$1"
  if [ -f "$path" ]; then
    echo "\"$path\": true"
  else
    echo "\"$path\": false"
  fi
}

case "$STAGE" in
  "workspace-detection")
    echo "{"
    check_file "$DOCS_DIR/aidlc-state.md"
    echo "}"
    ;;
  "reverse-engineering")
    echo "{"
    check_file "$DOCS_DIR/inception/reverse-engineering/business-overview.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/architecture.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/code-structure.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/api-documentation.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/component-inventory.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/technology-stack.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/dependencies.md"
    echo ","
    check_file "$DOCS_DIR/inception/reverse-engineering/code-quality-assessment.md"
    echo "}"
    ;;
  "requirements")
    echo "{"
    check_file "$DOCS_DIR/inception/requirements/requirements.md"
    echo ","
    check_file "$DOCS_DIR/inception/requirements/requirement-verification-questions.md"
    echo "}"
    ;;
  "user-stories")
    echo "{"
    check_file "$DOCS_DIR/inception/user-stories/stories.md"
    echo ","
    check_file "$DOCS_DIR/inception/user-stories/personas.md"
    echo "}"
    ;;
  "application-design")
    echo "{"
    check_file "$DOCS_DIR/inception/application-design/components.md"
    echo ","
    check_file "$DOCS_DIR/inception/application-design/component-methods.md"
    echo ","
    check_file "$DOCS_DIR/inception/application-design/services.md"
    echo "}"
    ;;
  "units-generation")
    echo "{"
    check_file "$DOCS_DIR/inception/plans/unit-of-work.md"
    echo ","
    check_file "$DOCS_DIR/inception/plans/unit-of-work-dependency.md"
    echo "}"
    ;;
  *)
    echo "{\"error\": \"Unknown stage: $STAGE\"}" >&2
    exit 1
    ;;
esac

exit 0
