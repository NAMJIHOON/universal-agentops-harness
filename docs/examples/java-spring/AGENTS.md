# Java Spring AGENTS.md

## Stack Description

Java or Kotlin service using Spring Boot, Maven or Gradle, REST APIs, dependency injection, and environment-based configuration.

## Common Risks

- Breaking public REST contracts
- Changing transaction behavior
- Weakening validation or authorization
- Introducing N+1 queries
- Unsafe database migrations
- Misconfigured profiles or secrets

## Required Checks

- Run unit and integration tests where available.
- Run build with Maven or Gradle.
- Run static analysis or lint if configured.
- Verify migration scripts when data changes.

## Domain-Specific Rules

- Keep controllers thin and business logic in services.
- Preserve API response compatibility unless approved.
- Add tests for service behavior and controller contracts.
- Do not hardcode secrets or environment values.
- Review transaction boundaries for write paths.

## Recommended Verification Commands

```bash
./mvnw test
./mvnw package
./gradlew test
./gradlew build
```
