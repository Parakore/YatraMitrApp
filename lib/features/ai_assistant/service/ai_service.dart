import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the AI Service.
final aiServiceProvider = Provider((ref) => AiService());

/// Service for handling AI Assistant logic.
/// Mandatory: Structured responses with emojis and clear sections.
class AiService {
  final Map<String, String> _faqResponses = {
    'rituals': '''
🙏 **Holy Rituals & Timings**

✅ **Morning Puja**: Starts at 4:30 AM.
✅ **Evening Aarti**: 6:30 PM (Highly recommended).
✅ **Darshan**: General darshan starts from 6:00 AM.

⚠️ **Note**: Please maintain silence and follow temple rules. Wear traditional attire if possible.
''',
    'packing': '''
🎒 **Essential Packing List**

🧥 **Clothing**: Heavy woolens, thermals, and a windcheater.
👟 **Footwear**: Sturdy trekking shoes with good grip.
💊 **Medical Kit**: Band-aids, painkillers, and altitude sickness meds.
☔ **Rain Gear**: A lightweight poncho or umbrella.
🔋 **Power**: Fully charged power bank (Cold drains battery fast).
''',
    'helicopter': '''
🚁 **Helicopter Services**

📍 **Booking**: Only through official IRCTC website.
📍 **Departure**: From Phata, Sirsi, or Guptkashi.
📍 **Weight Limit**: Maximum 80kg per person (extra charges apply).

⚠️ **Alert**: Be wary of fake websites and agents.
''',
    'senior help': '''
👴 **Senior Citizen Assistance**

✅ **Palki/Kandi**: Available at the base for comfortable transport.
✅ **Oxygen**: Emergency oxygen cylinders available at every 2km.
✅ **Priority**: Mention age for priority darshan queues.

📞 **Emergency**: Contact any volunteer with a "YatraMitra" badge.
''',
    'weather': '''
⛅ **Current Weather Forecast**

🌡️ **Day**: 10°C - 15°C (Sunny)
🌡️ **Night**: -2°C - 4°C (Very Cold)

⚠️ **Warning**: Weather changes rapidly. Always carry a jacket even if it looks sunny.
''',
    'altitude sickness': '''
🤢 **Dealing with Altitude Sickness**

1️⃣ **Hydrate**: Drink plenty of water.
2️⃣ **Ascend Slowly**: Don't rush the trek.
3️⃣ **Symptoms**: Headache, nausea, or dizziness.
4️⃣ **Action**: If symptoms persist, descend immediately.

💊 **Meds**: Consult a doctor for Acetazolamide (Diamox).
''',
  };

  /// Generates a structured response based on the user query.
  Future<String> getResponse(String query) async {
    // Simulate network delay for "AI feel"
    await Future.delayed(const Duration(seconds: 1));

    final normalizedQuery = query.toLowerCase();

    if (normalizedQuery.contains('ritual')) {
      return _faqResponses['rituals']!;
    }
    if (normalizedQuery.contains('pack')) {
      return _faqResponses['packing']!;
    }
    if (normalizedQuery.contains('helicopter')) {
      return _faqResponses['helicopter']!;
    }
    if (normalizedQuery.contains('senior') || normalizedQuery.contains('elder')) {
      return _faqResponses['senior help']!;
    }
    if (normalizedQuery.contains('weather')) {
      return _faqResponses['weather']!;
    }
    if (normalizedQuery.contains('altitude') ||
        normalizedQuery.contains('sickness')) {
      return _faqResponses['altitude sickness']!;
    }

    return '''
🙏 **Namaste! I am YatraMitra, your holy guide.**

I can help you with:
🔱 **Rituals** & Timings
🎒 **Packing** Essentials
🚁 **Helicopter** Info
👴 **Senior** Citizen Help
⛅ **Weather** & Safety

*Please try asking one of the topics above!*
''';
  }
}
