import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../core/time/date_time_provider.dart';
import '../domain/entities/activity.dart';
import 'activity_image_service.dart';

class ActivityDraft {
  const ActivityDraft({
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
    this.url,
    this.imagePath,
  });

  factory ActivityDraft.empty() {
    return const ActivityDraft(
      titleEn: '',
      titlePt: '',
      descriptionEn: '',
      descriptionPt: '',
      instructionsEn: '',
      instructionsPt: '',
      suggestedDurationMinutes: 5,
      category: ActivityCategory.mobility,
      intensity: ActivityIntensity.low,
      contentType: ActivityContentType.text,
      isActive: true,
    );
  }

  factory ActivityDraft.fromActivity(Activity activity) {
    return ActivityDraft(
      titleEn: activity.titleEn,
      titlePt: activity.titlePt,
      descriptionEn: activity.descriptionEn,
      descriptionPt: activity.descriptionPt,
      instructionsEn: activity.instructionsEn,
      instructionsPt: activity.instructionsPt,
      suggestedDurationMinutes: activity.suggestedDurationMinutes,
      category: activity.category,
      intensity: activity.intensity,
      contentType: activity.contentType,
      url: activity.url,
      imagePath: activity.imagePath,
      isActive: activity.isActive,
    );
  }

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

  ActivityDraft copyWith({
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
  }) {
    return ActivityDraft(
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
    );
  }
}

enum ActivityEditorError {
  titleEnRequired,
  titlePtRequired,
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

  List<ActivityEditorError> validate(ActivityDraft draft) {
    final errors = <ActivityEditorError>[];
    if (draft.titleEn.trim().isEmpty) {
      errors.add(ActivityEditorError.titleEnRequired);
    }
    if (draft.titlePt.trim().isEmpty) {
      errors.add(ActivityEditorError.titlePtRequired);
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
    Activity? existing,
  }) async {
    final errors = validate(draft);
    if (errors.isNotEmpty) {
      return errors;
    }

    final now = _dateTimeProvider.now();
    final activity = Activity(
      stableId: existing?.stableId ?? _createStableId(draft.titleEn, now),
      translations: <String, ActivityTranslation>{
        'en': ActivityTranslation(
          languageCode: 'en',
          title: draft.titleEn.trim(),
          description: draft.descriptionEn.trim(),
          instructions: draft.instructionsEn.trim(),
        ),
        'pt': ActivityTranslation(
          languageCode: 'pt',
          title: draft.titlePt.trim(),
          description: draft.descriptionPt.trim(),
          instructions: draft.instructionsPt.trim(),
        ),
        for (final entry
            in existing?.translations.entries ??
                const Iterable<MapEntry<String, ActivityTranslation>>.empty())
          if (entry.key != 'en' && entry.key != 'pt') entry.key: entry.value,
      },
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
