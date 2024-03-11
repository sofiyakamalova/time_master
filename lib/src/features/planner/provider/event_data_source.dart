import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time_master/src/features/planner/model/event_model.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventModel> appointments) {
    this.appointments = appointments;
  }
  EventModel getEvent(int index) => appointments![index] as EventModel;

  @override
  DateTime getStartTime(int index) {
    return getEvent(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return getEvent(index).to;
  }

  @override
  String getTitle(int index) {
    return getEvent(index).title;
  }

  String getDesc(int index) {
    return getEvent(index).description;
  }

  @override
  Color getColor(int index) {
    return getEvent(index).color;
  }
}
