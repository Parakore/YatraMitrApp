# Contributing to YatraMitra 🤝

We welcome contributions! To maintain code quality and architectural integrity, please follow these guidelines.

## 🌿 Branching Strategy
- `main`: Production-ready code.
- `develop`: Integration branch for new features.
- `feature/[name]`: New feature development.
- `fix/[name]`: Bug fixes.

## 🛠️ Workflow
1. Create a branch from `develop`.
2. Implement your changes following the [RULES.md](file:///d:/Flutter%20Projects/Client's%20Project/YatraMitrApp/RULES.md).
3. Ensure all code generation is up to date:
   ```bash
   fvm flutter pub run build_runner build
   ```
4. Run tests and static analysis:
   ```bash
   fvm flutter analyze
   fvm flutter test
   ```
5. Submit a Pull Request to `develop`.

## ✅ PR Checklist
- [ ] Code follows MVVM architecture.
- [ ] Documentation updated (`README.md`, etc. if applicable).
- [ ] Feature structure follows the mandated folder hierarchy.
- [ ] Comments added for complex logic.
- [ ] All tests pass.
