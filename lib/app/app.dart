import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/settings/domain/entities/app_language.dart';
import 'localization/generated/app_localizations.dart';
import 'providers.dart';
import 'router.dart';
import 'theme.dart';

class ActiveNudgeApp extends ConsumerStatefulWidget {
  const ActiveNudgeApp({super.key});

  @override
  ConsumerState<ActiveNudgeApp> createState() => _ActiveNudgeAppState();
}

class _ActiveNudgeAppState extends ConsumerState<ActiveNudgeApp> {
  StreamSubscription<String>? _notificationSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _notificationSubscription ??= ref
        .read(notificationTapStreamProvider)
        .stream
        .listen((activityId) {
          ref
              .read(appRouterProvider)
              .goNamed(
                activitySessionRoute,
                pathParameters: <String, String>{'activityId': activityId},
              );
        });
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final settings = ref.watch(settingsStreamProvider).value;
    final locale = switch (settings?.language) {
      AppLanguage.english => const Locale('en'),
      AppLanguage.portuguese => const Locale('pt'),
      _ => null,
    };

    return MaterialApp.router(
      title: 'ActiveNudge',
      theme: ActiveNudgeTheme.light(),
      routerConfig: router,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
