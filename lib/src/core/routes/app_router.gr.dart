// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:time_master/src/core/routes/navigation.dart' as _i3;
import 'package:time_master/src/feautures/habits_page.dart' as _i1;
import 'package:time_master/src/feautures/home_page.dart' as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HabitsRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HabitsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    Navigation.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.Navigation(),
      );
    },
  };
}

/// generated route for
/// [_i1.HabitsPage]
class HabitsRoute extends _i4.PageRouteInfo<void> {
  const HabitsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HabitsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabitsRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Navigation]
class Navigation extends _i4.PageRouteInfo<void> {
  const Navigation({List<_i4.PageRouteInfo>? children})
      : super(
          Navigation.name,
          initialChildren: children,
        );

  static const String name = 'Navigation';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
