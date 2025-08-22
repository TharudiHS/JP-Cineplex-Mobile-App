import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/custom_button.dart';
import 'package:jp_cinema_app/screens/login_page.dart';
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
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/JP_cineplex.png',
                  width: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 90),

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
                  style: TextStyles.size20WeightBoldConthraxSemiBold,
                ),
                const SizedBox(height: 10),

                // Subtitle
                Text(
                  "Your password has been updated!",
                  style: TextStyles.size14PromptLight,
                ),
                const SizedBox(height: 40),

                // Back to Login Button using CustomButton
                CustomButton(
                  label: "BACK TO LOGIN",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
