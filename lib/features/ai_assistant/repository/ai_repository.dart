import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/chat_message.dart';
import '../service/ai_service.dart';

/// Provider for the AI Repository.
final aiRepositoryProvider = Provider((ref) {
  final service = ref.watch(aiServiceProvider);
  return AiRepository(service);
});

/// Repository for managing AI chat messages and caching.
/// Mandatory: Offline-first approach using Hive.
class AiRepository {
  final AiService _service;
  static const String _boxName = 'chat_messages';

  AiRepository(this._service);

  /// Initializes the Hive box for chat messages.
  Future<void> init() async {
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox(_boxName);
    }
  }

  /// Fetches cached chat history.
  List<ChatMessage> getChatHistory() {
    final box = Hive.box(_boxName);
    return box.values
        .map((e) => ChatMessage.fromJson(Map<String, dynamic>.from(e)))
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  /// Sends a message and gets a response from the AI.
  Future<ChatMessage> getAiResponse(String userQuery) async {
    final responseContent = await _service.getResponse(userQuery);
    
    final aiMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: responseContent,
      role: MessageRole.ai,
      timestamp: DateTime.now(),
    );

    await _saveMessage(aiMessage);
    return aiMessage;
  }

  /// Saves a message to the local cache.
  Future<void> saveUserMessage(String content) async {
    final message = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      role: MessageRole.user,
      timestamp: DateTime.now(),
    );
    await _saveMessage(message);
  }

  Future<void> _saveMessage(ChatMessage message) async {
    final box = Hive.box(_boxName);
    await box.add(message.toJson());
  }

  /// Clears chat history.
  Future<void> clearHistory() async {
    final box = Hive.box(_boxName);
    await box.clear();
  }
}
