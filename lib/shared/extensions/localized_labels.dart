import 'package:flutter/widgets.dart';

import '../../features/activities/domain/entities/activity.dart';
import '../../features/history/domain/entities/history_entry.dart';
import '../extensions/build_context_l10n.dart';

extension ActivityCategoryLabel on ActivityCategory {
  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      ActivityCategory.mobility => l10n.mobility,
      ActivityCategory.strength => l10n.strength,
      ActivityCategory.cardio => l10n.cardio,
      ActivityCategory.breathing => l10n.breathing,
    };
  }
}

extension ActivityIntensityLabel on ActivityIntensity {
  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      ActivityIntensity.low => l10n.low,
      ActivityIntensity.medium => l10n.medium,
      ActivityIntensity.high => l10n.high,
    };
  }
}

extension SessionResultLabel on SessionResult {
  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      SessionResult.completed => l10n.completed,
      SessionResult.skipped => l10n.skipped,
      SessionResult.expired => l10n.expired,
    };
  }
}

extension SessionOriginLabel on SessionOrigin {
  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      SessionOrigin.manual => l10n.manual,
      SessionOrigin.reminder => l10n.reminder,
    };
  }
}
