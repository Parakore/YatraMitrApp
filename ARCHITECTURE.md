# System Architecture 🏗️

YatraMitra follows a strict **MVVM (Model-View-ViewModel)** pattern organized by **features**.

## 📂 Project Structure

```text
lib/
├── core/               # Global configurations, theme, and network
├── shared/             # Reusable widgets and providers
└── features/           # Independent modules
    └── feature_name/
        ├── model/      # Data models
        ├── service/    # API and Local Storage logic
        ├── repository/ # Data abstraction layer
        ├── viewmodel/  # Business logic (Riverpod)
        └── view/       # UI components

## 🧠 Smart Intelligence Modules

1. **Crowd & Traffic**: Real-time density monitoring and wait-time prediction using heuristic models.
2. **Disaster System**: Multi-hazard alert system (Weather/Landslide) with location-based risk mapping.
3. **Emergency SOS**: Accessibility-first SOS trigger with rescue workflow tracking and incident history.
4. **AI Assistant**: Conversational safety companion with offline-first FAQ knowledge base.
5. **Weather & Forecast**: Real-time OpenWeather integration with AI-powered safety recommendations.
```

## 🔄 Data Flow

1. **View**: User interacts with the UI. The View listens to the ViewModel.
2. **ViewModel**: Handles user input and manages state using Riverpod. It requests data from the Repository.
3. **Repository**: Coordinates between different data sources (API vs. Cache). It ensures an offline-first experience.
4. **Service**: Performs the actual data fetching (Dio for API, Hive for Local Storage).

## 💾 Storage Strategy (Offline-First)

The application prioritizes offline availability:
1. Try to fetch from **Hive cache**.
2. Fetch from **API** in the background or if cache is empty/stale.
3. Update **Hive cache** with new data.
4. Emit the latest data to the UI.

## ⚡ State Management

We use **Riverpod** exclusively:
- `AsyncNotifier` for complex asynchronous states.
- `AsyncValue` to handle loading, error, and data states in the UI consistently.
- Dependency Injection via Providers.
