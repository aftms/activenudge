import 'package:flutter/widgets.dart';

import '../../features/settings/domain/entities/app_language.dart';
import 'build_context_l10n.dart';

extension AppLanguageLabels on AppLanguage {
  String get flag {
    return switch (this) {
      AppLanguage.system => '🌐',
      AppLanguage.english => '🇬🇧',
      AppLanguage.portuguese => '🇵🇹',
    };
  }

  String label(BuildContext context) {
    final l10n = context.l10n;
    return switch (this) {
      AppLanguage.system => l10n.systemDefault,
      AppLanguage.english => l10n.english,
      AppLanguage.portuguese => l10n.portuguese,
    };
  }

  String flaggedLabel(BuildContext context) => '$flag ${label(context)}';
}
