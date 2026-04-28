enum ActivityCategory { mobility, strength, cardio, breathing }

enum ActivityIntensity { low, medium, high }

enum ActivityContentType { text, image, externalLink, externalVideo }

class ActivityTranslation {
  const ActivityTranslation({
    required this.languageCode,
    required this.title,
    required this.description,
    required this.instructions,
  });

  final String languageCode;
  final String title;
  final String description;
  final String instructions;

  ActivityTranslation copyWith({
    String? languageCode,
    String? title,
    String? description,
    String? instructions,
  }) {
    return ActivityTranslation(
      languageCode: languageCode ?? this.languageCode,
      title: title ?? this.title,
      description: description ?? this.description,
      instructions: instructions ?? this.instructions,
    );
  }
}

class Activity {
  const Activity({
    required this.stableId,
    required this.translations,
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
  final Map<String, ActivityTranslation> translations;
  final int suggestedDurationMinutes;
  final ActivityCategory category;
  final ActivityIntensity intensity;
  final ActivityContentType contentType;
  final String? url;
  final String? imagePath;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  String get titleEn => titleForLanguageCode('en');
  String get titlePt => titleForLanguageCode('pt');
  String get descriptionEn => descriptionForLanguageCode('en');
  String get descriptionPt => descriptionForLanguageCode('pt');
  String get instructionsEn => instructionsForLanguageCode('en');
  String get instructionsPt => instructionsForLanguageCode('pt');

  ActivityTranslation translationForLanguageCode(String languageCode) {
    return translations[languageCode] ??
        translations['en'] ??
        (translations.isEmpty ? null : translations.values.first) ??
        const ActivityTranslation(
          languageCode: 'en',
          title: '',
          description: '',
          instructions: '',
        );
  }

  String titleForLanguageCode(String languageCode) {
    return translationForLanguageCode(languageCode).title;
  }

  String descriptionForLanguageCode(String languageCode) {
    return translationForLanguageCode(languageCode).description;
  }

  String instructionsForLanguageCode(String languageCode) {
    return translationForLanguageCode(languageCode).instructions;
  }

  Activity copyWith({
    String? stableId,
    Map<String, ActivityTranslation>? translations,
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
      translations: translations ?? this.translations,
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
