# 🧭 Engineering Rules (YatraMitra)

Follow ALL rules strictly. Do NOT violate any rule.

## 🏗️ Architecture Rules
- Follow feature-based structure: `core/`, `features/`, `shared/`
- Enforce MVVM strictly: UI (View) → ViewModel → Repository → Service
- Separate UI, business logic, and data layers.
- Avoid large files (>300 lines).

## 🔄 State Management Rules (Riverpod)
- Use Riverpod ONLY.
- Use `AsyncNotifier` for async states.
- Use `AsyncValue` for loading/error/data states.
- Inject all dependencies via providers.
- No global mutable state.

## 🌐 Network Rules (Dio)
- Use centralized `DioClient`.
- Use interceptors for logging and error handling.
- Handle all HTTP status codes properly.

## 💾 Storage & Offline-First Rules
- Cache → API → Update cache.
- **Hive**: For structured/local cached data.
- **SharedPreferences**: Only for flags/settings.
- App must work without internet (graceful fallback).

## 🧩 Model Rules
- Models must be immutable.
- Use `fromJson`/`toJson`.
- No business logic inside models.

## 🎨 UI & Widget Rules
- UI must be minimal, high contrast, and accessible.
- No business logic inside widgets.
- Extract reusable widgets to `shared/widgets/`.

## 📦 Repository Rules
- Abstract data sources.
- Combine API + local storage logic.
- Return clean domain models.

## ⚠️ Error Handling Rules
- Use centralized error model (Failure/Result pattern).
- Handle errors in repository layer.

## 🛠️ Flutter Version Management (FVM)
- Use FVM for all commands: `fvm flutter run`, `fvm flutter pub get`.
- Do NOT use global Flutter SDK directly.
