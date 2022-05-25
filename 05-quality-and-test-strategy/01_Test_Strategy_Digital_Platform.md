# Test Strategy – Digital Platform

## 1. Objectives

- Provide a predictable quality level aligned with business risk appetite.
- Detect defects as early as possible using automated checks.
- Ensure that non-functional requirements are validated, not just functional happy paths.

## 2. Test Levels

1. Unit Tests
2. Component / API Tests
3. Integration Tests
4. End-to-End (E2E) Tests
5. Non-functional Tests (Performance, Security, Resilience)

## 3. Entry / Exit Criteria

For each test level we define clear entry and exit criteria. Examples:

- **API Test Entry**: All related unit tests pass; contracts defined; mocks available.
- **E2E Exit**: All critical user journeys automated; no open critical or high defects.

