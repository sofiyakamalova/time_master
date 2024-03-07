import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: Navigation.page,
          initial: true,
          children: [
            AutoRoute(page: PlannerRoute.page),
            AutoRoute(page: HabitsRoute.page),
            AutoRoute(page: PrioritiesRoute.page),
            AutoRoute(page: SettingsRoute.page),
            AutoRoute(page: EventEditingRoute.page),
          ],
        ),
      ];
}
