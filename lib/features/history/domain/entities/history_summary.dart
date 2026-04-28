class HistorySummary {
  const HistorySummary({
    required this.completedToday,
    required this.activeMinutesToday,
    required this.completionRate,
  });

  final int completedToday;
  final int activeMinutesToday;
  final double completionRate;
}
