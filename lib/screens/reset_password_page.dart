import 'package:flutter/material.dart';
import 'package:jp_cinema_app/screens/verification.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController emailController = TextEditingController();

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
                const SizedBox(height: 80),

                // Title
                Text(
                  "Reset Password",
                  style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColours.white,
                  ),
                ),
                const SizedBox(height: 50),

                // Email Field
                _buildInputField(
                  label: "Email or Mobile Number",
                  controller: emailController,
                ),
                const SizedBox(height: 30),

                // Reset Button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VerificationPage(),
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
                      "RESET Now",
                      style: TextStyles.size14WeightBoldConthraxSemiBold
                          .copyWith(color: AppColours.black, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Back to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
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

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with red asterisk
        RichText(
          text: TextSpan(
            text: "$label ",
            style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
              fontSize: 12,
              color: AppColours.lightGrey,
            ),
            children: [
              TextSpan(
                text: "*",
                style: TextStyle(
                  color: AppColours.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        // Input field
        TextField(
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
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
      ],
    );
  }
}
