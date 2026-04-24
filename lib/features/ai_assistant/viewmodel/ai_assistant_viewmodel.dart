import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/chat_message.dart';
import '../repository/ai_repository.dart';

/// Provider for the AI Assistant ViewModel.
final aiAssistantViewModelProvider = StateNotifierProvider<AiAssistantViewModel, AsyncValue<List<ChatMessage>>>((ref) {
  final repository = ref.watch(aiRepositoryProvider);
  return AiAssistantViewModel(repository);
});

/// ViewModel for managing the AI Chat state.
/// Mandatory: Using StateNotifier and AsyncValue.
class AiAssistantViewModel extends StateNotifier<AsyncValue<List<ChatMessage>>> {
  final AiRepository _repository;

  AiAssistantViewModel(this._repository) : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      await _repository.init();
      final history = _repository.getChatHistory();
      
      if (history.isEmpty) {
        // Add welcome message if history is empty
        await _repository.getAiResponse('hi'); // Trigger default welcome
      }
      
      state = AsyncValue.data(_repository.getChatHistory());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Sends a user message and fetches AI response.
  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    try {
      // Save and add user message to state immediately
      await _repository.saveUserMessage(content);
      state = AsyncValue.data(_repository.getChatHistory());

      // Get AI response
      await _repository.getAiResponse(content);
      
      // Update state with AI response
      state = AsyncValue.data(_repository.getChatHistory());
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Clears the chat history.
  Future<void> clearChat() async {
    await _repository.clearHistory();
    await _init();
  }
}
