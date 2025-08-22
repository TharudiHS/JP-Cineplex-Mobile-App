// lib/components/app_bar1.dart
import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class JPAppBar1 extends StatelessWidget {
  final String title;

  const JPAppBar1({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Image.asset(
          'assets/images/JP_cineplex.png',
          width: 100,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 90),

        // Title
        Text(title, style: TextStyles.size20WeightBoldConthraxSemiBold),
        const SizedBox(height: 40),
      ],
    );
  }
}
