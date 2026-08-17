---
name: programming
description: Cross-language code layout for this user — order function definitions top-down, following the call graph, so a file reads from high-level intent down to detail. Load before writing or restructuring a source file in any language.
---

# Order definitions by the call graph

A file reads top to bottom, so it should start with what it does and descend
into how. The entry point comes first; each helper appears below its first
caller.

```python
def main():          # what the program does
    _ssh_tunnel(...)

def _ssh_tunnel():   # called by main
    _free_port()

def _free_port():    # called by _ssh_tunnel
    ...
```

Not the reverse — a reader who opens the file at the top should not have to
wade through leaf utilities before finding out what the module is for. Detail
is what you descend into when you need it, not what you scroll past to reach
the point.

## Applying it

- **Depth-first, not breadth-first.** After a function, place the helpers it
  calls, and their helpers, before moving to the caller's next sibling. Keeps
  a chain of related code contiguous.
- **Ties break by first call site.** A helper used by several functions goes
  under the first one that calls it. If it's used all over, the bottom of the
  file is fine — that's the shared-utility floor.
- **Above the entry point** go only imports, constants, type/data
  declarations, and configuration tables — things you read as context, not as
  behaviour.
- **Adding to an existing file:** put the new function below its caller, in the
  same spirit. Don't reorder the rest of the file as a drive-by — that turns a
  small change into an unreviewable diff. If a file is badly ordered and worth
  fixing, say so and let the user decide, ideally as its own commit.

## Language constraints

The rule survives in most languages, but check before assuming:

- **Python, Rust, Go, Java, C#, TypeScript classes/methods** — definition order
  is free; apply the rule as written.
- **JavaScript/TypeScript** — `function` declarations hoist, so top-down works.
  `const fn = () => {}` does *not* hoist: if it is called at module load time,
  it must be defined before the call. Inside functions, calls happen later, so
  ordering is free there.
- **C/C++** — needs a declaration before use; put prototypes at the top (or in
  the header) and keep the definitions themselves in call order.
- **Python at import time** — module-level *calls* execute immediately, so
  anything invoked during import must already be defined. Function bodies are
  not evaluated at definition, so ordinary helpers are unaffected.
