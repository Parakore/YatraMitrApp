import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/constants/app_constants.dart';
import '../../weather/repository/weather_repository.dart';
import '../../weather/utils/weather_utils.dart';
import '../model/dham_detail_model.dart';

part 'dham_detail_viewmodel.g.dart';

@riverpod
class DhamDetailViewModel extends _$DhamDetailViewModel {
  @override
  FutureOr<DhamDetailModel> build(String dhamId) async {
    final weatherRepo = ref.read(weatherRepositoryProvider);

    // Get coordinates for the dham
    double lat = AppConstants.kedarnathLat;
    double lon = AppConstants.kedarnathLon;
    String dhamName = 'Kedarnath';

    switch (dhamId.toLowerCase()) {
      case 'kedarnath':
        lat = AppConstants.kedarnathLat;
        lon = AppConstants.kedarnathLon;
        dhamName = 'Kedarnath';
        break;
      case 'badrinath':
        lat = AppConstants.badrinathLat;
        lon = AppConstants.badrinathLon;
        dhamName = 'Badrinath';
        break;
      case 'gangotri':
        lat = AppConstants.gangotriLat;
        lon = AppConstants.gangotriLon;
        dhamName = 'Gangotri';
        break;
      case 'yamunotri':
        lat = AppConstants.yamunotriLat;
        lon = AppConstants.yamunotriLon;
        dhamName = 'Yamunotri';
        break;
    }

    // Fetch live weather data
    WeatherSnapshot liveWeather;
    try {
      final intelligence = await weatherRepo.getWeatherIntelligence(
        lat: lat,
        lon: lon,
        locationName: dhamName,
      );

      liveWeather = WeatherSnapshot(
        temperature: '${intelligence.current.temperature.toStringAsFixed(0)}°C',
        condition: intelligence.current.condition,
        rainChance: (intelligence.current.rainfall * 10).toInt().clamp(0, 100),
        icon: WeatherUtils.getWeatherIcon(intelligence.current.condition),
      );
    } catch (e) {
      // Fallback if weather fetch fails and no cache exists
      liveWeather = const WeatherSnapshot(
        temperature: '--',
        condition: 'Unknown',
        rainChance: 0,
        icon: Icons.cloud_off_rounded,
      );
    }

    // Mock data based on the provided screenshot for Kedarnath
    if (dhamId.toLowerCase() == 'kedarnath') {
      return DhamDetailModel(
        id: 'kedarnath',
        name: 'Kedarnath Dham',
        openingDate: '22 April 2026',
        bestTime: 'May-June, Sept-Oct',
        altitude: '3,583 m (11,755 ft)',
        difficulty: 'Moderate - Tough',
        duration: '6-10 Hours (One Way)',
        trekDistance: '16 KM One Way',
        imageUrl: 'assets/images/dhams/kedarnath.png',
        status: DhamStatus.open,
        weather: liveWeather,
        crowd: const CrowdStatus(
          level: 'High',
          suggestedTime: 'Best before 8 AM',
          color: Colors.orange,
        ),
        heli: const HelicopterDetails(
          priceRange: '₹2,500 - ₹8,000',
          duration: '20 Mins',
          bookingWarning: 'Book only from official sources to avoid fraud.',
          officialUrl: 'https://heliservices.uk.gov.in/',
        ),
        transports: [
          const TransportInfo(
            title: 'By Air',
            description:
                'Jolly Grant Airport (Dehradun) is the nearest airport.',
            iconPath: 'assets/images/icons/transport_air.png',
            fallbackIcon: Icons.airplanemode_active_rounded,
          ),
          const TransportInfo(
            title: 'By Rail',
            description: 'Rishikesh Railway Station is the nearest railhead.',
            iconPath: '', // Will use fallback
            fallbackIcon: Icons.train_rounded,
          ),
          const TransportInfo(
            title: 'By Road',
            description: 'Gaurikund is the last motorable point for Kedarnath.',
            iconPath: '', // Will use fallback
            fallbackIcon: Icons.directions_bus_rounded,
          ),
        ],
        routeSteps: [
          const RouteStep(
              name: 'Haridwar',
              distanceToNext: '25 KM',
              icon: Icons.location_on_rounded),
          const RouteStep(
              name: 'Rishikesh',
              distanceToNext: '105 KM',
              icon: Icons.location_on_rounded),
          const RouteStep(
              name: 'Guptkashi',
              distanceToNext: '30 KM',
              icon: Icons.location_on_rounded),
          const RouteStep(
              name: 'Gaurikund',
              distanceToNext: '16 KM Trek',
              icon: Icons.directions_walk_rounded),
          const RouteStep(name: 'Kedarnath', icon: Icons.temple_hindu_rounded),
        ],
        facilities: [
          const Facility(
            name: 'Registration',
            iconPath: 'assets/images/icons/registration.png',
            fallbackIcon: Icons.assignment_ind_rounded,
            description: 'Check registration status.',
          ),
          const Facility(
            name: 'Helicopter',
            iconPath: 'assets/images/icons/helicopter_booking.png',
            fallbackIcon: Icons.air,
            description: 'Book official heli services.',
          ),
          const Facility(
            name: 'Stay',
            iconPath: 'assets/images/icons/stay.png',
            fallbackIcon: Icons.hotel_rounded,
            description: 'Find local accommodation.',
          ),
          const Facility(
            name: 'SOS',
            iconPath: 'assets/images/icons/sos.png',
            fallbackIcon: Icons.emergency_rounded,
            description: 'Emergency support.',
          ),
          const Facility(
            name: 'Route Map',
            iconPath: 'assets/images/icons/route_map.png',
            fallbackIcon: Icons.map_rounded,
            description: 'Detailed trek guide.',
          ),
        ],
        advisories: [
          const SafetyAdvisory(
            title: '🔴 High Altitude Warning',
            message: 'Pilgrims with heart / lung issues must consult a doctor.',
          ),
          const SafetyAdvisory(
            title: '🌧️ Weather Conditions',
            message:
                'The trek may be suspended during heavy rain or landslides.',
          ),
          const SafetyAdvisory(
            title: '⚠️ Fraud Awareness',
            message:
                'Only book via official government websites.\nDo not pay middlemen for registration.',
          ),
        ],
      );
    }

    // Fallback/Default for other Dhams
    return DhamDetailModel(
      id: dhamId,
      name: '${dhamId[0].toUpperCase()}${dhamId.substring(1)}',
      openingDate: 'Coming Soon',
      bestTime: 'May - Oct',
      altitude: '3,000m+',
      difficulty: 'Moderate',
      duration: 'Varies',
      trekDistance: 'Varies',
      imageUrl: 'assets/images/dhams/kedarnath.png', // Placeholder
      status: DhamStatus.open,
      weather: liveWeather,
      crowd: const CrowdStatus(
        level: 'Unknown',
        suggestedTime: 'N/A',
        color: Colors.grey,
      ),
      heli: const HelicopterDetails(
        priceRange: 'N/A',
        duration: 'N/A',
        bookingWarning: 'N/A',
        officialUrl: '',
      ),
      transports: [],
      routeSteps: [],
      facilities: [],
      advisories: [
        const SafetyAdvisory(
          title: '🔴 High Altitude Warning',
          message: 'Pilgrims with heart / lung issues must consult a doctor.',
        ),
        const SafetyAdvisory(
          title: '🌧️ Weather Conditions',
          message: 'The trek may be suspended during heavy rain or landslides.',
        ),
        const SafetyAdvisory(
          title: '⚠️ Fraud Awareness',
          message:
              'Only book via official government websites.\nDo not pay middlemen for registration.',
        ),
      ],
    );
  }
}

