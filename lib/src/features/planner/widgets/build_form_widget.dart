import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';

class BuildFormWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double width;

  const BuildFormWidget({
    super.key,
    required this.text,
    required this.onClicked,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.grey_color),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.grey_color,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
