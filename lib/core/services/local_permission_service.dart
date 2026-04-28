import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'permission_service.dart';

class LocalPermissionService implements PermissionService {
  LocalPermissionService(this._plugin);

  final FlutterLocalNotificationsPlugin _plugin;

  @override
  Future<bool> areNotificationsEnabled() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return true;
    }
    return await android.areNotificationsEnabled() ?? true;
  }

  @override
  Future<bool> requestNotifications() async {
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android == null) {
      return true;
    }
    return await android.requestNotificationsPermission() ?? true;
  }
}
