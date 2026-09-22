---
name: python
description: Python conventions for this user — underscore-prefix everything that is not public API, plus uv inline script metadata and typer for CLIs. Load before writing or editing any .py file.
---

# Python conventions

## General

* Always use explicit typing. Use `import typing as t` for succinct code.
* For new projects and standalone scripts, use the latest stable Python release
  (currently 3.14). Set `requires-python = ">=3.14"` in project or inline script
  metadata. Do not default to older versions for speculative compatibility;
  respect existing projects' supported versions unless asked to upgrade them.
* Prefer async for concurrency were possible.
* Use `pytest` for testing.
* Use `logging` instead of `print`.

## Private names take a leading underscore

Anything not part of a module's public API is `_`-prefixed: functions, classes,
module-level helpers, constants that callers have no business reading. PEP 8's
rule, applied strictly — "nothing outside imports this" is not enough, the name
has to say so.

For a script, the public API is usually just `main`. Everything it calls is
private:

```python
def _read_keys(path: pathlib.Path) -> list[str]: ...
def _render(source: pathlib.Path, dest: pathlib.Path) -> None: ...
def _fail(message: str) -> None: ...

def main() -> None:
    ...
```

Not:

```python
def read_keys(path): ...      # reads like an exported helper
def render(source, dest): ...
```

For a library module, the public API is what the package intends callers to
use; helpers behind it are still `_`-prefixed.

Applies to classes (`class _Tunnel:`) too.
And constants:
```python
_MYSQL_PORT = 3306
```

**Do not rename existing public names in code you did not write** as a
drive-by. Follow the rule for what you add; if the surrounding file predates it
and would benefit, say so and let the user decide.

## Scripts: uv with inline dependencies

Standalone scripts declare their dependencies inline (PEP 723) and run under
`uv` — no requirements.txt, no venv to activate:

```python
#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = ["typer", "pymysql>=1.1"]
# ///
```

Invoke as `uv run scripts/thing.py`.

## CLIs use typer

Not argparse, for anything new. Arguments and options are typed with
`Annotated`, and errors exit through typer rather than `sys.exit`:

```python
def main(
    env: Annotated[str, typer.Argument(help='environment name, e.g. "live"')],
    source: Annotated[str, typer.Option("--from", help="template env")] = "dev",
    force: Annotated[bool, typer.Option("--force")] = False,
) -> None:
    ...

if __name__ == "__main__":
    typer.run(main)
```

```python
def _fail(message: str) -> None:
    typer.secho(message, fg=typer.colors.RED, err=True)
    raise typer.Exit(1)
```
