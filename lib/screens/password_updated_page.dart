import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class PasswordUpdatedPage extends StatelessWidget {
  const PasswordUpdatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Image.asset('assets/images/traditional_bg.png', fit: BoxFit.cover),

          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/JP_cineplex.png',
                width: 100,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 60),

              // Success Check Icon
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(18),
                child: const Icon(Icons.check, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 40),

              // Title
              Text(
                "Password Updated",
                style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                  fontSize: 20,
                  color: AppColours.white,
                ),
              ),
              const SizedBox(height: 10),

              // Subtitle
              Text(
                "Your password has been updated!",
                style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                  fontSize: 12,
                  color: AppColours.lightGrey,
                ),
              ),
              const SizedBox(height: 40),

              // Back to Login Button
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColours.gold,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "BACK TO LOGIN",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      color: AppColours.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
