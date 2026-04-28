import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../features/settings/application/settings_controller.dart';
import '../../features/settings/domain/entities/app_language.dart';
import '../extensions/app_language_labels.dart';

class LanguageMenuButton extends ConsumerWidget {
  const LanguageMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsStreamProvider).value;
    final currentLanguage = settings?.language ?? AppLanguage.system;

    return PopupMenuButton<AppLanguage>(
      tooltip: currentLanguage.label(context),
      initialValue: currentLanguage,
      icon: Text(
        currentLanguage.flag,
        style: Theme.of(context).textTheme.titleLarge,
      ),
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
            language: AppLanguage.system,
            selected: currentLanguage == AppLanguage.system,
          ),
        ),
        PopupMenuItem<AppLanguage>(
          value: AppLanguage.english,
          child: _LanguageMenuItem(
            language: AppLanguage.english,
            selected: currentLanguage == AppLanguage.english,
          ),
        ),
        PopupMenuItem<AppLanguage>(
          value: AppLanguage.portuguese,
          child: _LanguageMenuItem(
            language: AppLanguage.portuguese,
            selected: currentLanguage == AppLanguage.portuguese,
          ),
        ),
      ],
    );
  }
}

class _LanguageMenuItem extends StatelessWidget {
  const _LanguageMenuItem({required this.language, required this.selected});

  final AppLanguage language;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(selected ? Icons.check : null, size: 18),
        const SizedBox(width: 12),
        Text(language.flag),
        const SizedBox(width: 12),
        Text(language.label(context)),
      ],
    );
  }
}
