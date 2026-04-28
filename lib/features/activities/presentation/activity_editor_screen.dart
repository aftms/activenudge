import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../shared/extensions/build_context_l10n.dart';
import '../../../shared/extensions/localized_labels.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../application/activity_editor_controller.dart';
import '../application/activity_list_controller.dart';
import '../domain/entities/activity.dart';

class ActivityEditorScreen extends ConsumerWidget {
  const ActivityEditorScreen({this.activityId, super.key});

  final String? activityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = activityId;
    if (id == null) {
      return const _ActivityEditor(activity: null);
    }

    final activityAsync = ref.watch(activityByIdProvider(id));
    return activityAsync.when(
      loading: () => AppScaffold(
        selectedRoute: activitiesRoute,
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => AppScaffold(
        selectedRoute: activitiesRoute,
        child: Center(child: Text(error.toString())),
      ),
      data: (activity) => _ActivityEditor(activity: activity),
    );
  }
}

class _ActivityEditor extends ConsumerStatefulWidget {
  const _ActivityEditor({required this.activity});

  final Activity? activity;

  @override
  ConsumerState<_ActivityEditor> createState() => _ActivityEditorState();
}

class _ActivityEditorState extends ConsumerState<_ActivityEditor> {
  late ActivityDraft _draft;
  List<ActivityEditorError> _errors = const <ActivityEditorError>[];

