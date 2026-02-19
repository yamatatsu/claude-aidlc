# Content Validation Rules

## MANDATORY: Validate Before File Creation

All generated content MUST be validated before writing to files.

## ASCII Diagram Standards

Before creating files with ASCII diagrams:
1. Use ONLY basic ASCII: `+` `-` `|` `^` `v` `<` `>` and spaces
2. NO Unicode box-drawing characters
3. Every line in a box MUST have the same character count
4. Use spaces (not tabs) for alignment
5. Verify box corners align vertically

See [ascii-diagram-standards.md](ascii-diagram-standards.md) for patterns.

## Mermaid Diagram Validation

1. **Syntax Check**: Validate before file creation
2. **Character Escaping**: Use alphanumeric + underscore for node IDs
3. **Fallback Content**: Always include text alternative

### Validation Steps
- Check for invalid characters in node IDs
- Escape special characters in labels
- Validate flowchart syntax
- If validation fails, use text-based representation

## General Validation Checklist

- [ ] Validate embedded code blocks (Mermaid, JSON, YAML)
- [ ] Check special character escaping
- [ ] Verify markdown syntax
- [ ] Include fallback content for complex elements

## Failure Handling

1. Log the error
2. Use fallback content (text-based alternative)
3. Continue workflow (don't block on validation failures)
4. Inform user about simplified content
