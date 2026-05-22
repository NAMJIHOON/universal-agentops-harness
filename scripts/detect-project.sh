#!/usr/bin/env bash
set -u

root="${1:-.}"

if [ -f "$root/package.json" ]; then
  echo "node"
elif [ -f "$root/pom.xml" ]; then
  echo "maven"
elif [ -f "$root/build.gradle" ] || [ -f "$root/build.gradle.kts" ]; then
  echo "gradle"
elif [ -f "$root/composer.json" ]; then
  echo "php"
elif [ -f "$root/pyproject.toml" ] || [ -f "$root/requirements.txt" ]; then
  echo "python"
elif [ -f "$root/Dockerfile" ] || [ -f "$root/docker-compose.yml" ] || [ -f "$root/compose.yml" ]; then
  echo "infra"
else
  echo "unknown"
fi
