import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/features/planner/components/calendar_widget.dart';
import 'package:time_master/src/features/planner/tab_bar_screens/event_editing_page.dart';

@RoutePage()
class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CalendarWidget(),
        Positioned(
          bottom: 16,
          right: 2,
          top: 400,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EventEditingPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.fill_color,
              shape: const CircleBorder(
                side: BorderSide(
                  color: AppColors.dark_primary_color,
                  width: 1,
                ),
              ),
            ),
            child: const Icon(Icons.add, color: AppColors.dark_primary_color),
          ),
        ),
      ],
    );
  }
}
