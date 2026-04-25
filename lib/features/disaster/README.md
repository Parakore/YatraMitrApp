# Disaster Intelligence System

## Purpose
The Disaster Intelligence System is a critical safety feature designed to provide pilgrims with actionable insights during their journey. It aggregates weather data, route status, and landslide risk information to help users make informed decisions: "Should I proceed, wait, or avoid travel?"

## Architecture
- **Model**: Immutable data structures using `freezed`.
- **Service**: `DisasterService` integrates with `WeatherService` to fetch real-time OpenWeather data for Char Dham locations (Kedarnath coordinates used as base).
- **Caching**: Local caching implemented via `Hive` (box: `disaster_intelligence`) with an offline-first approach.
- **Repository**: `DisasterRepository` provides a clean interface for the ViewModel.
- **ViewModel**: `DisasterIntelligenceViewModel` (Riverpod `AsyncNotifier`) handles polling/refreshing state.
- **View**: Premium, high-contrast UI designed for pilgrims and elderly users.

## Technical Details: Weather Integration
The system fetches weather data from OpenWeather for specific coordinates:
- **Base Coordinate**: Kedarnath (30.7346° N, 79.0669° E)
- **Forecast Logic**: Retrieves 5-day forecast data at 24-hour intervals to provide daily safety assessments.
- **Trek Status Mapping**: Automatically calculates trek safety (Proceed/Caution/Avoid) based on temperature, rainfall, and weather conditions.

## UI Design System
- **Contrast**: High-contrast text and icons for outdoor/low-light usability.
- **Gradients**: Premium dark-blue to saffron gradients for brand consistency.
- **Glassmorphism**: Subtle glassmorphism effects for route overview cards.
- **Status Pills**: Standardized color-coding (Success: Open, Warning: Caution, Error: Closed).

## Offline Behavior
- Displays cached data immediately upon entry.
- Uses `RefreshIndicator` for manual updates.
- Gracefully fallbacks to cache on API failures or network timeouts.

## Dependencies
- `flutter_riverpod`
- `dio` (via `WeatherService`)
- `hive`
- `freezed`
- `shimmer`
- `flutter_dotenv` (for API keys)
