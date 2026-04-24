class DisasterService {
  Future<List<Map<String, dynamic>>> fetchAlerts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      {
        'id': 'w1',
        'title': 'Heavy Rain Advisory',
        'message':
            'Intense precipitation expected near Rambara. High risk of slippery paths.',
        'severity': 'high',
        'type': 'Weather',
        'timestamp': DateTime.now().toIso8601String(),
        'location': 'Rambara to Kedarnath',
        'isLive': true,
      },
      {
        'id': 'l1',
        'title': 'Landslide Risk',
        'message': 'Minor rockfall detected near Sonprayag. Caution advised.',
        'severity': 'medium',
        'type': 'Landslide',
        'timestamp':
            DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
        'location': 'Sonprayag Sector',
        'isLive': true,
      },
    ];
  }

  Future<Map<String, dynamic>> fetchWeatherForecast() async {
    return {
      'currentTemp': '8°C',
      'condition': 'Cloudy',
      'humidity': '82%',
      'windSpeed': '12 km/h',
      'riskLevel': 'Low',
      'forecast': [
        {'time': '2 PM', 'temp': '10°C', 'icon': 'cloudy'},
        {'time': '5 PM', 'temp': '7°C', 'icon': 'rainy'},
        {'time': '8 PM', 'temp': '4°C', 'icon': 'rainy'},
      ]
    };
  }
}
