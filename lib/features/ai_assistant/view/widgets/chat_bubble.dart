import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/chat_message.dart';

/// Individual chat bubble widget for AI and User messages.
/// Implements glassmorphism-inspired design with high contrast.
class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({super.key, required this.message});

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
                              ? Colors.black.withValues(alpha: 0.04)
                              : AppColors.primary.withValues(alpha: 0.2),
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
                  color: AppColors.textSecondary.withValues(alpha: 0.5),
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
        color: (isAi ? AppColors.secondary : AppColors.primary)
            .withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: (isAi ? AppColors.secondary : AppColors.primary)
              .withValues(alpha: 0.1),
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
