import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_master/src/core/common/common_text.dart';
import 'package:time_master/src/feautures/tab_bar_screens/tab_bar_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: CommonText(text: 'Planner'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              TabBarWidget(),
              // Row(
              //   children: <Widget>[
              //     CommonText(
              //       text: 'View',
              //      size: 20,
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
