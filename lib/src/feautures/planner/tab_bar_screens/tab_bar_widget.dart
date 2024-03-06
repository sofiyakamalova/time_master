import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/feautures/planner/tab_bar_screens/day/day_screen.dart';
import 'package:time_master/src/feautures/planner/tab_bar_screens/month/month_screen.dart';
import 'package:time_master/src/feautures/planner/tab_bar_screens/week/week_screen.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Material(
              child: SizedBox(
                height: 55,
                child: TabBar(
                  controller: tabController,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  unselectedLabelColor: AppColors.fill_color,
                  isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: AppColors.primary_color,
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  tabs: [
                    Tab(
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: AppColors.primary_color, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Day',
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? AppColors.whiteColor
                                  : AppColors.black_color,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: AppColors.primary_color, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Week',
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? AppColors.whiteColor
                                  : AppColors.black_color,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: AppColors.primary_color, width: 1.5),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Month',
                            style: TextStyle(
                              color: selectedIndex == 2
                                  ? AppColors.whiteColor
                                  : AppColors.black_color,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  DayScreen(),
                  WeekScreen(),
                  MonthScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
