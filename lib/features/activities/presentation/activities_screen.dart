import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../shared/extensions/build_context_l10n.dart';
import '../../../shared/extensions/localized_labels.dart';
import '../../../shared/widgets/app_scaffold.dart';
import '../domain/entities/activity.dart';

class ActivitiesScreen extends ConsumerWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activitiesAsync = ref.watch(activeActivitiesProvider);
    return AppScaffold(
      selectedRoute: activitiesRoute,
      child: activitiesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (activities) => _ActivitiesList(activities: activities),
      ),
    );
  }
}

class _ActivitiesList extends StatelessWidget {
  const _ActivitiesList({required this.activities});

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    final localeCode = Localizations.localeOf(context).languageCode;
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: activities.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final activity = activities[index];
        return Card(
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: const Icon(Icons.fitness_center_outlined),
            title: Text(activity.titleForLanguageCode(localeCode)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(activity.descriptionForLanguageCode(localeCode)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      Chip(label: Text(activity.category.label(context))),
                      Chip(label: Text(activity.intensity.label(context))),
                      Chip(
                        label: Text(
                          context.l10n.minutes(
                            activity.suggestedDurationMinutes,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.goNamed(
              activitySessionRoute,
              pathParameters: <String, String>{'activityId': activity.stableId},
            ),
          ),
        );
      },
    );
  }
}
