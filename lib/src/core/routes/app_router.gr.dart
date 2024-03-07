// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:time_master/src/core/routes/navigation.dart' as _i3;
import 'package:time_master/src/features/habbits/habits_page.dart' as _i2;
import 'package:time_master/src/features/planner/planner_page.dart' as _i4;
import 'package:time_master/src/features/planner/tab_bar_screens/event_editing_page.dart'
    as _i1;
import 'package:time_master/src/features/priorities/priorities_page.dart'
    as _i5;
import 'package:time_master/src/features/settings/settings_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    EventEditingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EventEditingPage(),
      );
    },
    HabitsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HabitsPage(),
      );
    },
    Navigation.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Navigation(),
      );
    },
    PlannerRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PlannerPage(),
      );
    },
    PrioritiesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.PrioritiesPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.EventEditingPage]
class EventEditingRoute extends _i7.PageRouteInfo<void> {
  const EventEditingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          EventEditingRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventEditingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HabitsPage]
class HabitsRoute extends _i7.PageRouteInfo<void> {
  const HabitsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HabitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabitsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Navigation]
class Navigation extends _i7.PageRouteInfo<void> {
  const Navigation({List<_i7.PageRouteInfo>? children})
      : super(
          Navigation.name,
          initialChildren: children,
        );

  static const String name = 'Navigation';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PlannerPage]
class PlannerRoute extends _i7.PageRouteInfo<void> {
  const PlannerRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PlannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlannerRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.PrioritiesPage]
class PrioritiesRoute extends _i7.PageRouteInfo<void> {
  const PrioritiesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PrioritiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrioritiesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
