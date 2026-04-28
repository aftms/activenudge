import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../shared/extensions/build_context_l10n.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../../activities/domain/entities/activity.dart';
import '../../activities/domain/services/activity_suggestion_service.dart';
import '../application/reminder_controller.dart';
import '../../settings/application/settings_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bootstrap = ref.watch(appBootstrapProvider);
    return AppScaffold(
      selectedRoute: homeRoute,
      child: bootstrap.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (_) => const _Dashboard(),
      ),
    );
  }
}

class _Dashboard extends ConsumerWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settings = ref.watch(settingsStreamProvider).value;
    final activities =
        ref.watch(activeActivitiesProvider).value ?? const <Activity>[];
    final summary = ref.watch(historySummaryProvider).value;
    final nextReminder = ref.watch(nextReminderPreviewProvider).value;
    final localeCode = Localizations.localeOf(context).languageCode;
    final now = ref.watch(dateTimeProviderProvider).now();
    final suggestedActivity = const ActivitySuggestionService()
        .chooseSuggestedActivity(activities: activities, now: now);

    final remindersActive = settings?.remindersEnabled ?? false;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: <Widget>[
                  _MetricCard(
                    title: l10n.reminders,
                    value: remindersActive ? l10n.active : l10n.inactive,
                    icon: remindersActive
                        ? Icons.notifications_active_outlined
                        : Icons.notifications_off_outlined,
                  ),
                  _MetricCard(
                    title: l10n.completedToday,
                    value: '${summary?.completedToday ?? 0}',
                    icon: Icons.check_circle_outline,
                  ),
                  _MetricCard(
                    title: l10n.activeMinutesToday,
                    value: '${summary?.activeMinutesToday ?? 0}',
                    icon: Icons.timer_outlined,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        l10n.nextReminder,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        nextReminder == null
                            ? l10n.noNextReminder
                            : MaterialLocalizations.of(
                                context,
                              ).formatFullDate(nextReminder),
                      ),
                      if (nextReminder != null)
                        Text(
                          MaterialLocalizations.of(context).formatTimeOfDay(
                            TimeOfDay.fromDateTime(nextReminder),
                          ),
                        ),
                      const SizedBox(height: 20),
                      Text(
                        l10n.suggestedActivity,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        suggestedActivity?.titleForLanguageCode(localeCode) ??
                            l10n.noActivitySelected,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      if (suggestedActivity != null) ...<Widget>[
                        const SizedBox(height: 8),
                        Text(
                          suggestedActivity.descriptionForLanguageCode(
                            localeCode,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: <Widget>[
                          FilledButton.icon(
                            onPressed: suggestedActivity == null
                                ? null
                                : () => context.goNamed(
                                    activitySessionRoute,
                                    pathParameters: <String, String>{
                                      'activityId': suggestedActivity.stableId,
                                    },
                                  ),
                            icon: const Icon(Icons.play_arrow),
                            label: Text(l10n.startNow),
                          ),
                          OutlinedButton.icon(
                            onPressed: settings == null
                                ? null
                                : () async {
                                    final controller = ref.read(
                                      settingsControllerProvider,
                                    );
                                    await controller.save(
                                      settings.copyWith(
                                        remindersEnabled: !remindersActive,
                                      ),
                                    );
                                  },
                            icon: Icon(
                              remindersActive
                                  ? Icons.notifications_off_outlined
                                  : Icons.notifications_active_outlined,
                            ),
                            label: Text(
                              remindersActive
                                  ? l10n.remindersDisabled
                                  : l10n.remindersEnabled,
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () => context.go('/settings'),
                            icon: const Icon(Icons.settings_outlined),
                            label: Text(l10n.settings),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(icon, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title, style: Theme.of(context).textTheme.labelLarge),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
