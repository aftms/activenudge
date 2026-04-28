import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/activities/data/models/activity_model.dart';
import '../../features/history/data/models/history_entry_model.dart';
import '../../features/settings/data/models/settings_model.dart';

class IsarDatabase {
  static Future<Isar> open() async {
    final directory = await getApplicationSupportDirectory();
    return Isar.open(
      <CollectionSchema<dynamic>>[
        ActivityModelSchema,
        SettingsModelSchema,
        HistoryEntryModelSchema,
      ],
      directory: directory.path,
      name: 'activenudge',
    );
  }
}
