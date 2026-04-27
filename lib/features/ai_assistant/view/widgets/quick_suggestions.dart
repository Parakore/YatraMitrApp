import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../viewmodel/ai_assistant_viewmodel.dart';

/// Horizontal list of quick suggested queries for the user.
class QuickSuggestions extends ConsumerWidget {
  const QuickSuggestions({super.key});

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
