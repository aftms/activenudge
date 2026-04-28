import 'package:isar_community/isar.dart';

import '../../domain/entities/activity.dart';

part 'activity_model.g.dart';

@collection
class ActivityModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String stableId;

  late String titleEn;
  late String titlePt;
  late String descriptionEn;
  late String descriptionPt;
  late String instructionsEn;
  late String instructionsPt;
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
      titleEn: titleEn,
      titlePt: titlePt,
      descriptionEn: descriptionEn,
      descriptionPt: descriptionPt,
      instructionsEn: instructionsEn,
      instructionsPt: instructionsPt,
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
      ..titleEn = activity.titleEn
      ..titlePt = activity.titlePt
      ..descriptionEn = activity.descriptionEn
      ..descriptionPt = activity.descriptionPt
      ..instructionsEn = activity.instructionsEn
      ..instructionsPt = activity.instructionsPt
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
