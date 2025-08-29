// lib/components/custom_button.dart
import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class MainButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final double width;

  const MainButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColours.gold,
    this.textStyle,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(color: backgroundColor),
        alignment: Alignment.center,
        child: Text(
          label,
          style: textStyle ?? TextStyles.size14WeightBoldConthraxSemiBoldblack,
        ),
      ),
    );
  }
}
