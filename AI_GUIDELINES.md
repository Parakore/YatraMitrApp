# AI Behavior & Generation Guidelines 🤖

When generating code or documentation for YatraMitra, the following guidelines must be followed:

## 1. Complete Implementations
- Always generate the COMPLETE flow: Model → Service → Repository → ViewModel → UI.
- Do NOT provide partial snippets or placeholders like `// ... other code`.

## 2. Architecture Enforcement
- Strictly follow the MVVM pattern.
- Ensure all logic is in the ViewModel or Repository.
- Ensure UI is purely declarative and reactive.

## 3. State Management (Riverpod)
- Use `AsyncNotifier` for any logic involving asynchronous data.
- Ensure all providers are correctly defined and injected.
- Avoid legacy Riverpod syntax; prefer the generator-based syntax (`@riverpod`).

## 4. Documentation Awareness
- Read and respect `RULES.md` and `ARCHITECTURE.md`.
- Ensure all new classes and functions are documented with purpose and usage.

## 5. Offline-First Mandate
- Every data-driven feature must include a caching mechanism using Hive.
- Implement a fallback mechanism for when the device is offline.
