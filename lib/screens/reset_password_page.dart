import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';
import 'verification.dart'; // adjust path if this file lives elsewhere

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailOrMobileController = TextEditingController();

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
                const SizedBox(height: 60),

                // Title
                Text(
                  "Reset Password",
                  style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColours.white,
                  ),
                ),
                const SizedBox(height: 16),

                // Instruction (as in your screenshot)
                Text(
                  "Enter your email address or mobile number below.",
                  textAlign: TextAlign.center,
                  style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                    fontSize: 12,
                    color: AppColours.lightGrey,
                  ),
                ),
                const SizedBox(height: 30),

                // Input box with hint text inside the black box
                TextField(
                  controller: emailOrMobileController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Email or Mobile Number",
                    hintStyle: TextStyle(
                      color: AppColours.lightGrey,
                      fontSize: 12,
                    ),
                    filled: true,
                    fillColor: AppColours.darkGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // RESET NOW button
                GestureDetector(
                  onTap: () {
                    final value = emailOrMobileController.text.trim();
                    if (value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Please enter your email address or mobile number.",
                          ),
                        ),
                      );
                      return;
                    }
                    // Navigate to Verification screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const VerificationPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColours.gold,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "RESET NOW",
                      style: TextStyles.size14WeightBoldConthraxSemiBold
                          .copyWith(color: AppColours.black, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Back to Login
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "Back to Login",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      fontSize: 12,
                      color: AppColours.gold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
