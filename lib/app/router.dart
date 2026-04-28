import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/activities/presentation/activities_screen.dart';
import '../features/activity_session/presentation/activity_session_screen.dart';
import '../features/history/presentation/history_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/reminders/presentation/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

const homeRoute = 'home';
const settingsRoute = 'settings';
const activitiesRoute = 'activities';
const activitySessionRoute = 'activitySession';
const historyRoute = 'history';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: homeRoute,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: settingsRoute,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/activities',
        name: activitiesRoute,
        builder: (context, state) => const ActivitiesScreen(),
      ),
      GoRoute(
        path: '/activity-session/:activityId',
        name: activitySessionRoute,
        builder: (context, state) {
          return ActivitySessionScreen(
            activityId: state.pathParameters['activityId']!,
          );
        },
      ),
      GoRoute(
        path: '/history',
        name: historyRoute,
        builder: (context, state) => const HistoryScreen(),
      ),
    ],
  );
});
