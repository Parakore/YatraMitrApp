import 'package:freezed_annotation/freezed_annotation.dart';

part 'disaster_alert.freezed.dart';
part 'disaster_alert.g.dart';

@freezed
class DisasterAlert with _$DisasterAlert {
  const factory DisasterAlert({
    required String id,
    required String title,
    required String message,
    required AlertSeverity severity,
    required String type,
    required DateTime timestamp,
    @Default('Route 1') String location,
    @Default(true) bool isLive,
  }) = _DisasterAlert;

  factory DisasterAlert.fromJson(Map<String, dynamic> json) => _$DisasterAlertFromJson(json);
}

enum AlertSeverity { low, medium, high }
