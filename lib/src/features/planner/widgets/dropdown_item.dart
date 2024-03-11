import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';

class DropdownItem extends StatelessWidget {
  final String text;
  final Color color;
  const DropdownItem({
    super.key,
    required this.text,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 72,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
            border: Border.all(width: 1.5, color: AppColors.primary_color),
          ),
        ),
      ],
    );
  }
}
