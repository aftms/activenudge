import 'date_time_provider.dart';

class SystemDateTimeProvider implements DateTimeProvider {
  @override
  DateTime now() => DateTime.now();
}
