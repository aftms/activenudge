import 'package:isar_community/isar.dart';

import '../../domain/entities/activity.dart';

part 'activity_model.g.dart';

@collection
class ActivityModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String stableId;

  late List<ActivityTranslationModel> translations;
  late int suggestedDurationMinutes;

  @enumerated
  late ActivityCategory category;

  @enumerated
  late ActivityIntensity intensity;

  @enumerated
  late ActivityContentType contentType;

  String? url;
  String? imagePath;
  late bool isActive;
  late DateTime createdAt;
  late DateTime updatedAt;

  Activity toEntity() {
    return Activity(
      stableId: stableId,
      translations: {
        for (final translation in translations)
          translation.languageCode: translation.toEntity(),
      },
      suggestedDurationMinutes: suggestedDurationMinutes,
      category: category,
      intensity: intensity,
      contentType: contentType,
      url: url,
      imagePath: imagePath,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static ActivityModel fromEntity(Activity activity) {
    return ActivityModel()
      ..stableId = activity.stableId
      ..translations = activity.translations.values
          .map(ActivityTranslationModel.fromEntity)
          .toList()
      ..suggestedDurationMinutes = activity.suggestedDurationMinutes
      ..category = activity.category
      ..intensity = activity.intensity
      ..contentType = activity.contentType
      ..url = activity.url
      ..imagePath = activity.imagePath
      ..isActive = activity.isActive
      ..createdAt = activity.createdAt
      ..updatedAt = activity.updatedAt;
  }
}

@embedded
class ActivityTranslationModel {
  late String languageCode;
  late String title;
  late String description;
  late String instructions;

  ActivityTranslation toEntity() {
    return ActivityTranslation(
      languageCode: languageCode,
      title: title,
      description: description,
      instructions: instructions,
    );
  }

  static ActivityTranslationModel fromEntity(ActivityTranslation translation) {
    return ActivityTranslationModel()
      ..languageCode = translation.languageCode
      ..title = translation.title
      ..description = translation.description
      ..instructions = translation.instructions;
  }
}
