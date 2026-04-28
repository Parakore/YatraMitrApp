# Yatra Planner Feature

## Purpose
The Yatra Planner is a premium module designed to help pilgrims organize their Char Dham Yatra. It provides a focused interface for selecting destinations, planning dates, and generating AI-powered day-wise itineraries based on travel preferences.

## Flow Explanation
1. **Entry**: User clicks "AI Yatra Planner" on the Home Screen.
2. **Setup**: User selects a Dham and a date range.
3. **Preferences**: User configures transport mode (Trek, Helicopter, etc.) and travel pace (Easy, Moderate, Fast).
4. **AI Generation**: Clicking "Plan My Yatra with AI" triggers the local `ItineraryGenerator` to build a personalized schedule.
5. **Action**: Plan and its itinerary are saved locally using Hive for offline access.

## Dependencies Used
- **Riverpod**: For state management.
- **Hive**: For offline-first persistence.
- **GoRouter**: For navigation.
- **Uuid**: For unique plan identification.

## Offline Behavior
- All plans and generated itineraries are stored locally using Hive.
- The itinerary generation logic is contained within the app, ensuring full functionality without an internet connection.
- Users can access their saved plans anytime, anywhere.
