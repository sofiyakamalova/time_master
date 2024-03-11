import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  //final Color backgroundColor;
  final Color color;
  //final bool isAllDay; //priority

  const EventModel({
    required this.title,
    required this.description,
    required this.from,
    required this.to,
    // required this.backgroundColor,
    required this.color,
    //required this.isAllDay,
  });
}
