import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time_master/src/core/common/common_button.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/features/planner/model/event_model.dart';
import 'package:time_master/src/features/planner/utils/utils.dart';
import 'package:time_master/src/features/planner/widgets/build_form_widget.dart';
import 'package:time_master/src/features/planner/widgets/dropdown_item.dart';

@RoutePage()
class DayScreen extends StatefulWidget {
  final EventModel? event;
  const DayScreen({
    super.key,
    this.event,
  });

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = _focusedDay;
    fromDate = DateTime.now();
    toDate = DateTime.now();

    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2024-03-10": [
        {
          "eventDescp": "a short story",
          "eventTitle": "Read the Novell ",
          "fromDate": fromDate.toIso8601String(),
          "toDate": toDate.toIso8601String(),
          "color": selectedColor.value.toString(),
        },
        {
          "eventDescp": "22",
          "eventTitle": "22",
          "fromDate": fromDate.toIso8601String(),
          "toDate": toDate.toIso8601String(),
          "color": selectedColor.value.toString(),
        }
      ],
      "2024-03-20": [
        {
          "eventDescp": "22",
          "eventTitle": "22",
          "fromDate": fromDate.toIso8601String(),
          "toDate": toDate.toIso8601String(),
          "color": selectedColor.value.toString(),
        }
      ],
      "2024-03-30": [
        {
          "eventTitle": "Listen podcast",
          "eventDescp": "It takes 20-30 min",
          "fromDate": fromDate.toIso8601String(),
          "toDate": toDate.toIso8601String(),
          "color": selectedColor.value.toString(),
        }
      ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  late DateTime fromDate;
  late DateTime toDate;

  Color selectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TableCalendar(
          eventLoader: _listOfDayEvents,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          firstDay: DateTime(2022),
          lastDay: DateTime(2030),
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDate, selectedDay)) {
              setState(() {
                _selectedDate = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
          rowHeight: 38,
          daysOfWeekHeight: 38.0,
          availableGestures: AvailableGestures.all,
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
        ..._listOfDayEvents(_selectedDate!).map(
          (myEvents) => ListTile(
            leading: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: myEvents['color'] != null
                        ? Color(int.parse(myEvents['color']))
                        : Colors.grey,
                  ),
                ),
              ),
              child: Text(
                DateFormat('HH:mm')
                    .format(DateTime.parse(myEvents['fromDate'])),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('${myEvents['eventTitle']}'),
            ),
            subtitle: Text('Description:   ${myEvents['eventDescp']}'),
          ),
        ),
        SizedBox(height: 290),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.fill_color,
              minimumSize: const Size(60, 60),
              shape: const CircleBorder(
                side: BorderSide(
                  color: AppColors.dark_primary_color,
                  width: 1,
                ),
              ),
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.dark_primary_color,
              size: 40,
            ),
          ),
        ),
      ],
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            color: AppColors.fill_color,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: AppColors.dark_primary_color,
                          size: 40,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: AppColors.dark_primary_color,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 200,
                            padding: const EdgeInsets.all(20.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.whiteColor,
                            ),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: titleController,
                                  validator: (title) =>
                                      title != null && title.isEmpty
                                          ? "Title can't be empty"
                                          : null,
                                  // onFieldSubmitted: (_) => saveForm,
                                  decoration: const InputDecoration(
                                    hintText: 'Name note',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                  ),
                                ),
                                const Divider(
                                    height: 1,
                                    color: AppColors.dark_primary_color),
                                TextFormField(
                                  maxLength: 150,
                                  controller: descController,
                                  //onFieldSubmitted: (_) => saveForm,
                                  validator: (desc) =>
                                      desc != null && desc.isEmpty
                                          ? "Please fill out the description"
                                          : null,
                                  decoration: const InputDecoration(
                                    hintText: 'Description',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Start',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.dark_primary_color,
                                ),
                              ),
                              BuildFormWidget(
                                text: Utils.toDate(fromDate),
                                onClicked: () =>
                                    pickFromDateTime(pickDate: true),
                                width: 170,
                              ),
                              BuildFormWidget(
                                text: Utils.toTime(fromDate),
                                onClicked: () =>
                                    pickFromDateTime(pickDate: false),
                                width: 90,
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'End  ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.dark_primary_color,
                                ),
                              ),
                              BuildFormWidget(
                                text: Utils.toDate(toDate),
                                onClicked: () => pickToDateTime(pickDate: true),
                                width: 170,
                              ),
                              BuildFormWidget(
                                text: Utils.toTime(toDate),
                                onClicked: () =>
                                    pickToDateTime(pickDate: false),
                                width: 90,
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                'Priority',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.dark_primary_color,
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 100,
                                child: Center(
                                  child: DropdownButton<Color>(
                                    value: selectedColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedColor = newValue!;
                                      });
                                    },
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return const [
                                        DropdownItem(
                                          text: 'Unimportant',
                                          color: Colors.grey,
                                        ),
                                        DropdownItem(
                                          text: 'Not very important',
                                          color: Colors.yellow,
                                        ),
                                        DropdownItem(
                                          text: 'Important',
                                          color: Colors.red,
                                        ),
                                      ];
                                    },
                                    items: const [
                                      DropdownMenuItem(
                                        value: Colors.grey,
                                        child: DropdownItem(
                                          text: 'Unimportant',
                                          color: Colors.grey,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Colors.yellow,
                                        child: DropdownItem(
                                          text: 'Not very important',
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: Colors.red,
                                        child: DropdownItem(
                                          text: 'Important',
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CommonButton(
                              text: 'Save',
                              onTap: () {
                                if (titleController.text.isEmpty &&
                                    descController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Required title and description'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                  return;
                                } else {
                                  print(titleController.text);
                                  print(descController.text);

                                  setState(() {
                                    if (mySelectedEvents[
                                            DateFormat('yyyy-MM-dd')
                                                .format(_selectedDate!)] !=
                                        null) {
                                      mySelectedEvents[DateFormat('yyyy-MM-dd')
                                              .format(_selectedDate!)]
                                          ?.add({
                                        "eventTitle": titleController.text,
                                        "eventDescp": descController.text,
                                        "fromDate": fromDate.toIso8601String(),
                                        "toDate": toDate.toIso8601String(),
                                        "color": selectedColor.value.toString(),
                                      });
                                    } else {
                                      mySelectedEvents[DateFormat('yyyy-MM-dd')
                                          .format(_selectedDate!)] = [
                                        {
                                          "eventTitle": titleController.text,
                                          "eventDescp": descController.text,
                                          "fromDate":
                                              fromDate.toIso8601String(),
                                          "toDate": toDate.toIso8601String(),
                                          "color":
                                              selectedColor.value.toString(),
                                        }
                                      ];
                                    }
                                  });
                                  print(
                                      "New Event for backend developer ${json.encode(mySelectedEvents)}");
                                  titleController.clear();
                                  descController.clear();
                                  Navigator.pop(context);
                                  return;
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      fromDate,
      pickDate: pickDate,
    );
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate = DateTime(
        date.year,
        date.month,
        date.day,
        toDate.hour,
        toDate.minute,
      );
    }
    setState(() {
      fromDate = date;
      _updateSelectedEvents();
    });
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;
    setState(() {
      toDate = date;
      _updateSelectedEvents();
    });
  }

  void _updateSelectedEvents() {
    setState(() {
      if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
          null) {
        mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)]?.add({
          "eventTitle": titleController.text,
          "eventDescp": descController.text,
          "fromDate": fromDate.toIso8601String(),
          "toDate": toDate.toIso8601String(),
          "color": selectedColor.value.toString(),
        });
      } else {
        mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
          {
            "eventTitle": titleController.text,
            "eventDescp": descController.text,
            "fromDate": fromDate.toIso8601String(),
            "toDate": toDate.toIso8601String(),
            "color": selectedColor.value.toString(),
          }
        ];
      }
    });
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2021, 8),
        lastDate: DateTime(2100),
      );

      if (date == null) return null;

      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(
        hours: timeOfDay.hour,
        minutes: timeOfDay.minute,
      );
      return date.add(time);
    }
  }
}
