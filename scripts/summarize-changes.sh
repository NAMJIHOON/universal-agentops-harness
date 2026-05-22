#!/usr/bin/env bash
set -u

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf 'Not a git repository. No git change summary available.\n'
  exit 0
fi

printf '== Changed Files ==\n'
git status --short

printf '\n== Diff Summary ==\n'
git diff --stat

printf '\n== Recent Diff Names ==\n'
git diff --name-only
