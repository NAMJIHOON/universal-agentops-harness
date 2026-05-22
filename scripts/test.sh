#!/usr/bin/env bash
set -u

have() {
  command -v "$1" >/dev/null 2>&1
}

package_has_script() {
  script="$1"
  [ -f package.json ] && grep -Eq "\"$script\"[[:space:]]*:" package.json
}

run_node_test() {
  if ! package_has_script "test"; then
    printf 'No package script "test" found. Skipping tests.\n'
  elif [ -f pnpm-lock.yaml ] && have pnpm; then
    pnpm run test
  elif [ -f yarn.lock ] && have yarn; then
    yarn test
  elif have npm; then
    npm test
  else
    printf 'No supported Node package manager found. Skipping tests.\n'
  fi
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
    run_node_test
    ;;
  maven)
    if [ -x ./mvnw ]; then
      ./mvnw test
    elif have mvn; then
      mvn test
    else
      printf 'Maven is not available. Skipping tests.\n'
    fi
    ;;
  gradle)
    if [ -x ./gradlew ]; then
      ./gradlew test
    elif have gradle; then
      gradle test
    else
      printf 'Gradle is not available. Skipping tests.\n'
    fi
    ;;
  php)
    if have composer && grep -q '"test"' composer.json 2>/dev/null; then
      composer test
    elif [ -x vendor/bin/phpunit ]; then
      vendor/bin/phpunit
    else
      printf 'No PHP test command available. Skipping tests.\n'
    fi
    ;;
  python)
    if have pytest; then
      pytest
    elif have python3; then
      python3 -m unittest discover
    elif have python; then
      python -m unittest discover
    else
      printf 'No Python test command available. Skipping tests.\n'
    fi
    ;;
  infra)
    printf 'Infrastructure repositories usually require plan or dry-run checks. Use ./scripts/verify.sh or project-specific commands.\n'
    ;;
  *)
    printf 'Unknown project type. No test command selected.\n'
    ;;
esac
