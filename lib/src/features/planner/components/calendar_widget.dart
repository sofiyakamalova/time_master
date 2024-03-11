import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_master/src/core/common/common_text.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/features/planner/model/event_model.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // final events = Provider.of<EventProvider>(context).events;
  //
  // final provider = Provider.of<EventProvider>(context, listen: true);

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Map<DateTime, List<EventModel>> events = {};
  late final ValueNotifier<List<EventModel>> _selectedEvents;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDay = _focusedDay;
    //_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          TableCalendar(
            firstDay: DateTime.utc(2010, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rowHeight: 38,
            daysOfWeekHeight: 38.0,
            onDaySelected: _onDaySelected,
            availableGestures: AvailableGestures.all,
            lastDay: DateTime.utc(2030, 3, 14),
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarFormat: _calendarFormat,
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
              todayTextStyle:
                  const TextStyle(color: AppColors.dark_primary_color),
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
          ),
          const SizedBox(height: 15),
          const CommonText(
            text: 'Timetable',
            size: 18,
          ),
        ],
      ),
    );
  }
}
