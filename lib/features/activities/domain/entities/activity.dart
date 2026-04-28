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
}
