---
name: programming
description: Cross-language programming conventions — simplicity first, domain-revealing names, and top-down call-graph code layout. Load before writing or restructuring source files in any language, and when naming CLI commands, lifecycle states, workflows, modules, or application directories.
---

# Prefer the simplest complete solution

Value simplicity. Bias toward fewer concepts, layers, fields, and
stateful components. Implement the current requirement completely; do not expand
it into a platform for possible future requirements.

- **Simplicity is not skipping correctness.** Keep necessary validation,
  authorization, bounded external calls, and honest error handling. Optimize for
  fewer concepts to understand and maintain, not merely fewer lines of code.

# Name things by domain purpose and scope

Names are part of the user interface, including file paths and CI workflow
names. A reader should understand what something is responsible for, or what
an operation acts on, without opening its implementation. Use the vocabulary
of the business or operational domain, not incidental history or an
implementation detail that leaves the actual subject unnamed.

- **Name the subject, not just the mechanism.** A hosting provider does not
  identify the application being deployed. Prefer `deploy-web` over
  `cloudflare-deploy`; add the provider as a qualifier when it distinguishes
  multiple deployment targets.
- **Use action + object for operations.** Bare verbs such as `bootstrap`,
  `configure`, or `process` hide their scope. Prefer `setup-docker`,
  `setup-deployment-config`, or another name that says what changes. Component
  and directory names should identify their responsibility, such as `web`
  for the frontend web app, rather than an ambiguous label such as `live`.
- **Match the actual effects.** Generating deployment configuration is not
  deploying an application. A step that opens, checks, and merges a PR does
  more than push a branch. Keep names accurate as behavior evolves, especially
  for resumable lifecycle states where an operator chooses what to run next.
- **Use enough context, not maximum length.** Judge the name where it is
  consumed: a directory tree, CLI help, workflow list, log, or call site.
  Qualify it when several subjects could fit; omit context already made clear
  by the enclosing scope. Technical names are appropriate when the technology
  really is the subject, as in installing Docker.

Examples of clearer names when they describe the actual responsibility:

| Ambiguous | Clearer | What the name communicates |
| --- | --- | --- |
| `bootstrap` | `setup-docker` | Install/configure Docker on the target servers |
| `configure` | `setup-deployment-config` | Generate deployment configuration, not deploy it |
| `cloudflare-deploy.yml` | `deploy-web.yaml` with display name `Deploy Web App to Cloudflare` | Which application is deployed, then where |
| `apps/live` | `apps/web` | The frontend web application |

**Review test:** could this name equally describe another application or
operation in this repository? If so, add the missing subject or scope. Having
to inspect source just to identify the subject is a naming/UX problem, not
something to solve only with a comment.

For an agreed rename, update identifiers, CLI help and validation, logs,
workflow display names and references, documentation, and tests together as
applicable. Public flags, state names, and paths may be compatibility
contracts: flag affected callers and agree on aliases or migration when
needed. Propose broader repository renames separately rather than doing them
as incidental cleanup.

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
- **Visually group function bodies.** Separate distinct phases such as argument
  parsing, validation, setup, main work, and reporting with blank lines. Keep
  tightly related statements together; do not add blank lines after every
  statement. Avoid dense one-line functions and expressions when expanding them
  makes the control flow easier to scan.

## Module declaration

Start a source module with a short documentation comment that declares its
semantic responsibility. State what belongs in the module, not implementation
details already apparent from the code. Include an important invariant when one
defines the module's meaning.

```ts
/**
 * Conditions describe body concerns over time and their affected muscle states.
 */
```

Use the language's conventional module-comment syntax. Omit it only for
trivial entry points, generated files, or files whose purpose is unambiguous
from a small declarative configuration.

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
