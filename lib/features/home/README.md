# Home Feature 🏠

The Home module serves as the central control center for the YatraMitra application, providing pilgrims with quick access to essential services and real-time safety information.

## Purpose
- Provide a clear, high-contrast dashboard for all users.
- Highlight critical safety information (Weather Alerts).
- Enable quick navigation to core features (SOS, Navigation, Medical).
- Provide information about the "Four Dhams" (Yamunotri, Gangotri, Kedarnath, Badrinath).

## Flow Explanation
1. **ViewModel initialization**: `HomeViewModel` fetches initial data (location, dhams, actions) and listens to the weather state.
2. **Dashboard UI**: The `HomeScreen` displays the data in a structured, responsive layout.
3. **User Interaction**: Tapping any action card navigates the user to the respective feature module via `GoRouter`.
4. **Emergency**: A persistent SOS button is always available for immediate access.

## Dependencies Used
- `flutter_riverpod`: State management.
- `go_router`: Navigation.
- `responsive`: Layout adaptation.

## Offline Behavior
- All static data (Dhams, Quick Actions, Travel Essentials) is stored locally.
- 3D icons and Dham images are bundled assets.
- Weather alerts are cached via the weather module's repository to ensure visibility even when offline.
