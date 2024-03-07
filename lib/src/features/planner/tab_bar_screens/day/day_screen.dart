import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/core/routes/app_router.gr.dart';
import 'package:time_master/src/features/calendar_widget.dart';

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
          child: SizedBox(
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(EventEditingRoute());
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
        ),
      ],
    );
  }
}
