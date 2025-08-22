// lib/components/app_bar2.dart
import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class JPAppBar2 extends StatelessWidget {
  final String title;

  const JPAppBar2({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.grey11,
      padding: const EdgeInsets.symmetric(vertical: 18),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset("assets/images/JP_cineplex.png", height: 50),
          const SizedBox(height: 15),

          // Divider line
          Container(height: 0.1, width: 370, color: AppColours.lightGrey),
          const SizedBox(height: 20),

          // Page Title
          Text(title, style: TextStyles.size16WeightBoldConthraxSemiBold),
        ],
      ),
    );
  }
}
