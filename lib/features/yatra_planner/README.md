# Yatra Planner Feature

## Purpose
The Yatra Planner is a premium module designed to help pilgrims organize their Char Dham Yatra. It provides a focused interface for selecting destinations, planning dates, and generating AI-powered day-wise itineraries based on travel preferences.

## Flow Explanation
1. **Entry (Dashboard)**: User lands on the Planner Dashboard (Screen 1) showing their profile, planner card, and an overview of the AI workflow.
2. **Setup (Preferences)**: User enters the Yatra Preferences form to specify dates, duration, locations, age, fitness, and budget.
3. **AI Generation Workflow**: A visual 6-step workflow (Registration, Health, Route, Weather, Booking, Tracking) processes the preferences.
4. **Itinerary View**: A high-fidelity, day-wise itinerary is generated with risk levels, weather icons, and AI tips.
5. **Persistence**: Plans are saved to `yatra_plans_v2_box` via Hive for full offline access.

## Dependencies Used
- **Riverpod**: For state management.
- **Hive**: For offline-first persistence.
- **GoRouter**: For navigation.
- **Uuid**: For unique plan identification.

## Offline Behavior
- All plans and generated itineraries are stored locally using Hive.
- The itinerary generation logic is contained within the app, ensuring full functionality without an internet connection.
- Users can access their saved plans anytime, anywhere.
