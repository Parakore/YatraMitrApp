# Disaster Intelligence System

## Purpose
The Disaster Intelligence System is a critical safety feature designed to provide pilgrims with actionable insights during their journey. It aggregates weather data, route status, and landslide risk information to help users make informed decisions: "Should I proceed, wait, or avoid travel?"

## Architecture
- **Model**: Immutable data structures using `freezed`.
- **Service**: `DisasterService` handles data fetching (mock for now) and local caching using `Hive`.
- **Repository**: `DisasterRepository` abstracts the data source.
- **ViewModel**: `DisasterIntelligenceViewModel` (Riverpod `AsyncNotifier`) manages the state.
- **View**: Responsive UI with specialized widgets for different data types.

## Key Features
- **Route Overview**: Real-time status of major Char Dham routes (Kedarnath, Badrinath, etc.).
- **AI Recommendation**: Short, actionable safety tips generated based on current conditions.
- **Active Alerts**: Priority warnings about landslides, heavy rain, or floods.
- **5-Day Forecast**: Intelligent weather outlook with "Trek Status" indicators.
- **Landslide Risk Zones**: Mapping of specific high-risk areas.
- **Route Closures**: Detailed tracking of path closures and estimated reopen times.

## Offline Behavior
- All data is cached locally using Hive.
- On launch, cached data is displayed immediately.
- A "Last Updated" timestamp is shown to inform the user about data freshness.
- Graceful degradation in case of network failure.

## Dependencies
- `flutter_riverpod`
- `riverpod_annotation`
- `hive`
- `freezed`
- `shimmer` (for loading states)
- `go_router`
