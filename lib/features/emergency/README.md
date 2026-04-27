# Emergency SOS Feature 🚑

## Purpose
The Emergency SOS feature provides pilgrims with a high-reliability, one-tap trigger for rescue operations during life-threatening situations (Medical, Accident, Disaster). It is designed with tactical accessibility in mind, ensuring even panicked or elderly users can signal for help.

## Flow Explanation
1. **Trigger**: User holds the SOS button for 3 seconds.
2. **Signal**: Live location and pilgrim profile are auto-shared with disaster control rooms and medical agencies.
3. **Workflow**: The app tracks the rescue lifecycle: SOS Triggered → AI Classification → Unit Dispatched → Live Tracking → Treatment → Case Closure.
4. **Hotlines**: Quick access grid to emergency numbers like 112, SDRF, and local medical camps.

## Dependencies
- `flutter_riverpod`: State management for SOS lifecycle.
- `AnimationController`: Pulsing visual feedback.
- `StatusPill`: Visual consistency for incident status.

## Offline Behavior
- **Caching**: Recent SOS incidents are cached locally via Hive.
- **Graceful Degradation**: If offline, the app provides immediate tactical dialers (direct phone calls) which work over GSM even without data.
- **Delayed Sync**: SOS signals are queued for transmission once connectivity is restored (if possible).

---
*YatraMitra: Safety-First Design.*
