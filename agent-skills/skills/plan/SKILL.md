---
name: plan
description: Write and maintain a plan as a markdown file with a checklist. Use when the user asks to plan a piece of work, write up a plan, or turn an investigation into a work list — and whenever working through an existing plan file, to mark items done.
---

# Plan files

A plan is a markdown file in the repo, not a message in the chat. It survives the
session; the chat does not.

## Creating a plan

Write it to `plans/<topic>.md` (snake_case topic, e.g. `plans/automate_deployment.md`).
If the repo already keeps plans somewhere else, follow that convention instead.

Structure:

```markdown
# <Title>

<A short description: what this plan is for and what "done" looks like.
Two or three sentences, not a summary of the TODO items.>

## TODO

[ ] **<Item>** — what to change and where, concretely enough to act on
    without rereading the whole codebase.

[ ] **<Item>** — ...
```

Rules:

- Every checklist item starts with `[ ] ` (no leading `-`).
- Completed items are marked `[X] `.
- One item = one reviewable change. If an item needs its own plan, it is too big.
- Name real files, symbols, and commands in the item text. `[ ] Fix the config` is
  useless a week later; `[ ] Hoist the hardcoded zone_id out of cc/dev.tf into a
  variable` is not.
- Order items so earlier ones unblock later ones.

Sections beyond `## TODO` are welcome when the material warrants it — current
state, decisions to make first, known drift, out of scope. Anything that stops
the next session from re-deriving what you already worked out.

## Working through a plan

- Mark an item `[X]` in the file the moment it is finished — before summarizing in
  chat, before moving to the next item. An item that is done but still reads `[ ]`
  gets redone later.
- Never mark `[X]` for work that is written but unverified. If it cannot be checked
  yet, leave `[ ]` and note what verification is outstanding.
- If the work reveals the plan was wrong, edit the plan. Add, split, or drop items
  and say so — a plan that no longer matches reality is worse than no plan.
