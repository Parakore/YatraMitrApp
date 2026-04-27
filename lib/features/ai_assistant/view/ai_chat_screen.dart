import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/error_widget.dart';
import '../../../shared/widgets/loading_widget.dart';
import '../viewmodel/ai_assistant_viewmodel.dart';
import '../model/chat_message.dart';

/// Highly refined premium AI Yatra Assistant chat screen.
/// Features glassmorphism-inspired bubbles, background textures, and sophisticated typography.
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
        ref
            .read(aiAssistantViewModelProvider.notifier)
            .sendMessage(widget.initialMessage!);
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: Column(
          children: [
            const Text(
              'YATRAMITRA AI',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'SYSTEM ONLINE',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Colors.white70),
            tooltip: 'Reset Chat',
            onPressed: () =>
                ref.read(aiAssistantViewModelProvider.notifier).clearChat(),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0D1B2A),
                Color(0xFF1A3A6B),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            height: 4,
            color: AppColors.saffron,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Texture/Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Image.network(
                'https://www.transparenttextures.com/patterns/cubes.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: chatState.when(
                  data: (messages) {
                    _scrollToBottom();
                    if (messages.isEmpty) return _buildWelcomeState();
                    return ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final message = messages[index];
                        return _ChatBubble(message: message);
                      },
                    );
                  },
                  loading: () =>
                      const LoadingWidget(message: 'Initializing AI Core...'),
                  error: (err, st) => AppErrorWidget(
                    errorMessage: err.toString(),
                    onRetry: () => ref.refresh(aiAssistantViewModelProvider),
                  ),
                ),
              ),

              // Quick Suggestions
              const _QuickSuggestions(),

              // Modern Input Area
              _buildInputArea(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 1),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.scale(
                  scale: value,
                  child: child,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.1),
                  width: 2,
                ),
              ),
              child: const Icon(
                Icons.auto_awesome_rounded,
                size: 64,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'MISSION COMMAND AI',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              'Your digital companion for a safe and spiritual Yatra journey. How can I assist you?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary.withOpacity(0.8),
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              onSubmitted: (val) {
                if (val.trim().isNotEmpty) {
                  ref
                      .read(aiAssistantViewModelProvider.notifier)
                      .sendMessage(val);
                  _controller.clear();
                }
              },
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              if (_controller.text.trim().isNotEmpty) {
                ref
                    .read(aiAssistantViewModelProvider.notifier)
                    .sendMessage(_controller.text);
                _controller.clear();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.saffron],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child:
                  const Icon(Icons.send_rounded, color: Colors.white, size: 20),
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

    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment:
              isAi ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (isAi) _buildAvatar(true),
                const SizedBox(width: 10),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: isAi
                          ? null
                          : const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.primary, AppColors.saffron],
                            ),
                      color: isAi ? Colors.white : null,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(18),
                        topRight: const Radius.circular(18),
                        bottomLeft: Radius.circular(isAi ? 4 : 18),
                        bottomRight: Radius.circular(isAi ? 18 : 4),
                      ),
                      border: isAi
                          ? Border.all(color: Colors.grey.shade100, width: 1.5)
                          : null,
                      boxShadow: [
                        BoxShadow(
                          color: isAi
                              ? Colors.black.withOpacity(0.04)
                              : AppColors.primary.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Text(
                      message.content,
                      style: TextStyle(
                        color: isAi ? AppColors.secondary : Colors.white,
                        fontSize: 14.5,
                        height: 1.6,
                        fontWeight: isAi ? FontWeight.w600 : FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                if (!isAi) _buildAvatar(false),
              ],
            ),
            const SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.only(
                left: isAi ? 54 : 0,
                right: isAi ? 0 : 54,
              ),
              child: Text(
                isAi ? 'YATRAMITRA AI • JUST NOW' : 'YOU • SENT',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textSecondary.withOpacity(0.5),
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(bool isAi) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:
            (isAi ? AppColors.secondary : AppColors.primary).withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color:
              (isAi ? AppColors.secondary : AppColors.primary).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Icon(
        isAi ? Icons.auto_awesome_rounded : Icons.person_rounded,
        color: isAi ? AppColors.secondary : AppColors.primary,
        size: 18,
      ),
    );
  }
}

class _QuickSuggestions extends ConsumerWidget {
  const _QuickSuggestions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestions = [
      {
        'label': '🔱 Rituals',
        'query': 'What are the main rituals at Kedarnath?'
      },
      {'label': '🎒 Packing', 'query': 'Essential packing list for the trek?'},
      {'label': '🚁 Helicopter', 'query': 'How to book official helicopter?'},
      {'label': '👴 Senior Help', 'query': 'Palki and assistance for seniors?'},
      {'label': '🌤️ Weather', 'query': 'Current weather and trek safety?'},
    ];

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final s = suggestions[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              elevation: 4,
              shadowColor: Colors.black12,
              child: InkWell(
                onTap: () {
                  ref
                      .read(aiAssistantViewModelProvider.notifier)
                      .sendMessage(s['query']!);
                },
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade100, width: 1),
                  ),
                  child: Text(
                    s['label']!,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w900,
                      color: AppColors.secondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
