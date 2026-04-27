# AI Assistant Feature

## Purpose
The AI Assistant (YatraMitra AI) provides pilgrims with a conversational safety companion and a spiritual guide. It uses an offline-first FAQ knowledge base to ensure users can access critical information even in low-network environments.

## Flow Explanation
1. **User Interaction**: Users input queries via the chat interface or select from quick suggestions.
2. **ViewModel Handling**: The `AiAssistantViewModel` manages the chat state and coordinates with the repository.
3. **Data Retrieval**: 
   - The `AiRepository` first checks the local `Hive` cache for historical messages.
   - For new queries, it attempts to get an AI response (either from a local service or API).
4. **UI Update**: The chat screen reacts to `AsyncValue` state changes, displaying messages as they arrive.

## Dependencies Used
- `flutter_riverpod`: State management.
- `hive`: Offline data persistence.
- `go_router`: Navigation.
- `dio`: API communication (via `DioClient`).

## Offline Behavior
- **Chat History**: All messages are cached in Hive and available offline.
- **Pre-loaded Knowledge**: The AI core contains an offline FAQ/knowledge base to handle common pilgrim queries without internet.
- **Graceful Degradation**: If the network is unavailable for external API calls, the system falls back to the local knowledge base or shows a connectivity error.
