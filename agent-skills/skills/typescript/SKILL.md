---
name: typescript
description: TypeScript backend conventions for this user: Bun, Fastify, Zod, PostgreSQL, Drizzle ORM, Better Auth. Load before creating or editing TypeScript application code.
---

# TypeScript conventions

* **Runtime and package manager:** Bun. Use `bun` for dependencies, scripts,
  tests, and execution; do not add npm, pnpm, or a second lockfile.

## Default backend stack

Use this stack for new TypeScript backend work unless the repository already has
an established alternative:

* **HTTP:** Fastify. Keep routes thin and register behavior through Fastify
  plugins.
* **Validation:** Zod with `fastify-type-provider-zod`. A route's request and
  response schemas are its executable contract.
* **Database:** PostgreSQL.
* **Database access and migrations:** Drizzle ORM and `drizzle-kit`. Keep the
  schema, migrations, and database access in the application rather than
  introducing a second ORM.
* **Authentication:** Better Auth with its Drizzle adapter. Use the admin,
  organization, and API-key plugins when those capabilities are needed.
* **Server-to-browser events:** Server-Sent Events for one-way updates. Use
  WebSocket only when clients must send application messages over the same
  connection.
* **Tests:** `bun:test`, unless an integration dependency requires another test
  runner.

## Default frontend stack

* Use Svelte and shadcn-svelte.
* Use `lucide-svelte` for interface icons. Icon-only controls must have an
  accessible `aria-label`.

## New projects

* Add `node_modules/` to the project's `.gitignore` when creating a new
  TypeScript project. Do this even when a parent `.gitignore` already ignores
  it, so the project remains safe if it is moved or published independently.
