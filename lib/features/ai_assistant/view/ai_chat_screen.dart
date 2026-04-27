import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../viewmodel/ai_assistant_viewmodel.dart';
import '../model/chat_message.dart';

/// Screen for interacting with the AI Yatra Assistant.
/// Mandatory: Chat bubble interface, suggestions, and high contrast.
class AiChatScreen extends ConsumerStatefulWidget {
  final String? initialMessage;
  const AiChatScreen({super.key, this.initialMessage});

  @override
  ConsumerState<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends ConsumerState<AiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.initialMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(aiAssistantViewModelProvider.notifier).sendMessage(widget.initialMessage!);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(aiAssistantViewModelProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yatra Assistant'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_rounded),
            onPressed: () => ref.read(aiAssistantViewModelProvider.notifier).clearChat(),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: chatState.when(
              data: (messages) {
                _scrollToBottom();
                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return _ChatBubble(message: message);
                  },
                );
              },
              loading: () => const LoadingWidget(message: 'Initializing Assistant...'),
              error: (err, st) => AppErrorWidget(
                errorMessage: err.toString(),
                onRetry: () => ref.refresh(aiAssistantViewModelProvider),
              ),
            ),
          ),
          
          // Quick Suggestions
          const _QuickSuggestions(),
          
          // Input Area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ask about rituals, weather, etc...',
                    ),
                    onSubmitted: (val) {
                      ref.read(aiAssistantViewModelProvider.notifier).sendMessage(val);
                      _controller.clear();
                    },
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: theme.colorScheme.primary,
                  child: IconButton(
                    icon: const Icon(Icons.send_rounded, color: Colors.white),
                    onPressed: () {
                      ref.read(aiAssistantViewModelProvider.notifier).sendMessage(_controller.text);
                      _controller.clear();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isAi = message.role == MessageRole.ai;
    final theme = Theme.of(context);

    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        decoration: BoxDecoration(
          color: isAi ? theme.colorScheme.secondary.withAlpha(20) : theme.colorScheme.primary.withAlpha(20),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isAi ? 0 : 16),
            bottomRight: Radius.circular(isAi ? 16 : 0),
          ),
          border: Border.all(
            color: isAi ? theme.colorScheme.secondary.withAlpha(50) : theme.colorScheme.primary.withAlpha(50),
          ),
        ),
        child: Text(
          message.content,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _QuickSuggestions extends ConsumerWidget {
  const _QuickSuggestions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = [
      {'label': '🔱 Rituals', 'query': 'Tell me about rituals'},
      {'label': '🎒 Packing', 'query': 'What should I pack?'},
      {'label': '🚁 Helicopter', 'query': 'Helicopter booking info'},
      {'label': '👴 Senior Help', 'query': 'Help for senior citizens'},
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final s = suggestions[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ActionChip(
              label: Text(s['label']!),
              onPressed: () {
                ref.read(aiAssistantViewModelProvider.notifier).sendMessage(s['query']!);
              },
            ),
          );
        },
      ),
    );
  }
}
