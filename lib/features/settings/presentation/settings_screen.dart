import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../shared/extensions/build_context_l10n.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../application/settings_controller.dart';
import '../domain/entities/app_language.dart';
import '../domain/entities/app_settings.dart';
import '../domain/entities/app_time_of_day.dart';
import '../domain/services/settings_validator.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  AppSettings? _draft;
  List<SettingsValidationError> _errors = const <SettingsValidationError>[];

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(settingsStreamProvider);
    return AppScaffold(
      selectedRoute: settingsRoute,
      child: settingsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (settings) {
          _draft ??= settings;
          return _SettingsForm(
            settings: _draft!,
            errors: _errors,
            onChanged: (updated) => setState(() {
              _draft = updated;
              _errors = const <SettingsValidationError>[];
            }),
            onSave: () async {
              final messenger = ScaffoldMessenger.of(context);
              final savedMessage = context.l10n.settingsSaved;
              final errors = await ref
                  .read(settingsControllerProvider)
                  .save(_draft ?? settings);
              if (!mounted) {
                return;
              }
              setState(() => _errors = errors);
              if (errors.isEmpty) {
                messenger.showSnackBar(SnackBar(content: Text(savedMessage)));
              }
            },
          );
        },
      ),
    );
  }
}

class _SettingsForm extends StatelessWidget {
  const _SettingsForm({
    required this.settings,
    required this.errors,
    required this.onChanged,
    required this.onSave,
  });

  final AppSettings settings;
  final List<SettingsValidationError> errors;
  final ValueChanged<AppSettings> onChanged;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      DropdownButtonFormField<AppLanguage>(
                        initialValue: settings.language,
                        decoration: InputDecoration(labelText: l10n.language),
                        items: <DropdownMenuItem<AppLanguage>>[
                          DropdownMenuItem(
                            value: AppLanguage.system,
                            child: Text(l10n.systemDefault),
                          ),
                          DropdownMenuItem(
                            value: AppLanguage.english,
                            child: Text(l10n.english),
                          ),
                          DropdownMenuItem(
                            value: AppLanguage.portuguese,
                            child: Text(l10n.portuguese),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            onChanged(settings.copyWith(language: value));
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      _NumberField(
                        label: l10n.reminderInterval,
                        value: settings.reminderIntervalMinutes,
                        onChanged: (value) => onChanged(
                          settings.copyWith(reminderIntervalMinutes: value),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _NumberField(
                        label: l10n.defaultActivityDuration,
                        value: settings.defaultActivityDurationMinutes,
                        onChanged: (value) => onChanged(
                          settings.copyWith(
                            defaultActivityDurationMinutes: value,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _TimeRow(settings: settings, onChanged: onChanged),
                      const SizedBox(height: 16),
                      _ActiveDaysEditor(
                        settings: settings,
                        onChanged: onChanged,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: <Widget>[
                    SwitchListTile(
                      title: Text(l10n.reminders),
                      value: settings.remindersEnabled,
                      onChanged: (value) =>
                          onChanged(settings.copyWith(remindersEnabled: value)),
                    ),
                    SwitchListTile(
                      title: Text(l10n.notifications),
                      value: settings.notificationsEnabled,
                      onChanged: (value) => onChanged(
                        settings.copyWith(notificationsEnabled: value),
                      ),
                    ),
                    SwitchListTile(
                      title: Text(l10n.sound),
                      value: settings.soundEnabled,
                      onChanged: (value) =>
                          onChanged(settings.copyWith(soundEnabled: value)),
                    ),
                    SwitchListTile(
                      title: Text(l10n.vibration),
                      value: settings.vibrationEnabled,
                      onChanged: (value) =>
                          onChanged(settings.copyWith(vibrationEnabled: value)),
                    ),
                    SwitchListTile(
                      title: Text(l10n.autoOpenExternalContent),
                      value: settings.autoOpenExternalContent,
                      onChanged: (value) => onChanged(
                        settings.copyWith(autoOpenExternalContent: value),
                      ),
                    ),
                  ],
                ),
              ),
              if (errors.isNotEmpty) ...<Widget>[
                const SizedBox(height: 16),
                Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: errors
                          .map((error) => Text(_errorLabel(context, error)))
                          .toList(),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: onSave,
                icon: const Icon(Icons.save_outlined),
                label: Text(l10n.save),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _errorLabel(BuildContext context, SettingsValidationError error) {
    final l10n = context.l10n;
    return switch (error) {
      SettingsValidationError.intervalMustBePositive => l10n.intervalValidation,
      SettingsValidationError.durationMustBePositive => l10n.durationValidation,
      SettingsValidationError.invalidActiveHours => l10n.timeValidation,
      SettingsValidationError.activeDaysRequired => l10n.activeDaysValidation,
    };
  }
}

class _NumberField extends StatelessWidget {
  const _NumberField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '$value',
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (text) => onChanged(int.tryParse(text) ?? 0),
    );
  }
}

class _TimeRow extends StatelessWidget {
  const _TimeRow({required this.settings, required this.onChanged});

  final AppSettings settings;
  final ValueChanged<AppSettings> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                  hour: settings.activeStartTime.hour,
                  minute: settings.activeStartTime.minute,
                ),
              );
              if (picked != null) {
                onChanged(
                  settings.copyWith(
                    activeStartTime: AppTimeOfDay(
                      hour: picked.hour,
                      minute: picked.minute,
                    ),
                  ),
                );
              }
            },
            icon: const Icon(Icons.schedule_outlined),
            label: Text(
              '${l10n.startTime}: ${_formatTime(context, settings.activeStartTime)}',
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              final picked = await showTimePicker(
                context: context,
                initialTime: TimeOfDay(
                  hour: settings.activeEndTime.hour,
                  minute: settings.activeEndTime.minute,
                ),
              );
              if (picked != null) {
                onChanged(
                  settings.copyWith(
                    activeEndTime: AppTimeOfDay(
                      hour: picked.hour,
                      minute: picked.minute,
                    ),
                  ),
                );
              }
            },
            icon: const Icon(Icons.schedule_outlined),
            label: Text(
              '${l10n.endTime}: ${_formatTime(context, settings.activeEndTime)}',
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(BuildContext context, AppTimeOfDay time) {
    return MaterialLocalizations.of(
      context,
    ).formatTimeOfDay(TimeOfDay(hour: time.hour, minute: time.minute));
  }
}

class _ActiveDaysEditor extends StatelessWidget {
  const _ActiveDaysEditor({required this.settings, required this.onChanged});

  final AppSettings settings;
  final ValueChanged<AppSettings> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final labels = <int, String>{
      DateTime.monday: l10n.monday,
      DateTime.tuesday: l10n.tuesday,
      DateTime.wednesday: l10n.wednesday,
      DateTime.thursday: l10n.thursday,
      DateTime.friday: l10n.friday,
      DateTime.saturday: l10n.saturday,
      DateTime.sunday: l10n.sunday,
    };
    return InputDecorator(
      decoration: InputDecoration(labelText: l10n.activeDays),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: labels.entries.map((entry) {
          final selected = settings.activeWeekdays.contains(entry.key);
          return FilterChip(
            label: Text(entry.value),
            selected: selected,
            onSelected: (value) {
              final days = settings.activeWeekdays.toSet();
              if (value) {
                days.add(entry.key);
              } else {
                days.remove(entry.key);
              }
              onChanged(
                settings.copyWith(activeWeekdays: days.toList()..sort()),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
