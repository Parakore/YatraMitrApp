# Notifications Feature

## Purpose
Responsible for delivering real-time updates and weather alerts to pilgrims during their Yatra.

## Flow
`NotificationScreen` -> `NotificationViewModel` -> `NotificationModel`

## Dependencies
- `flutter_riverpod`
- `riverpod_annotation`
- `intl` (for timestamp formatting)

## Offline Behavior
- Grouped list view works with cached data.
- Graceful degradation if no new notifications are available.
