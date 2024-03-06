import 'package:flutter/material.dart';
import 'package:time_master/src/core/constants/app_colors.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? weight;
  final TextStyle? textStyle;
  final TextAlign? text_align;
  final double? size;

  const CommonText({
    Key? key,
    required this.text,
    this.color = AppColors.black_color,
    this.weight = FontWeight.w500,
    this.textStyle,
    this.text_align,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
      textAlign: text_align,
    );
  }
}
