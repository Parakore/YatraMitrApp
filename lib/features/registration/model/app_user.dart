import 'package:hive/hive.dart';

part 'app_user.g.dart';

/// Model representing a local application user.
/// This data is stored locally in Hive for offline-first profile management.
@HiveType(typeId: 3)
class AppUser extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String phone;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String idNumber; // Aadhaar or other ID

  @HiveField(4)
  final String emergencyContactName;

  @HiveField(5)
  final String emergencyContactPhone;

  @HiveField(6)
  final bool isRegistered;

  AppUser({
    required this.name,
    required this.phone,
    required this.age,
    required this.idNumber,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    this.isRegistered = false,
  });

  /// Factory for a guest user.
  factory AppUser.guest() => AppUser(
        name: 'Guest',
        phone: '',
        age: '',
        idNumber: '',
        emergencyContactName: '',
        emergencyContactPhone: '',
        isRegistered: false,
      );

  AppUser copyWith({
    String? name,
    String? phone,
    String? age,
    String? idNumber,
    String? emergencyContactName,
    String? emergencyContactPhone,
    bool? isRegistered,
  }) {
    return AppUser(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      idNumber: idNumber ?? this.idNumber,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone: emergencyContactPhone ?? this.emergencyContactPhone,
      isRegistered: isRegistered ?? this.isRegistered,
    );
  }
}
