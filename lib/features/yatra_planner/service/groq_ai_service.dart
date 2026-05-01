import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../model/yatra_plan.dart';

/// Service responsible for communicating with Groq AI to generate itineraries.
class GroqAiService {
  final DioClient _dioClient;
  final String _baseUrl = 'https://api.groq.com/openai/v1/chat/completions';
  final String _model = 'llama-3.3-70b-versatile';

  GroqAiService(this._dioClient);

  /// Generates a structured itinerary using Groq's JSON mode.
  Future<List<YatraDayPlan>> generateItinerary(YatraPlan plan) async {
    final apiKey = dotenv.env['GROQ_API_KEY'];
    if (apiKey == null || apiKey.isEmpty || apiKey == 'your_groq_api_key_here') {
      throw Exception('Groq API Key not configured in .env');
    }

    final prompt = _buildSystemPrompt(plan);
    final userMessage = _buildUserMessage(plan);

    try {
      final response = await _dioClient.post(
        _baseUrl,
        options: Options(headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': _model,
          'messages': [
            {'role': 'system', 'content': prompt},
            {'role': 'user', 'content': userMessage},
          ],
          'response_format': {'type': 'json_object'},
          'temperature': 0.7,
        },
      );

      final content = response.data['choices'][0]['message']['content'];
      final Map<String, dynamic> decoded = jsonDecode(content);
      
      // Expecting a JSON object with an 'itinerary' key containing a list of days
      final List<dynamic> daysJson = decoded['itinerary'];
      
      return daysJson.map((day) {
        // AI might return date as string, we need to handle it
        // Our model expects DateTime, so we'll pass the base date + day offset
        // or let the model's fromJson handle it if we adjust it.
        // For now, we'll manually fix the date if needed before mapping.
        final dayIndex = (day['dayNumber'] as int) - 1;
        final date = plan.startDate.add(Duration(days: dayIndex));
        
        return YatraDayPlan.fromJson({
          ...day,
          'date': date.toIso8601String(),
        });
      }).toList();
    } catch (e) {
      rethrow;
    }
  }

  String _buildSystemPrompt(YatraPlan plan) {
    return '''
You are "YatraMitra AI", a specialist travel planner for the Char Dham Yatra in Uttarakhand, India.
Your goal is to generate a highly realistic, safe, and localized day-wise itinerary for pilgrims.

### Constraints:
1. **Safety First**: Consider altitude sickness and trekking difficulty.
2. **Elderly Friendly**: If age group is 'Senior' or fitness is 'Low', include more rest periods.
3. **Localized Tips**: Provide specific tips for Darshan, local food, and transport (GMOU buses, share taxis).
4. **JSON Mode**: You MUST return a JSON object with exactly one key "itinerary", which is an array of objects.

### Each day object MUST have:
- dayNumber: (int)
- route: (string) e.g., "Haridwar to Barkot"
- distance: (string) e.g., "190 km"
- transport: (string) e.g., "Private Taxi"
- accommodation: (string) e.g., "Hotel Hill View"
- weather: (string) e.g., "Clear"
- crowdForecast: (string) e.g., "Moderate"
- aiTip: (string) A specific, helpful tip for this day.
- riskLevel: (string) "Low", "Moderate", or "High".

### User Preferences:
- Starting from: ${plan.startFrom}
- Dhams to cover: ${plan.dhamsToCover.join(', ')}
- Duration: ${plan.durationDays} days
- Age Group: ${plan.ageGroup}
- Fitness Level: ${plan.fitnessLevel}
- Budget: ${plan.budgetRange}
- Special Needs: ${plan.specialNeeds ?? 'None'}
''';
  }

  String _buildUserMessage(YatraPlan plan) {
    return 'Generate a ${plan.durationDays}-day itinerary for ${plan.dhamsToCover.join(' and ')} starting from ${plan.startFrom}.';
  }
}

/// Provider for GroqAiService
final groqAiServiceProvider = Provider<GroqAiService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return GroqAiService(dioClient);
});
