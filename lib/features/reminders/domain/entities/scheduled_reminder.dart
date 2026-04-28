class ScheduledReminder {
  const ScheduledReminder({
    required this.id,
    required this.activityStableId,
    required this.scheduledAt,
  });

  final int id;
  final String activityStableId;
  final DateTime scheduledAt;
}
