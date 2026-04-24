# 🌦️ Weather & Forecast Module

## Overview
The Weather & Forecast module provides pilgrims with real-time weather data and 5-day forecasts, combined with AI-powered safety recommendations. It uses the OpenWeather API to fetch granular data and translates it into actionable intelligence for safe travel during the Yatra.

## Architecture (MVVM)
- **Model**: Immutable data structures for Current Weather, Forecasts, and Weather Intelligence.
- **Service**: Dio-based client for fetching data from OpenWeather.
- **Repository**: Handles data orchestration, Hive caching, and intelligence logic.
- **ViewModel**: Riverpod `AsyncNotifier` managing state transitions (loading/data/error).
- **View**: Responsive, high-contrast UI for readability in various lighting conditions.

## Intelligence Logic
The system converts raw metrics into safety recommendations:
- **High Risk**: Rainfall > 20mm or Stormy condition → "Avoid travel".
- **Medium Risk**: Rainfall 5-20mm → "Proceed with caution".
- **Low Risk**: Clear/Cloudy → "Safe to proceed".

## Offline Support
- **Caching**: All intelligence data is cached in Hive.
- **Fallback**: If the network is unavailable, the system displays the last cached data with a warning.

## Dependencies
- `flutter_dotenv`: Secure API key management.
- `dio`: Networking.
- `flutter_riverpod`: State management.
- `hive`: Local persistence.
- `freezed`: Immutable models.
