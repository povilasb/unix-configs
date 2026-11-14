---
name: css
description: CSS styling, Tailwind utilities, and themes. Use before creating or editing styles, including Tailwind classes in HTML or component templates, CSS, SCSS, or component style blocks.
---

# CSS structure

## Prefer Tailwind utilities when available

In projects using Tailwind CSS, prefer its utilities for styling in HTML and
component templates instead of adding equivalent plain CSS rules. Reuse the
project's components and theme tokens. Keep scoped CSS for rules that utilities
cannot express clearly; do not introduce Tailwind into projects that do not use
it or convert unrelated existing styles as part of a small change.

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
