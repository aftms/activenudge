import 'dart:ui';

enum AppLanguage {
  system,
  english,
  portuguese;

  Locale? get locale {
    return switch (this) {
      AppLanguage.system => null,
      AppLanguage.english => const Locale('en'),
      AppLanguage.portuguese => const Locale('pt'),
    };
  }
}
