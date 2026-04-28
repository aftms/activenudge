import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../../app/router.dart';
import '../../../shared/extensions/build_context_l10n.dart';
import '../../../shared/extensions/localized_labels.dart';
import '../../../shared/widgets/app_scaffold.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(recentHistoryProvider);
    final summary = ref.watch(historySummaryProvider).value;
    return AppScaffold(
      selectedRoute: historyRoute,
      child: historyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (entries) {
          final l10n = context.l10n;
          final localeCode = Localizations.localeOf(context).languageCode;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: <Widget>[
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: <Widget>[
                  _SummaryCard(
                    title: l10n.completedToday,
                    value: '${summary?.completedToday ?? 0}',
                  ),
                  _SummaryCard(
                    title: l10n.activeMinutesToday,
                    value: '${summary?.activeMinutesToday ?? 0}',
                  ),
                  _SummaryCard(
                    title: l10n.completionRate,
                    value:
                        '${(((summary?.completionRate ?? 0) * 100).round())}%',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (entries.isEmpty)
                Center(child: Text(l10n.noHistoryYet))
              else
                ...entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: const Icon(Icons.check_circle_outline),
                        title: Text(
                          localeCode == 'pt'
                              ? entry.activityTitlePt
                              : entry.activityTitleEn,
                        ),
                        subtitle: Text(
                          '${entry.result.label(context)} · ${entry.origin.label(context)}',
                        ),
                        trailing: Text(
                          MaterialLocalizations.of(
                            context,
                          ).formatShortDate(entry.startedAt),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title, style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              Text(value, style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
      ),
    );
  }
}
