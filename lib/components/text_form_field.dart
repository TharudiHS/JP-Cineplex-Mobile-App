// lib/components/text_form.dart
import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final bool isRequired;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.isPassword = false,
    this.isRequired = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.backgroundColor = AppColours.darkGrey,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hint: RichText(
          text: TextSpan(
            text: hint,
            style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
            children: isRequired
                ? [
                    const TextSpan(
                      text: " *",
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        filled: true,
        fillColor: backgroundColor,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }
}
