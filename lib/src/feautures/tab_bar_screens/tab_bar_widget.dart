import 'package:flutter/material.dart';
import 'package:time_master/src/core/common/common_text.dart';
import 'package:time_master/src/core/constants/app_colors.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CommonText(text: 'View', size: 20),
        TabBar(
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.transparent,
          ),
          controller: tabController,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(horizontal: 15),
          tabs: [
            Expanded(child: _buildTab('Day', tabController.index == 0)),
            Expanded(child: _buildTab('Week', tabController.index == 1)),
            Expanded(child: _buildTab('Month', tabController.index == 2)),
            // Tab(child: Text('Day')),
            // Tab(child: Text('Week')),
            // Tab(child: Text('Month')),
          ],
        ),
      ],
    );
  }
}

Widget _buildTab(String text, bool isSelected) {
  return Tab(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary_color : Colors.transparent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
