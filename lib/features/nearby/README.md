# Nearby Facilities Locator (YatraMitra)

The Nearby Facilities Locator is a core feature of YatraMitra designed to help pilgrims find essential services such as Medical Camps, Toilets, ATMs, Food, and Police Posts in low-connectivity environments.

## Feature Purpose
- Provide real-time (and cached) information about nearby facilities.
- Integrate crowd intelligence to inform users about wait times and crowdedness.
- Ensure high accessibility for elderly users through high-contrast, large-font UI.
- Support offline usage through robust Hive caching.

## Architecture (MVVM)
- **View**: `NearbyScreen` - Premium UI with modular widgets.
- **ViewModel**: `NearbyViewModel` - Manages state and category filtering using Riverpod.
- **Model**: `NearbyPlace` - Immutable data model using Freezed.
- **Repository**: `NearbyRepository` - Coordinates API and local Hive cache.
- **Service**: `NearbyService` - Handles network communication (or mock data).

## Key Components
- **NearbyHeader**: Premium top section with search and crowd status.
- **CategorySelector**: Horizontal chip-based filtering.
- **FacilityCard**: Information-rich card with category-specific accents and directions.

## Offline Behavior
- **Caching**: The repository caches the latest facility list in Hive.
- **Graceful Fallback**: If the API call fails or the user is offline, the app automatically serves the cached data without crashing.
- **Hive Stabilization**: Uses a standardized `HiveService` to prevent type conflicts.

## Dependencies
- `flutter_riverpod` (State Management)
- `hive` & `hive_flutter` (Local Storage)
- `freezed` (Immutability)
- `dio` (Network)
