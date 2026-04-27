import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/dham_detail_model.dart';

part 'dham_detail_viewmodel.g.dart';

@riverpod
class DhamDetailViewModel extends _$DhamDetailViewModel {
  @override
  FutureOr<DhamDetailModel> build(String dhamId) async {
    // Simulate API fetch delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data based on the provided screenshot for Kedarnath
    if (dhamId.toLowerCase() == 'kedarnath') {
      return const DhamDetailModel(
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
        weather: WeatherSnapshot(
          temperature: '12°C',
          condition: 'Partly Cloudy',
          rainChance: 20,
          icon: Icons.cloud_queue_rounded,
        ),
        crowd: CrowdStatus(
          level: 'High',
          suggestedTime: 'Best before 8 AM',
          color: Colors.orange,
        ),
        heli: HelicopterDetails(
          priceRange: '₹2,500 - ₹8,000',
          duration: '20 Mins',
          bookingWarning: 'Book only from official sources to avoid fraud.',
          officialUrl: 'https://heliservices.uk.gov.in/',
        ),
        transports: [
          TransportInfo(
            title: 'By Air',
            description:
                'Jolly Grant Airport (Dehradun) is the nearest airport.',
            iconPath: 'assets/images/icons/transport_air.png',
            fallbackIcon: Icons.airplanemode_active_rounded,
          ),
          TransportInfo(
            title: 'By Rail',
            description: 'Rishikesh Railway Station is the nearest railhead.',
            iconPath: '', // Will use fallback
            fallbackIcon: Icons.train_rounded,
          ),
          TransportInfo(
            title: 'By Road',
            description: 'Gaurikund is the last motorable point for Kedarnath.',
            iconPath: '', // Will use fallback
            fallbackIcon: Icons.directions_bus_rounded,
          ),
        ],
        routeSteps: [
          RouteStep(
              name: 'Haridwar',
              distanceToNext: '25 KM',
              icon: Icons.location_on_rounded),
          RouteStep(
              name: 'Rishikesh',
              distanceToNext: '105 KM',
              icon: Icons.location_on_rounded),
          RouteStep(
              name: 'Guptkashi',
              distanceToNext: '30 KM',
              icon: Icons.location_on_rounded),
          RouteStep(
              name: 'Gaurikund',
              distanceToNext: '16 KM Trek',
              icon: Icons.directions_walk_rounded),
          RouteStep(name: 'Kedarnath', icon: Icons.temple_hindu_rounded),
        ],
        facilities: [
          Facility(
            name: 'Registration',
            iconPath: 'assets/images/icons/registration.png',
            fallbackIcon: Icons.assignment_ind_rounded,
            description: 'Check registration status.',
          ),
          Facility(
            name: 'Helicopter',
            iconPath: 'assets/images/icons/helicopter_booking.png',
            fallbackIcon: Icons.air,
            description: 'Book official heli services.',
          ),
          Facility(
            name: 'Stay',
            iconPath: 'assets/images/icons/stay.png',
            fallbackIcon: Icons.hotel_rounded,
            description: 'Find local accommodation.',
          ),
          Facility(
            name: 'SOS',
            iconPath: 'assets/images/icons/sos.png',
            fallbackIcon: Icons.emergency_rounded,
            description: 'Emergency support.',
          ),
          Facility(
            name: 'Route Map',
            iconPath: 'assets/images/icons/route_map.png',
            fallbackIcon: Icons.map_rounded,
            description: 'Detailed trek guide.',
          ),
        ],
        advisories: [
          SafetyAdvisory(
            title: '🔴 High Altitude Warning',
            message: 'Pilgrims with heart / lung issues must consult a doctor.',
          ),
          SafetyAdvisory(
            title: '🌧️ Weather Conditions',
            message:
                'The trek may be suspended during heavy rain or landslides.',
          ),
          SafetyAdvisory(
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
      weather: const WeatherSnapshot(
        temperature: '--',
        condition: 'Unknown',
        rainChance: 0,
        icon: Icons.wb_sunny_rounded,
      ),
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
