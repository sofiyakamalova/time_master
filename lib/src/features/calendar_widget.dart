import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_master/src/core/constants/app_colors.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      rowHeight: 38,
      daysOfWeekHeight: 38.0,
      firstDay: DateTime.now(),
      focusedDay: DateTime.now(),
      lastDay: DateTime(2030),
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        tableBorder: TableBorder.all(
          color: AppColors.dark_primary_color,
          width: 1,
          borderRadius: BorderRadius.circular(30),
        ),
        todayDecoration: const BoxDecoration(
          color: AppColors.fill_color,
          shape: BoxShape.circle,
        ),
        todayTextStyle: const TextStyle(color: AppColors.dark_primary_color),
        selectedDecoration: const BoxDecoration(
          color: AppColors.primary_color,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: const TextStyle(color: AppColors.whiteColor),
        tablePadding: const EdgeInsets.symmetric(horizontal: 5),
      ),
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          color: AppColors.dark_primary_color,
          fontSize: 20,
        ),
        headerPadding: EdgeInsets.symmetric(vertical: 10),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: AppColors.dark_primary_color),
        weekendStyle: TextStyle(color: AppColors.primary_color),
      ),
    );
  }
}
