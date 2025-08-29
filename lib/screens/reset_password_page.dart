import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar1.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/components/text_form_field.dart';
import 'package:jp_cinema_app/screens/login_page.dart';
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
                const JPAppBar1(title: "Reset your Password"),

                // Instruction
                Text(
                  "Enter your email address or mobile number below.",
                  textAlign: TextAlign.center,
                  style: TextStyles.size12PromptLight,
                ),
                const SizedBox(height: 40),

                CustomTextFormField(
                  controller: emailOrMobileController,
                  hint: "Email Address or Mobile Number",
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 30),

                // RESET NOW button
                MainButton(
                  label: "RESET NOW",
                  onPressed: () {
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
                ),

                const SizedBox(height: 45),

                // Back to Login
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Back to ",
                          style: TextStyles.size14PromptLight.copyWith(
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextSpan(
                          text: "Login",
                          style: TextStyles.size14PromptLightgold.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
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
