import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar1.dart';
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

                //  hint text inside the black box
                TextField(
                  controller: emailOrMobileController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hint: RichText(
                      text: TextSpan(
                        text: "Email Address or Mobile Number ",
                        style:
                            TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
                        children: [
                          TextSpan(
                            text: "*",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    filled: true,
                    fillColor: AppColours.darkGrey,
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 9,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: AppColours.gold),
                    alignment: Alignment.center,
                    child: Text(
                      "RESET NOW",
                      style: TextStyles.size14WeightBoldConthraxSemiBoldblack,
                    ),
                  ),
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
