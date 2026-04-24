# YatraMitra 🧭

YatraMitra is a production-grade Flutter application designed for pilgrims and elderly users, focusing on safety, utility, and offline usability in low-network environments.

## 🚀 Getting Started

### Prerequisites
- [FVM](https://fvm.app/) (Flutter Version Management)
- Flutter SDK `3.41.7` (managed via FVM)

### Setup
1. Clone the repository.
2. Run `fvm use` to set the correct Flutter version.
3. Install dependencies:
   ```bash
   fvm flutter pub get
   ```
4. Generate code (Riverpod/Freezed/Hive):
   ```bash
   fvm flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. Run the app:
   ```bash
   fvm flutter run
   ```

## 🏗️ Architecture
The project follows a strict **MVVM (Model-View-ViewModel)** architecture with a feature-first structure.
Detailed info can be found in [ARCHITECTURE.md](file:///d:/Flutter%20Projects/Client's%20Project/YatraMitrApp/ARCHITECTURE.md).

## 🛠️ Tech Stack
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Local Storage**: [Hive](https://pub.dev/packages/hive) (Offline-first)
- **Settings**: [SharedPreferences](https://pub.dev/packages/shared_preferences)
- **Code Generation**: Freezed, JsonSerializable, Riverpod Generator

## 📜 Engineering Rules
Strict adherence to our [RULES.md](file:///d:/Flutter%20Projects/Client's%20Project/YatraMitrApp/RULES.md) is required for all contributions.
