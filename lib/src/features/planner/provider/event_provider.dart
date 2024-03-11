import 'package:flutter/material.dart';
import 'package:time_master/src/features/planner/model/event_model.dart';

class EventProvider extends ChangeNotifier {
  final List<EventModel> _events = [];

  List<EventModel> get events => _events;

  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  void setDate(DateTime date) => _selectedDate = date;

  List<EventModel> get eventsOfSelectedDate => _events;
  void addEvent(EventModel event) {
    _events.add(event);

    notifyListeners();
  }

  void deleteEvent(EventModel event) {
    _events.remove(event);

    notifyListeners();
  }
}
