import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar1.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/screens/new_password_page.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

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
                const JPAppBar1(title: "Verification"),

                // Subtitle
                Text(
                  "Enter the verification code sent to your \nmobile or email",
                  textAlign: TextAlign.center,
                  style: TextStyles.size14PromptLight,
                ),
                const SizedBox(height: 40),

                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: TextField(
                        controller: _otpControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: AppColours.darkGrey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),

                // Verify Button
                CustomButton(
                  label: "VERIFY",
                  onPressed: () {
                    String otp = _otpControllers.map((c) => c.text).join();
                    if (otp.length == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewPasswordPage(),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 20),

                // Resend Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive a code?",
                      style: TextStyles.size14PromptLight.copyWith(
                        decoration: TextDecoration.none,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Resend Now",
                        style: TextStyles.size14PromptLightgold.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
