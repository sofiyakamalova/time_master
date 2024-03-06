import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_master/src/core/common/common_text.dart';
import 'package:time_master/src/feautures/planner/tab_bar_screens/tab_bar_widget.dart';

@RoutePage()
class PlannerPage extends StatelessWidget {
  const PlannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: CommonText(text: 'Planner'),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TabBarWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