  @override
  void initState() {
    super.initState();
    _draft = widget.activity == null
        ? ActivityDraft.empty()
        : ActivityDraft.fromActivity(widget.activity!);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isEditing = widget.activity != null;
    final languageCode = Localizations.localeOf(context).languageCode;
    final translation = _draft.translationForLanguageCode(languageCode);
    return AppScaffold(
      selectedRoute: activitiesRoute,
      actions: <Widget>[
        TextButton.icon(
          onPressed: () => context.goNamed(activitiesRoute),
          icon: const Icon(Icons.close),
          label: Text(l10n.cancel),
        ),
      ],
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  isEditing ? l10n.editActivity : l10n.newActivity,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        _TextField(
                          label: l10n.activityTitle,
                          value: translation.title,
                          onChanged: (value) => _update(
                            _draft.withTranslation(
                              languageCode: languageCode,
                              title: value,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _TextField(
                          label: l10n.activityDescription,
                          value: translation.description,
                          maxLines: 2,
                          onChanged: (value) => _update(
                            _draft.withTranslation(
                              languageCode: languageCode,
                              description: value,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _TextField(
                          label: l10n.activityInstructions,
                          value: translation.instructions,
                          maxLines: 3,
                          onChanged: (value) => _update(
                            _draft.withTranslation(
                              languageCode: languageCode,
                              instructions: value,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          initialValue: _draft.suggestedDurationMinutes
                              .toString(),
                          decoration: InputDecoration(
                            labelText: l10n.defaultActivityDuration,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (value) => _update(
                            _draft.copyWith(
                              suggestedDurationMinutes:
                                  int.tryParse(value) ?? 0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _Dropdown<ActivityCategory>(
                          label: l10n.category,
                          value: _draft.category,
                          values: ActivityCategory.values,
                          labelFor: (value) => value.label(context),
                          onChanged: (value) =>
                              _update(_draft.copyWith(category: value)),
                        ),
                        const SizedBox(height: 12),
                        _Dropdown<ActivityIntensity>(
                          label: l10n.intensity,
                          value: _draft.intensity,
                          values: ActivityIntensity.values,
                          labelFor: (value) => value.label(context),
                          onChanged: (value) =>
                              _update(_draft.copyWith(intensity: value)),
                        ),
                        const SizedBox(height: 12),
                        _Dropdown<ActivityContentType>(
                          label: l10n.contentType,
                          value: _draft.contentType,
                          values: ActivityContentType.values,
                          labelFor: (value) =>
                              _contentTypeLabel(context, value),
                          onChanged: (value) =>
                              _update(_draft.copyWith(contentType: value)),
                        ),
                        const SizedBox(height: 12),
                        _TextField(
                          label: l10n.urlOptional,
                          value: _draft.url ?? '',
                          onChanged: (value) => _update(
                            _draft.copyWith(
                              url: value,
                              clearUrl: value.trim().isEmpty,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _ImagePickerField(
                          imagePath: _draft.imagePath,
                          onPick: () async {
                            final imagePath = await ref
                                .read(activityEditorControllerProvider)
                                .pickImage();
                            if (imagePath != null && mounted) {
                              _update(_draft.copyWith(imagePath: imagePath));
                            }
                          },
                          onRemove: () =>
                              _update(_draft.copyWith(clearImagePath: true)),
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(l10n.isActive),
                          value: _draft.isActive,
                          onChanged: (value) =>
                              _update(_draft.copyWith(isActive: value)),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_errors.isNotEmpty) ...<Widget>[
                  const SizedBox(height: 16),
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _errors
                            .map((error) => Text(_errorLabel(context, error)))
                            .toList(),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.end,
                  children: <Widget>[
                    OutlinedButton.icon(
                      onPressed: () => context.goNamed(activitiesRoute),
                      icon: const Icon(Icons.close),
                      label: Text(l10n.cancel),
                    ),
                    FilledButton.icon(
                      onPressed: _save,
                      icon: const Icon(Icons.save_outlined),
                      label: Text(
                        isEditing ? l10n.updateActivity : l10n.createActivity,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _update(ActivityDraft draft) {
    setState(() {
      _draft = draft;
      _errors = const <ActivityEditorError>[];
    });
  }

  Future<void> _save() async {
    final errors = await ref
        .read(activityEditorControllerProvider)
        .save(
          draft: _draft,
          languageCode: Localizations.localeOf(context).languageCode,
          existing: widget.activity,
        );
    if (!mounted) {
      return;
    }
    if (errors.isNotEmpty) {
      setState(() => _errors = errors);
      return;
    }
    context.goNamed(activitiesRoute);
  }

  String _contentTypeLabel(BuildContext context, ActivityContentType value) {
    final l10n = context.l10n;
    return switch (value) {
      ActivityContentType.text => l10n.textContent,
      ActivityContentType.image => l10n.imageContent,
      ActivityContentType.externalLink => l10n.externalLinkContent,
      ActivityContentType.externalVideo => l10n.externalVideoContent,
    };
  }

  String _errorLabel(BuildContext context, ActivityEditorError error) {
    final l10n = context.l10n;
    return switch (error) {
      ActivityEditorError.titleRequired => l10n.titleRequired,
      ActivityEditorError.durationMustBePositive => l10n.durationValidation,
      ActivityEditorError.urlInvalid => l10n.urlInvalid,
      ActivityEditorError.imageRequired => l10n.imageRequired,
    };
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    required this.label,
    required this.value,
    required this.onChanged,
    this.maxLines = 1,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(label),
      initialValue: value,
      decoration: InputDecoration(labelText: label),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}

class _Dropdown<T> extends StatelessWidget {
  const _Dropdown({
    required this.label,
    required this.value,
    required this.values,
    required this.labelFor,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<T> values;
  final String Function(T value) labelFor;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      decoration: InputDecoration(labelText: label),
      items: values
          .map(
            (item) =>
                DropdownMenuItem<T>(value: item, child: Text(labelFor(item))),
          )
          .toList(),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}

class _ImagePickerField extends StatelessWidget {
  const _ImagePickerField({
    required this.imagePath,
    required this.onPick,
    required this.onRemove,
  });

  final String? imagePath;
  final VoidCallback onPick;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final path = imagePath;
    return InputDecorator(
      decoration: InputDecoration(labelText: l10n.imageOptional),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (path != null && File(path).existsSync()) ...<Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(path),
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(path, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
          ],
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              OutlinedButton.icon(
                onPressed: onPick,
                icon: const Icon(Icons.image_outlined),
                label: Text(l10n.chooseImage),
              ),
              if (path != null)
                OutlinedButton.icon(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline),
                  label: Text(l10n.removeImage),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
