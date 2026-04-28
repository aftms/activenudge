abstract interface class PermissionService {
  Future<bool> requestNotifications();
  Future<bool> areNotificationsEnabled();
}
