import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/time/date_time_provider.dart';
import '../domain/entities/activity.dart';
import 'activity_image_service.dart';

class ActivityDraft {
  const ActivityDraft({
    required this.translations,
    required this.suggestedDurationMinutes,
    required this.category,
    required this.intensity,
    required this.contentType,
    required this.isActive,
    this.url,
    this.imagePath,
  });

  factory ActivityDraft.empty() {
    return const ActivityDraft(
      translations: <String, ActivityTranslation>{},
      suggestedDurationMinutes: 5,
      category: ActivityCategory.mobility,
      intensity: ActivityIntensity.low,
      contentType: ActivityContentType.text,
      isActive: true,
    );
  }

  factory ActivityDraft.fromActivity(Activity activity) {
    return ActivityDraft(
      translations: activity.translations,
      suggestedDurationMinutes: activity.suggestedDurationMinutes,
      category: activity.category,
      intensity: activity.intensity,
      contentType: activity.contentType,
      url: activity.url,
      imagePath: activity.imagePath,
      isActive: activity.isActive,
    );
  }

  final Map<String, ActivityTranslation> translations;
  final int suggestedDurationMinutes;
  final ActivityCategory category;
  final ActivityIntensity intensity;
  final ActivityContentType contentType;
  final String? url;
  final String? imagePath;
  final bool isActive;

  ActivityTranslation translationForLanguageCode(String languageCode) {
    return translations[languageCode] ??
        const ActivityTranslation(
          languageCode: 'en',
          title: '',
          description: '',
          instructions: '',
        );
  }

  ActivityDraft withTranslation({
    required String languageCode,
    String? title,
    String? description,
    String? instructions,
  }) {
    final current = translationForLanguageCode(languageCode);
    return copyWith(
      translations: <String, ActivityTranslation>{
        ...translations,
        languageCode: ActivityTranslation(
          languageCode: languageCode,
          title: title ?? current.title,
          description: description ?? current.description,
          instructions: instructions ?? current.instructions,
        ),
      },
    );
  }

  ActivityDraft copyWith({
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
  }) {
    return ActivityDraft(
      translations: translations ?? this.translations,
      suggestedDurationMinutes:
          suggestedDurationMinutes ?? this.suggestedDurationMinutes,
      category: category ?? this.category,
      intensity: intensity ?? this.intensity,
      contentType: contentType ?? this.contentType,
      url: clearUrl ? null : url ?? this.url,
      imagePath: clearImagePath ? null : imagePath ?? this.imagePath,
      isActive: isActive ?? this.isActive,
    );
  }
}

enum ActivityEditorError {
  titleRequired,
  durationMustBePositive,
  urlInvalid,
  imageRequired,
}

class ActivityEditorController {
  ActivityEditorController({
    required Ref ref,
    required DateTimeProvider dateTimeProvider,
    required ActivityImageService imageService,
  }) : _ref = ref,
       _dateTimeProvider = dateTimeProvider,
       _imageService = imageService;

  final Ref _ref;
  final DateTimeProvider _dateTimeProvider;
  final ActivityImageService _imageService;

  Future<String?> pickImage() => _imageService.pickAndStoreImage();

  List<ActivityEditorError> validate(
    ActivityDraft draft, {
    required String languageCode,
  }) {
    final errors = <ActivityEditorError>[];
    if (draft.translationForLanguageCode(languageCode).title.trim().isEmpty) {
      errors.add(ActivityEditorError.titleRequired);
    }
    if (draft.suggestedDurationMinutes <= 0) {
      errors.add(ActivityEditorError.durationMustBePositive);
    }
    if ((draft.contentType == ActivityContentType.externalLink ||
            draft.contentType == ActivityContentType.externalVideo) &&
        !_isValidUrl(draft.url)) {
      errors.add(ActivityEditorError.urlInvalid);
    }
    if (draft.contentType == ActivityContentType.image &&
        (draft.imagePath == null || draft.imagePath!.trim().isEmpty)) {
      errors.add(ActivityEditorError.imageRequired);
    }
    return errors;
  }

  Future<List<ActivityEditorError>> save({
    required ActivityDraft draft,
    required String languageCode,
    Activity? existing,
  }) async {
    final errors = validate(draft, languageCode: languageCode);
    if (errors.isNotEmpty) {
      return errors;
    }

    final now = _dateTimeProvider.now();
    final currentTranslation = draft.translationForLanguageCode(languageCode);
    final translations = <String, ActivityTranslation>{
      ...?existing?.translations,
      ...draft.translations,
      languageCode: ActivityTranslation(
        languageCode: languageCode,
        title: currentTranslation.title.trim(),
        description: currentTranslation.description.trim(),
        instructions: currentTranslation.instructions.trim(),
      ),
    };
    translations.removeWhere(
      (key, value) =>
          value.title.trim().isEmpty &&
          value.description.trim().isEmpty &&
          value.instructions.trim().isEmpty,
    );

    final activity = Activity(
      stableId:
          existing?.stableId ?? _createStableId(currentTranslation.title, now),
      translations: translations,
      suggestedDurationMinutes: draft.suggestedDurationMinutes,
      category: draft.category,
      intensity: draft.intensity,
      contentType: draft.contentType,
      url: draft.url?.trim().isEmpty ?? true ? null : draft.url!.trim(),
      imagePath: draft.imagePath?.trim().isEmpty ?? true
          ? null
          : draft.imagePath,
      isActive: draft.isActive,
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );

    final repository = await _ref.read(activityRepositoryProvider.future);
    await repository.upsert(activity);
    _ref.invalidate(allActivitiesProvider);
    _ref.invalidate(activeActivitiesProvider);
    return const <ActivityEditorError>[];
  }

  bool _isValidUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return false;
    }
    final uri = Uri.tryParse(value.trim());
    return uri != null &&
        (uri.scheme == 'https' || uri.scheme == 'http') &&
        uri.host.isNotEmpty;
  }

  String _createStableId(String title, DateTime now) {
    final slug = title
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
        .replaceAll(RegExp(r'^_+|_+$'), '');
    final base = slug.isEmpty ? 'activity' : slug;
    return 'custom_${base}_${now.microsecondsSinceEpoch}';
  }
}

final activityEditorControllerProvider = Provider<ActivityEditorController>(
  (ref) => ActivityEditorController(
    ref: ref,
    dateTimeProvider: ref.watch(dateTimeProviderProvider),
    imageService: ref.watch(activityImageServiceProvider),
  ),
);
