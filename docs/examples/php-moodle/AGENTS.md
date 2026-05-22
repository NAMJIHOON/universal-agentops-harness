# PHP Moodle AGENTS.md

## Stack Description

PHP application or Moodle plugin using Moodle conventions, database access APIs, capability checks, and plugin upgrade flows.

## Common Risks

- Missing capability checks
- Direct database access that bypasses platform APIs
- Unsafe upgrade scripts
- Breaking plugin callbacks
- Incorrect language strings
- Exposure of personal learner data

## Required Checks

- Run PHP syntax checks on changed files.
- Run PHPUnit or Behat tests where available.
- Validate Moodle coding style if configured.
- Verify upgrade and rollback notes for database changes.

## Domain-Specific Rules

- Use Moodle APIs for database, permissions, output, and forms.
- Never expose personal data without capability checks.
- Keep plugin version and upgrade steps consistent.
- Preserve backward compatibility with existing plugin callbacks.

## Recommended Verification Commands

```bash
php -l path/to/changed.php
vendor/bin/phpunit
vendor/bin/phpcs
```
