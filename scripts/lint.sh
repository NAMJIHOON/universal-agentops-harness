#!/usr/bin/env bash
set -u

have() {
  command -v "$1" >/dev/null 2>&1
}

package_has_script() {
  script="$1"
  [ -f package.json ] && grep -Eq "\"$script\"[[:space:]]*:" package.json
}

run_node_lint() {
  if ! package_has_script "lint"; then
    printf 'No package script "lint" found. Skipping lint.\n'
  elif [ -f pnpm-lock.yaml ] && have pnpm; then
    pnpm run lint
  elif [ -f yarn.lock ] && have yarn; then
    yarn run lint
  elif have npm; then
    npm run lint
  else
    printf 'No supported Node package manager found. Skipping lint.\n'
  fi
}

php_syntax_check() {
  found=0
  failed=0

  while IFS= read -r -d '' file; do
    found=1
    php -l "$file" || failed=1
  done < <(find . -name '*.php' -not -path './vendor/*' -print0)

  if [ "$found" -eq 0 ]; then
    printf 'No PHP files found. Skipping syntax check.\n'
    return 0
  fi

  return "$failed"
}

detector="$(dirname "$0")/detect-project.sh"
if [ -x "$detector" ]; then
  detected="$("$detector" .)"
else
  detected="unknown"
fi

printf 'Detected type: %s\n' "$detected"

case "$detected" in
  node)
    run_node_lint
    ;;
  maven)
    if ! grep -qi "checkstyle" pom.xml 2>/dev/null; then
      printf 'No Maven Checkstyle configuration found. Skipping lint.\n'
    elif [ -x ./mvnw ]; then
      ./mvnw checkstyle:check
    elif have mvn; then
      mvn checkstyle:check
    else
      printf 'Maven is not available. Skipping lint.\n'
    fi
    ;;
  gradle)
    if [ -x ./gradlew ]; then
      ./gradlew check
    elif have gradle; then
      gradle check
    else
      printf 'Gradle is not available. Skipping lint/check.\n'
    fi
    ;;
  php)
    if have composer && grep -q '"lint"' composer.json 2>/dev/null; then
      composer lint
    elif have php; then
      php_syntax_check
    else
      printf 'No PHP lint command available. Skipping lint.\n'
    fi
    ;;
  python)
    if have ruff; then
      ruff check .
    elif have flake8; then
      flake8 .
    else
      printf 'No Python linter found. Skipping lint.\n'
    fi
    ;;
  infra)
    if have terraform; then
      terraform fmt -check -recursive
    elif have docker && [ -f docker-compose.yml ]; then
      docker compose -f docker-compose.yml config
    elif have docker && [ -f compose.yml ]; then
      docker compose -f compose.yml config
    else
      printf 'No infrastructure lint command available. Skipping lint.\n'
    fi
    ;;
  *)
    printf 'Unknown project type. No lint command selected.\n'
    ;;
esac
