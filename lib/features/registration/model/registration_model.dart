import 'package:flutter/material.dart';

/// Model representing a pilgrim's registration profile.
class RegistrationProfile {
  final String name;
  final String pilId;
  final bool isEkycVerified;
  final String maskedAadhaar;
  final int age;
  final String state;
  final String mobile;
  final int groupSize;
  final int healthScore;

  const RegistrationProfile({
    required this.name,
    required this.pilId,
    required this.isEkycVerified,
    required this.maskedAadhaar,
    required this.age,
    required this.state,
    required this.mobile,
    required this.groupSize,
    required this.healthScore,
  });

  factory RegistrationProfile.fromJson(Map<String, dynamic> json) {
    return RegistrationProfile(
      name: json['name'] as String,
      pilId: json['pilId'] as String,
      isEkycVerified: json['isEkycVerified'] as bool,
      maskedAadhaar: json['maskedAadhaar'] as String,
      age: json['age'] as int,
      state: json['state'] as String,
      mobile: json['mobile'] as String,
      groupSize: json['groupSize'] as int,
      healthScore: json['healthScore'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pilId': pilId,
      'isEkycVerified': isEkycVerified,
      'maskedAadhaar': maskedAadhaar,
      'age': age,
      'state': state,
      'mobile': mobile,
      'groupSize': groupSize,
      'healthScore': healthScore,
    };
  }
}

/// Model representing yatra-specific registration details.
class YatraDetails {
  final String registrationId;
  final String yatraType;
  final String registrationDate;
  final String yatraStartDate;
  final String status;
  final String guideName;
  final String guideId;

  const YatraDetails({
    required this.registrationId,
    required this.yatraType,
    required this.registrationDate,
    required this.yatraStartDate,
    required this.status,
    required this.guideName,
    required this.guideId,
  });

  factory YatraDetails.fromJson(Map<String, dynamic> json) {
    return YatraDetails(
      registrationId: json['registrationId'] as String,
      yatraType: json['yatraType'] as String,
      registrationDate: json['registrationDate'] as String,
      yatraStartDate: json['yatraStartDate'] as String,
      status: json['status'] as String,
      guideName: json['guideName'] as String,
      guideId: json['guideId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'registrationId': registrationId,
      'yatraType': yatraType,
      'registrationDate': registrationDate,
      'yatraStartDate': yatraStartDate,
      'status': status,
      'guideName': guideName,
      'guideId': guideId,
    };
  }
}

/// Model representing health certificate and risk profile.
class HealthRiskProfile {
  final int score;
  final String riskCategory;
  final String riskDescription;
  final List<String> vitals;
  final String validity;
  final String issuedBy;
  final String certificateId;

  const HealthRiskProfile({
    required this.score,
    required this.riskCategory,
    required this.riskDescription,
    required this.vitals,
    required this.validity,
    required this.issuedBy,
    required this.certificateId,
  });

  factory HealthRiskProfile.fromJson(Map<String, dynamic> json) {
    return HealthRiskProfile(
      score: json['score'] as int,
      riskCategory: json['riskCategory'] as String,
      riskDescription: json['riskDescription'] as String,
      vitals: List<String>.from(json['vitals'] as List),
      validity: json['validity'] as String,
      issuedBy: json['issuedBy'] as String,
      certificateId: json['certificateId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'riskCategory': riskCategory,
      'riskDescription': riskDescription,
      'vitals': vitals,
      'validity': validity,
      'issuedBy': issuedBy,
      'certificateId': certificateId,
    };
  }
}

/// Wrapper for the complete registration dashboard state.
class RegistrationDashboardModel {
  final RegistrationProfile profile;
  final YatraDetails yatraDetails;
  final HealthRiskProfile healthProfile;

  const RegistrationDashboardModel({
    required this.profile,
    required this.yatraDetails,
    required this.healthProfile,
  });
}
