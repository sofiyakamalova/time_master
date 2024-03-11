import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_master/src/core/common/common_button.dart';
import 'package:time_master/src/core/constants/app_colors.dart';
import 'package:time_master/src/features/planner/model/event_model.dart';
import 'package:time_master/src/features/planner/provider/event_provider.dart';
import 'package:time_master/src/features/planner/utils/utils.dart';
import 'package:time_master/src/features/planner/widgets/build_form_widget.dart';
import 'package:time_master/src/features/planner/widgets/dropdown_item.dart';

@RoutePage()
class EventEditingPage extends StatefulWidget {
  final EventModel? event;
  const EventEditingPage({
    super.key,
    this.event,
  });

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  late DateTime fromDate;
  late DateTime toDate;

  Color selectedColor = Colors.grey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.fill_color,
        appBar: AppBar(
          backgroundColor: AppColors.fill_color,
          leading: IconButton(
            onPressed: deleteForm,
            icon: const Icon(
              Icons.delete_forever_outlined,
              color: AppColors.dark_primary_color,
              size: 40,
            ),
          ),
          actions: [
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
        body: SingleChildScrollView(
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
                        validator: (title) => title != null && title.isEmpty
                            ? "Title can't be empty"
                            : null,
                        onFieldSubmitted: (_) => saveForm,
                        decoration: const InputDecoration(
                          hintText: 'Name note',
                          hintStyle: TextStyle(fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                        ),
                      ),
                      const Divider(
                          height: 1, color: AppColors.dark_primary_color),
                      TextFormField(
                        maxLength: 150,
                        controller: descController,
                        onFieldSubmitted: (_) => saveForm,
                        validator: (desc) => desc != null && desc.isEmpty
                            ? "Please fill out the description"
                            : null,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(fontWeight: FontWeight.w400),
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
                      onClicked: () => pickFromDateTime(pickDate: true),
                      width: 170,
                    ),
                    BuildFormWidget(
                      text: Utils.toTime(fromDate),
                      onClicked: () => pickFromDateTime(pickDate: false),
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
                      onClicked: () => pickToDateTime(pickDate: false),
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
                          selectedItemBuilder: (BuildContext context) {
                            return const [
                              DropdownItem(
                                text: 'Unimportant',
                                color: AppColors.grey_color,
                              ),
                              DropdownItem(
                                text: 'Not very important',
                                color: AppColors.not_very_important_color,
                              ),
                              DropdownItem(
                                text: 'Important',
                                color: AppColors.important_color,
                              ),
                            ];
                          },
                          items: const [
                            DropdownMenuItem(
                              value: Colors.grey,
                              child: DropdownItem(
                                text: 'Unimportant',
                                color: AppColors.grey_color,
                              ),
                            ),
                            DropdownMenuItem(
                              value: Colors.yellow,
                              child: DropdownItem(
                                text: 'Not very important',
                                color: AppColors.not_very_important_color,
                              ),
                            ),
                            DropdownMenuItem(
                              value: Colors.red,
                              child: DropdownItem(
                                text: 'Important',
                                color: AppColors.important_color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: CommonButton(
            text: 'Save',
            onTap: () {
              saveForm();
            },
          ),
        ),
      ),
    );
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final event = EventModel(
        title: titleController.text,
        description: descController.text,
        from: fromDate,
        to: toDate,
        color: selectedColor,
      );
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.addEvent(event);
      Navigator.pop(context);
    }
  }

  Future deleteForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final event = EventModel(
        title: titleController.text,
        description: descController.text,
        from: fromDate,
        to: toDate,
        color: selectedColor,
      );
      final provider = Provider.of<EventProvider>(context, listen: false);
      provider.deleteEvent(event);
      Navigator.pop(context);
    }
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
