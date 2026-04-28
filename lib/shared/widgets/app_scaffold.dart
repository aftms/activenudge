import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../extensions/build_context_l10n.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.selectedRoute,
    required this.child,
    this.actions,
    this.floatingActionButton,
    super.key,
  });

  final String selectedRoute;
  final Widget child;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final destinations = <_Destination>[
      _Destination(homeRoute, '/', Icons.dashboard_outlined, l10n.appTitle),
      _Destination(
        activitiesRoute,
        '/activities',
        Icons.fitness_center_outlined,
        l10n.activities,
      ),
      _Destination(
        historyRoute,
        '/history',
        Icons.history_outlined,
        l10n.history,
      ),
      _Destination(
        settingsRoute,
        '/settings',
        Icons.settings_outlined,
        l10n.settings,
      ),
    ];
    final selectedIndex = destinations.indexWhere(
      (destination) => destination.routeName == selectedRoute,
    );
    final safeSelectedIndex = selectedIndex < 0 ? 0 : selectedIndex;
    final wide = MediaQuery.sizeOf(context).width >= 820;

    if (wide) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.appTitle), actions: actions),
        floatingActionButton: floatingActionButton,
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: safeSelectedIndex,
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (index) =>
                  context.go(destinations[index].path),
              destinations: destinations
                  .map(
                    (destination) => NavigationRailDestination(
                      icon: Icon(destination.icon),
                      label: Text(destination.label),
                    ),
                  )
                  .toList(),
            ),
            const VerticalDivider(width: 1),
            Expanded(child: child),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appTitle), actions: actions),
      floatingActionButton: floatingActionButton,
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: safeSelectedIndex,
        onDestinationSelected: (index) => context.go(destinations[index].path),
        destinations: destinations
            .map(
              (destination) => NavigationDestination(
                icon: Icon(destination.icon),
                label: destination.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Destination {
  const _Destination(this.routeName, this.path, this.icon, this.label);

  final String routeName;
  final String path;
  final IconData icon;
  final String label;
}
