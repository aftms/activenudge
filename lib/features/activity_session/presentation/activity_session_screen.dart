import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../shared/extensions/build_context_l10n.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../../activities/application/activity_list_controller.dart';
import '../../activities/domain/entities/activity.dart';
import '../application/activity_session_controller.dart';
import '../domain/entities/activity_session_status.dart';

class ActivitySessionScreen extends ConsumerWidget {
  const ActivitySessionScreen({required this.activityId, super.key});

  final String activityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityAsync = ref.watch(activityByIdProvider(activityId));
    return AppScaffold(
      selectedRoute: activitiesRoute,
      child: activityAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (activity) {
          if (activity == null) {
            return Center(child: Text(context.l10n.noActivitySelected));
          }
          return _ActivitySession(activity: activity);
        },
      ),
    );
  }
}

class _ActivitySession extends ConsumerWidget {
  const _ActivitySession({required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = activitySessionControllerProvider(activity);
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);
    final localeCode = Localizations.localeOf(context).languageCode;
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    activity.titleForLanguageCode(localeCode),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(activity.descriptionForLanguageCode(localeCode)),
                  const SizedBox(height: 20),
                  Text(
                    l10n.instructions,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(activity.instructionsForLanguageCode(localeCode)),
                  if (activity.imagePath != null) ...<Widget>[
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(activity.imagePath!),
                    ),
                  ],
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      _formatRemaining(state.remainingSeconds),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: <Widget>[
                      FilledButton.icon(
                        onPressed: state.status == ActivitySessionStatus.idle
                            ? controller.start
                            : null,
                        icon: const Icon(Icons.play_arrow),
                        label: Text(l10n.start),
                      ),
                      OutlinedButton.icon(
                        onPressed: state.status == ActivitySessionStatus.running
                            ? controller.pause
                            : null,
                        icon: const Icon(Icons.pause),
                        label: Text(l10n.pause),
                      ),
                      OutlinedButton.icon(
                        onPressed: state.status == ActivitySessionStatus.paused
                            ? controller.resume
                            : null,
                        icon: const Icon(Icons.play_arrow_outlined),
                        label: Text(l10n.resume),
                      ),
                      FilledButton.tonalIcon(
                        onPressed: state.isFinished
                            ? null
                            : () => controller.complete(),
                        icon: const Icon(Icons.check),
                        label: Text(l10n.complete),
                      ),
                      OutlinedButton.icon(
                        onPressed: state.isFinished
                            ? null
                            : () => controller.skip(),
                        icon: const Icon(Icons.skip_next_outlined),
                        label: Text(l10n.skip),
                      ),
                      if (activity.url != null)
                        OutlinedButton.icon(
                          onPressed: () => ref
                              .read(linkOpenerServiceProvider)
                              .openExternal(Uri.parse(activity.url!)),
                          icon: const Icon(Icons.open_in_new),
                          label: Text(l10n.openContent),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatRemaining(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
