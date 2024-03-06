import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/core/routes/app_router.gr.dart';

@RoutePage()
class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        HabitsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: [
              SalomonBottomBarItem(
                icon: Image.asset(
                  'assets/icons/calendar_bar.png',
                  width: 25,
                ),
                title: const Text("Planner"),
                selectedColor: AppColors.primary_color,
              ),
              SalomonBottomBarItem(
                icon: Image.asset(
                  'assets/icons/habits_bar.png',
                  width: 25,
                ),
                title: const Text("Habits"),
                selectedColor: AppColors.primary_color,
              ),
            ],
          ),
        );
      },
    );
  }
}
