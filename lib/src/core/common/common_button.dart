import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CommonButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primary_color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
