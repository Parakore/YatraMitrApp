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

## ✨ Key Features
- 👥 **Crowd Intelligence**: Real-time density monitoring and predictive wait times for shrines.
- ⚖️ **Grievance Redressal**: Geo-evidence based complaint system with 5-step SLA tracking and photo upload.
- 🆘 **Emergency SOS**: Accessibility-first SOS with rescue workflow management.
- 🤖 **AI Assistant**: Offline-first conversational companion for pilgrim safety.
- 🗺️ **Offline Navigation**: Optimized routes with local caching for low-network zones.
- 🌦️ **Weather Forecast**: Accurate updates with AI safety advisories.

## 🛠️ Tech Stack
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **Local Storage**: [Hive](https://pub.dev/packages/hive) (Offline-first)
- **Settings**: [SharedPreferences](https://pub.dev/packages/shared_preferences)
- **Code Generation**: Freezed, JsonSerializable, Riverpod Generator
- **Permissions**: permission_handler
- **Media**: image_picker

## 📜 Engineering Rules
Strict adherence to our [RULES.md](file:///d:/Flutter%20Projects/Client's%20Project/YatraMitrApp/RULES.md) is required for all contributions.
