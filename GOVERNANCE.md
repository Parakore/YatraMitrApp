# Project Governance ⚖️

This document outlines the rules for maintaining consistency across the YatraMitra codebase and documentation.

## 🛡️ Documentation Guardians
All developers are responsible for ensuring that documentation stays aligned with the code. If an architectural change is made, `ARCHITECTURE.md` must be updated in the same PR.

## 📋 Consistency Rules
- **Naming**: Use consistent naming across code, docs, and comments. (e.g., "Nearby Services" should always be referred to as such).
- **Structure**: Every feature MUST contain the 5 sub-folders (`view`, `viewmodel`, `model`, `repository`, `service`).

## 🚫 Enforcement
PRs that violate the architecture rules or have outdated documentation will be rejected. The goal is to maintain a production-grade, maintainable codebase at all times.
