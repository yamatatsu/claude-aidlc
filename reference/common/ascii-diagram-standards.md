# ASCII Diagram Standards

## MANDATORY: Basic ASCII Only

### Allowed: `+` `-` `|` `^` `v` `<` `>` and alphanumeric text
### Forbidden: Unicode box-drawing (`┌` `─` `│` `└` etc.)

## Critical Rule: Character Width
**Every line in a box MUST have EXACTLY the same character count (including spaces)**

## Patterns

### Box
```
+-----------------------------+
|       Component Name        |
|  Description text here      |
+-----------------------------+
```

### Nested Boxes
```
+-----------------------------------+
|         Outer Container           |
|  +-----------------------------+  |
|  |       Inner Component       |  |
|  +-----------------------------+  |
+-----------------------------------+
```

### Arrows
```
+--------+     +--------+
| Source  | --> | Target |
+--------+     +--------+
```

### Vertical Flow
```
+--------+
| Input  |
+--------+
    |
    v
+--------+
| Output |
+--------+
```

## Validation Checklist
- [ ] Basic ASCII only
- [ ] No Unicode box-drawing
- [ ] Spaces (not tabs)
- [ ] Corners use `+`
- [ ] All box lines same character width

For complex diagrams, prefer Mermaid (see [content-validation.md](content-validation.md)).
