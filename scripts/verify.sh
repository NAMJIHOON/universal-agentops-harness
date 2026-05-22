#!/usr/bin/env bash
set -u

status=0

log() {
  printf '\n== %s ==\n' "$1"
}

have() {
  command -v "$1" >/dev/null 2>&1
}

run_required() {
  label="$1"
  shift
  log "$label"
  printf 'Command:'
  printf ' %s' "$@"
  printf '\n'
  if "$@"; then
    printf 'Result: PASS\n'
  else
    code=$?
    printf 'Result: FAIL (exit %s)\n' "$code"
    status=1
  fi
}

run_optional() {
  label="$1"
  shift
  log "$label"
  printf 'Command:'
  printf ' %s' "$@"
  printf '\n'
  if "$@"; then
    printf 'Result: PASS\n'
  else
    code=$?
    printf 'Result: OPTIONAL_FAIL (exit %s)\n' "$code"
  fi
}

node_pm() {
  if [ -f pnpm-lock.yaml ] && have pnpm; then
    echo "pnpm"
  elif [ -f yarn.lock ] && have yarn; then
    echo "yarn"
  elif have npm; then
    echo "npm"
  else
    echo ""
  fi
}

package_has_script() {
  script="$1"
  [ -f package.json ] && grep -Eq "\"$script\"[[:space:]]*:" package.json
}

run_node_script() {
  pm="$1"
  label="$2"
  script="$3"
  required="${4:-required}"

  if ! package_has_script "$script"; then
    printf 'No package script "%s" found. Skipping %s.\n' "$script" "$label"
    return 0
  fi

  case "$pm" in
    npm)
      cmd=(npm run "$script")
      ;;
    pnpm)
      cmd=(pnpm run "$script")
      ;;
    yarn)
      cmd=(yarn run "$script")
      ;;
    *)
      printf 'Unsupported package manager "%s". Skipping %s.\n' "$pm" "$label"
      return 0
      ;;
  esac

  if [ "$required" = "required" ]; then
    run_required "$label" "${cmd[@]}"
  else
    run_optional "$label" "${cmd[@]}"
  fi
}

maven_cmd() {
  if [ -x ./mvnw ]; then
    echo "./mvnw"
  elif have mvn; then
    echo "mvn"
  else
    echo ""
  fi
}

gradle_cmd() {
  if [ -x ./gradlew ]; then
    echo "./gradlew"
  elif have gradle; then
    echo "gradle"
  else
    echo ""
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

python_syntax_check() {
  py="$1"
  "$py" - <<'PY'
from pathlib import Path
import sys

skip_dirs = {
    ".git",
    ".hg",
    ".svn",
    ".venv",
    "venv",
    "env",
    "node_modules",
    "vendor",
    "__pycache__",
    "dist",
    "build",
}

found = False
failed = False

for path in Path(".").rglob("*.py"):
    if any(part in skip_dirs for part in path.parts):
        continue

    found = True
    try:
        source = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        source = path.read_text()

    try:
        compile(source, str(path), "exec")
    except SyntaxError as exc:
        print(f"{path}:{exc.lineno}:{exc.offset}: {exc.msg}")
        failed = True

if not found:
    print("No Python files found. Skipping syntax check.")

sys.exit(1 if failed else 0)
PY
}

project_type="$(dirname "$0")/detect-project.sh"
if [ -x "$project_type" ]; then
  detected="$("$project_type" .)"
else
  detected="unknown"
fi

log "Project Detection"
printf 'Detected type: %s\n' "$detected"

case "$detected" in
  node)
    pm="$(node_pm)"
    if [ -z "$pm" ]; then
      printf 'No supported Node package manager found. Skipping Node checks.\n'
    else
      run_node_script "$pm" "Type Check" "typecheck" optional
      run_node_script "$pm" "Build" "build" required
      run_node_script "$pm" "Test" "test" required
      run_node_script "$pm" "Lint" "lint" required
    fi
    ;;
  maven)
    cmd="$(maven_cmd)"
    if [ -z "$cmd" ]; then
      printf 'Maven is not available. Skipping Maven checks.\n'
    else
      run_required "Test" "$cmd" test
      run_required "Build" "$cmd" -DskipTests package
    fi
    ;;
  gradle)
    cmd="$(gradle_cmd)"
    if [ -z "$cmd" ]; then
      printf 'Gradle is not available. Skipping Gradle checks.\n'
    else
      run_required "Test" "$cmd" test
      run_required "Build" "$cmd" build
    fi
    ;;
  php)
    if have php; then
      log "PHP Syntax Check"
      if php_syntax_check; then
        printf 'Result: PASS\n'
      else
        printf 'Result: FAIL\n'
        status=1
      fi
    else
      printf 'PHP is not available. Skipping syntax checks.\n'
    fi
    if have composer; then
      run_optional "Composer Validate" composer validate --no-interaction
      if grep -q '"test"' composer.json 2>/dev/null; then
        run_required "Composer Test" composer test
      else
        printf 'No Composer test script found. Skipping composer test.\n'
      fi
    else
      printf 'Composer is not available. Skipping Composer checks.\n'
    fi
    ;;
  python)
    if have python3; then
      run_required "Python Syntax Check" python_syntax_check python3
    elif have python; then
      run_required "Python Syntax Check" python_syntax_check python
    else
      printf 'Python is not available. Skipping Python syntax checks.\n'
    fi
    if have pytest; then
      run_required "Pytest" pytest
    else
      printf 'pytest is not available. Skipping tests.\n'
    fi
    if have ruff; then
      run_required "Ruff" ruff check .
    elif have flake8; then
      run_required "Flake8" flake8 .
    else
      printf 'No Python linter found. Skipping lint.\n'
    fi
    if have mypy; then
      run_optional "Mypy" mypy .
    else
      printf 'mypy is not available. Skipping type check.\n'
    fi
    ;;
  infra)
    if have docker; then
      if [ -f docker-compose.yml ]; then
        run_required "Docker Compose Config" docker compose -f docker-compose.yml config
      elif [ -f compose.yml ]; then
        run_required "Docker Compose Config" docker compose -f compose.yml config
      else
        printf 'Dockerfile detected without compose file. Skipping compose config.\n'
      fi
    else
      printf 'Docker is not available. Skipping Docker checks.\n'
    fi
    if have terraform; then
      run_required "Terraform Format" terraform fmt -check -recursive
      run_required "Terraform Validate" terraform validate
    else
      printf 'Terraform is not available. Skipping Terraform checks.\n'
    fi
    ;;
  *)
    printf 'Unknown project type. Run project-specific build, test, and lint commands manually.\n'
    ;;
esac

log "Verification Summary"
if [ "$status" -eq 0 ]; then
  printf 'Overall result: PASS or skipped optional checks only\n'
else
  printf 'Overall result: FAIL\n'
fi

exit "$status"
