# Yatra Planner Feature

## Purpose
The Yatra Planner is a premium module designed to help pilgrims organize their Char Dham Yatra. It provides a focused interface for selecting destinations, planning dates, and generating AI-powered day-wise itineraries based on travel preferences.

## Flow Explanation
1. **Entry (Dashboard)**: User lands on the Planner Dashboard showing their profile, planner card, and an overview of the AI workflow.
2. **Setup (Preferences)**: User enters the Yatra Preferences form to specify dates, duration, locations, age, fitness, and budget.
3. **AI Generation Workflow**: A visual 6-step workflow processes the preferences. The actual generation happens via the **Groq Cloud API** using the `llama3-70b-8192` model.
4. **Itinerary View**: A high-fidelity, day-wise itinerary is generated with risk levels, weather forecasts, and personalized AI tips.
5. **Persistence**: Plans are saved to `yatra_plans_v2_box` via Hive for full offline access.

## Dependencies Used
- **Riverpod**: For state management.
- **Groq Cloud API**: For high-speed AI itinerary generation.
- **Hive**: For offline-first persistence.
- **Dio**: For network communication.
- **Uuid**: For unique plan identification.

## Offline Behavior
- **Generation**: Requires an active internet connection to communicate with the Groq AI engine.
- **Access**: All generated plans and itineraries are stored locally using Hive. Once a plan is generated, it remains fully accessible without an internet connection.
- **Fallback**: If offline during generation, the app provides a graceful error message and allows the user to retry when back online.
