import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/notification_model.dart';

part 'notification_viewmodel.g.dart';

class NotificationState {
  final List<NotificationModel> today;
  final List<NotificationModel> yesterday;

  NotificationState({
    required this.today,
    required this.yesterday,
  });
}

@riverpod
class NotificationViewModel extends _$NotificationViewModel {
  @override
  FutureOr<NotificationState> build() async {
    // Simulated data
    final today = [
      NotificationModel(
        id: '1',
        title: 'Yatra Update:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 14)),
        type: NotificationType.update,
      ),
      NotificationModel(
        id: '2',
        title: 'Weather Alert:',
        message: 'All 4 Dhams are open for Darshan.', // Using screenshot text for consistency
        timestamp: DateTime.now().subtract(const Duration(minutes: 14)),
        type: NotificationType.weatherAlert,
      ),
      NotificationModel(
        id: '3',
        title: 'Weather Alert:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 14)),
        type: NotificationType.weatherAlert,
      ),
    ];

    final yesterday = [
      NotificationModel(
        id: '4',
        title: 'Yatra Update:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.update,
      ),
      NotificationModel(
        id: '5',
        title: 'Weather Alert:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.weatherAlert,
      ),
      NotificationModel(
        id: '6',
        title: 'Weather Alert:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.weatherAlert,
      ),
      NotificationModel(
        id: '7',
        title: 'Yatra Update:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.update,
      ),
      NotificationModel(
        id: '8',
        title: 'Yatra Update:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.update,
      ),
      NotificationModel(
        id: '9',
        title: 'Weather Alert:',
        message: 'All 4 Dhams are open for Darshan.',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.weatherAlert,
      ),
    ];

    return NotificationState(today: today, yesterday: yesterday);
  }
}
