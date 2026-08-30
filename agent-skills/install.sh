#!/usr/bin/env bash

set -euo pipefail

main() {
  local repository_dir skills_dir agent_dir

  repository_dir=$(cd -P "$(dirname "${BASH_SOURCE[0]}")" && pwd)
  skills_dir="$repository_dir/skills"

  for agent_dir in "$HOME/.claude" "$HOME/.codex" "$HOME/.opencode"; do
    if [[ -d "$agent_dir" ]]; then
      sync_agent_skills "$agent_dir" "$skills_dir"
    else
      printf 'Skipping %s: directory does not exist.\n' "$agent_dir"
    fi
  done
}

sync_agent_skills() {
  local agent_dir=$1 skills_dir=$2 source_skill destination

  mkdir -p "$agent_dir/skills"

  for source_skill in "$skills_dir"/*; do
    [[ -d "$source_skill" ]] || continue

    destination="$agent_dir/skills/${source_skill##*/}"
    if [[ -L "$destination" ]]; then
      if [[ "$(readlink "$destination")" == "$source_skill" ]]; then
        continue
      fi

      if is_managed_link "$destination" "$skills_dir"; then
        rm "$destination"
      else
        printf 'Skipping %s: it is a symlink outside this repository.\n' "$destination" >&2
        continue
      fi
    elif [[ -e "$destination" ]]; then
      printf 'Skipping %s: it already exists and is not a symlink.\n' "$destination" >&2
      continue
    fi

    ln -s "$source_skill" "$destination"
    printf 'Linked %s -> %s\n' "$destination" "$source_skill"
  done

  remove_outdated_links "$agent_dir/skills" "$skills_dir"
}

remove_outdated_links() {
  local destination_dir=$1 skills_dir=$2 destination target

  for destination in "$destination_dir"/*; do
    [[ -L "$destination" ]] || continue
    is_managed_link "$destination" "$skills_dir" || continue

    target=$(readlink "$destination")
    if [[ ! -d "$target" ]]; then
      rm "$destination"
      printf 'Removed outdated link %s\n' "$destination"
    fi
  done
}

is_managed_link() {
  local destination=$1 skills_dir=$2 target

  target=$(readlink "$destination")
  [[ "$target" == "$skills_dir"/* ]]
}

main "$@"
