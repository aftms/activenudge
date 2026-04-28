import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../features/settings/application/settings_controller.dart';
import '../../features/settings/domain/entities/app_language.dart';
import '../extensions/build_context_l10n.dart';

class LanguageMenuButton extends ConsumerWidget {
  const LanguageMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settings = ref.watch(settingsStreamProvider).value;
    final currentLanguage = settings?.language ?? AppLanguage.system;

    return PopupMenuButton<AppLanguage>(
      tooltip: l10n.language,
      initialValue: currentLanguage,
      icon: const Icon(Icons.language),
      onSelected: settings == null
          ? null
          : (language) async {
              await ref
                  .read(settingsControllerProvider)
                  .save(settings.copyWith(language: language));
            },
      itemBuilder: (context) => <PopupMenuEntry<AppLanguage>>[
        PopupMenuItem<AppLanguage>(
          value: AppLanguage.system,
          child: _LanguageMenuItem(
            label: l10n.systemDefault,
            selected: currentLanguage == AppLanguage.system,
          ),
        ),
        PopupMenuItem<AppLanguage>(
          value: AppLanguage.english,
          child: _LanguageMenuItem(
            label: l10n.english,
            selected: currentLanguage == AppLanguage.english,
          ),
        ),
        PopupMenuItem<AppLanguage>(
          value: AppLanguage.portuguese,
          child: _LanguageMenuItem(
            label: l10n.portuguese,
            selected: currentLanguage == AppLanguage.portuguese,
          ),
        ),
      ],
    );
  }
}

class _LanguageMenuItem extends StatelessWidget {
  const _LanguageMenuItem({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(selected ? Icons.check : null, size: 18),
        const SizedBox(width: 12),
        Text(label),
      ],
    );
  }
}
