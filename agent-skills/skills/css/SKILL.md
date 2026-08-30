---
name: css
description: CSS styling and themes. Use before creating or editing CSS, SCSS, or component style blocks.
---

# CSS structure

## Themes

Scope theme overrides once, then use native CSS nesting for descendant rules.
Do not repeat the theme selector for every override.

```css
body[data-theme='light'] {
  color: #17211c;
  background: #f4f3ed;

  header, footer { color: #667269; }
  .workspace { background: #fbfaf5; }
  .button:hover { border-color: #5c7d31; }
}
```

Use `data-theme` on the document element or `body` for application-wide
themes. Use a local class only when a component deliberately supports an
independent theme.

