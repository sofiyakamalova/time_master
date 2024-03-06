// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:time_master/src/core/routes/navigation.dart' as _i2;
import 'package:time_master/src/feautures/habbits/habits_page.dart' as _i1;
import 'package:time_master/src/feautures/planner/planner_page.dart' as _i3;
import 'package:time_master/src/feautures/priorities/priorities_page.dart'
    as _i4;
import 'package:time_master/src/feautures/settings/settings_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HabitsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HabitsPage(),
      );
    },
    Navigation.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Navigation(),
      );
    },
    PlannerRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PlannerPage(),
      );
    },
    PrioritiesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PrioritiesPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HabitsPage]
class HabitsRoute extends _i6.PageRouteInfo<void> {
  const HabitsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HabitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabitsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Navigation]
class Navigation extends _i6.PageRouteInfo<void> {
  const Navigation({List<_i6.PageRouteInfo>? children})
      : super(
          Navigation.name,
          initialChildren: children,
        );

  static const String name = 'Navigation';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PlannerPage]
class PlannerRoute extends _i6.PageRouteInfo<void> {
  const PlannerRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PlannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlannerRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PrioritiesPage]
class PrioritiesRoute extends _i6.PageRouteInfo<void> {
  const PrioritiesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PrioritiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrioritiesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
