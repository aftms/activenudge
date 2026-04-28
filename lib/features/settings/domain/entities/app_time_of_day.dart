class AppTimeOfDay {
  const AppTimeOfDay({required this.hour, required this.minute});

  final int hour;
  final int minute;

  bool get isValid => hour >= 0 && hour <= 23 && minute >= 0 && minute <= 59;

  int get minutesFromMidnight => hour * 60 + minute;

  AppTimeOfDay copyWith({int? hour, int? minute}) {
    return AppTimeOfDay(hour: hour ?? this.hour, minute: minute ?? this.minute);
  }
}
