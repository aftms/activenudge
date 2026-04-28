import '../domain/entities/scheduled_reminder.dart';

abstract interface class NotificationService {
  Future<void> initialize({
    required void Function(String? payload) onNotificationTap,
  });

  Future<bool> requestPermission();

  Future<void> scheduleReminder({
    required ScheduledReminder reminder,
    required String title,
    required String message,
    required String channelName,
    required String channelDescription,
    required bool playSound,
    required bool enableVibration,
  });

  Future<void> cancelReminder(int id);
  Future<void> cancelAll();
}
