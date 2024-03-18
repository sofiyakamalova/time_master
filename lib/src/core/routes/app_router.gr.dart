// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:time_master/src/core/routes/navigation.dart' as _i5;
import 'package:time_master/src/features/habbits/habits_page.dart' as _i3;
import 'package:time_master/src/features/planner/planner_page.dart' as _i6;
import 'package:time_master/src/features/planner/tab_bar_screens/day/day_screen.dart'
    as _i1;
import 'package:time_master/src/features/planner/tab_bar_screens/month/month_screen.dart'
    as _i4;
import 'package:time_master/src/features/planner/tab_bar_screens/week/week_screen.dart'
    as _i9;
import 'package:time_master/src/features/priorities/priorities_page.dart'
    as _i7;
import 'package:time_master/src/features/settings/settings_page.dart' as _i8;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    DayRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DayScreen(),
      );
    },
    HabitsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HabitsPage(),
      );
    },
    MonthRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MonthScreen(),
      );
    },
    Navigation.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.Navigation(),
      );
    },
    PlannerRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PlannerPage(),
      );
    },
    PrioritiesRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.PrioritiesPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsPage(),
      );
    },
    WeekRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WeekScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DayScreen]
class DayRoute extends _i10.PageRouteInfo<void> {
  const DayRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DayRoute.name,
          initialChildren: children,
        );

  static const String name = 'DayRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HabitsPage]
class HabitsRoute extends _i10.PageRouteInfo<void> {
  const HabitsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HabitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabitsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MonthScreen]
class MonthRoute extends _i10.PageRouteInfo<void> {
  const MonthRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MonthRoute.name,
          initialChildren: children,
        );

  static const String name = 'MonthRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.Navigation]
class Navigation extends _i10.PageRouteInfo<void> {
  const Navigation({List<_i10.PageRouteInfo>? children})
      : super(
          Navigation.name,
          initialChildren: children,
        );

  static const String name = 'Navigation';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.PlannerPage]
class PlannerRoute extends _i10.PageRouteInfo<void> {
  const PlannerRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PlannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlannerRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.PrioritiesPage]
class PrioritiesRoute extends _i10.PageRouteInfo<void> {
  const PrioritiesRoute({List<_i10.PageRouteInfo>? children})
      : super(
          PrioritiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrioritiesRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WeekScreen]
class WeekRoute extends _i10.PageRouteInfo<void> {
  const WeekRoute({List<_i10.PageRouteInfo>? children})
      : super(
          WeekRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeekRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
