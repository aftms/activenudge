import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../domain/entities/scheduled_reminder.dart';
import 'notification_service.dart';

class FlutterLocalNotificationService implements NotificationService {
  FlutterLocalNotificationService(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;

  @override
  Future<void> initialize({
    required void Function(String? payload) onNotificationTap,
  }) async {
    if (_initialized) {
      return;
    }
    tz_data.initializeTimeZones();
    const settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      windows: WindowsInitializationSettings(
        appName: 'ActiveNudge',
        appUserModelId: 'com.activenudge.activenudge',
        guid: '7e8dc1f1-8c67-4a77-8bf0-7b51bce9a6ad',
      ),
    );
    await _plugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (response) {
        onNotificationTap(response.payload);
      },
    );
    _initialized = true;
  }

  @override
  Future<void> cancelAll() async {
    try {
      await _plugin.cancelAll();
    } on UnsupportedError {
      return;
    }
  }

  @override
  Future<void> cancelReminder(int id) async {
    try {
      await _plugin.cancel(id: id);
    } on UnsupportedError {
      return;
    }
  }

  @override
  Future<bool> requestPermission() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return true;
    }
    return await android.requestNotificationsPermission() ?? true;
  }

  @override
  Future<void> scheduleReminder({
    required ScheduledReminder reminder,
    required String title,
    required String message,
    required String channelName,
    required String channelDescription,
    required bool playSound,
    required bool enableVibration,
  }) async {
    final details = NotificationDetails(
      android: AndroidNotificationDetails(
        'movement_reminders',
        channelName,
        channelDescription: channelDescription,
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        playSound: playSound,
        enableVibration: enableVibration,
      ),
      windows: WindowsNotificationDetails(
        subtitle: 'ActiveNudge',
        duration: WindowsNotificationDuration.short,
      ),
    );
    await _plugin.zonedSchedule(
      id: reminder.id,
      title: title,
      body: message,
      scheduledDate: tz.TZDateTime.from(reminder.scheduledAt, tz.local),
      notificationDetails: details,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: 'activity:${reminder.activityStableId}',
    );
  }
}
