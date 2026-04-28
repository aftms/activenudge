enum ActivityCategory { mobility, strength, cardio, breathing }

enum ActivityIntensity { low, medium, high }

enum ActivityContentType { text, image, externalLink, externalVideo }

class Activity {
  const Activity({
    required this.stableId,
    required this.titleEn,
    required this.titlePt,
    required this.descriptionEn,
    required this.descriptionPt,
    required this.instructionsEn,
    required this.instructionsPt,
    required this.suggestedDurationMinutes,
    required this.category,
    required this.intensity,
    required this.contentType,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.url,
    this.imagePath,
  });

  final String stableId;
  final String titleEn;
  final String titlePt;
  final String descriptionEn;
  final String descriptionPt;
  final String instructionsEn;
  final String instructionsPt;
  final int suggestedDurationMinutes;
  final ActivityCategory category;
  final ActivityIntensity intensity;
  final ActivityContentType contentType;
  final String? url;
  final String? imagePath;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  String titleForLanguageCode(String languageCode) {
    return languageCode == 'pt' ? titlePt : titleEn;
  }

  String descriptionForLanguageCode(String languageCode) {
    return languageCode == 'pt' ? descriptionPt : descriptionEn;
  }

  String instructionsForLanguageCode(String languageCode) {
    return languageCode == 'pt' ? instructionsPt : instructionsEn;
  }

  Activity copyWith({
    String? stableId,
    String? titleEn,
    String? titlePt,
    String? descriptionEn,
    String? descriptionPt,
    String? instructionsEn,
    String? instructionsPt,
    int? suggestedDurationMinutes,
    ActivityCategory? category,
    ActivityIntensity? intensity,
    ActivityContentType? contentType,
    String? url,
    String? imagePath,
    bool clearUrl = false,
    bool clearImagePath = false,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Activity(
      stableId: stableId ?? this.stableId,
      titleEn: titleEn ?? this.titleEn,
      titlePt: titlePt ?? this.titlePt,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionPt: descriptionPt ?? this.descriptionPt,
      instructionsEn: instructionsEn ?? this.instructionsEn,
      instructionsPt: instructionsPt ?? this.instructionsPt,
      suggestedDurationMinutes:
          suggestedDurationMinutes ?? this.suggestedDurationMinutes,
      category: category ?? this.category,
      intensity: intensity ?? this.intensity,
      contentType: contentType ?? this.contentType,
      url: clearUrl ? null : url ?? this.url,
      imagePath: clearImagePath ? null : imagePath ?? this.imagePath,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
