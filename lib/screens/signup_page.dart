import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar1.dart';
import 'package:jp_cinema_app/screens/login_page.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController mobileCtrl = TextEditingController();
  final TextEditingController dobCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();

  String? gender;
  bool agreeToTerms = false;
  bool _hidePassword = true;
  bool _hideConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // background
          Image.asset('assets/images/traditional_bg.png', fit: BoxFit.cover),

          // content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  const JPAppBar1(title: "Sign up now"),

                  // Full name
                  _textField(
                    controller: fullNameCtrl,
                    hint: 'Full Name',
                    required: true,
                  ),
                  const SizedBox(height: 14),

                  // Email
                  _textField(
                    controller: emailCtrl,
                    hint: 'Email Address',
                    required: true,
                  ),
                  const SizedBox(height: 14),

                  // Mobile
                  _textField(
                    controller: mobileCtrl,
                    hint: 'Mobile Number',
                    required: true,
                  ),
                  const SizedBox(height: 14),

                  // Gender
                  _genderField(),
                  const SizedBox(height: 14),

                  // Date of Birth (just plain field with calendar icon)
                  _textField(
                    controller: dobCtrl,
                    hint: 'Date of Birth',
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Password
                  _textField(
                    controller: passwordCtrl,
                    hint: 'Password',
                    required: true,
                    obscureText: _hidePassword,
                  ),
                  const SizedBox(height: 14),

                  // Confirm Password
                  _textField(
                    controller: confirmPasswordCtrl,
                    hint: 'Confirm Password',
                    required: true,
                    obscureText: _hideConfirm,
                  ),
                  const SizedBox(height: 16),

                  // Terms & conditions
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: agreeToTerms,
                        activeColor: AppColours.gold,
                        checkColor: Colors.black,
                        side: BorderSide(color: AppColours.lightGrey),
                        onChanged: (v) =>
                            setState(() => agreeToTerms = v ?? false),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'By signing up you agree to the website ',
                            style: TextStyles.size14PromptLight,
                            children: [
                              TextSpan(
                                text: 'terms and conditions',
                                style: TextStyles.size14PromptLightgold
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'privacy policy',
                                style: TextStyles.size14PromptLightgold
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // SIGN UP button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color: AppColours.gold),
                      alignment: Alignment.center,
                      child: Text(
                        'SIGN UP',
                        style: TextStyles.size14WeightBoldConthraxSemiBoldblack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// TextField with red * at end if required
  Widget _textField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    bool required = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hint: RichText(
          text: TextSpan(
            text: hint,
            style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
            children: required
                ? [
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ]
                : [],
          ),
        ),
        filled: true,
        fillColor: AppColours.darkGrey,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }

  /// Dropdown style
  Widget _genderField() {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColours.darkGrey,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: gender,
          dropdownColor: AppColours.darkGrey,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white70),
          style: const TextStyle(color: Colors.white),
          hint: RichText(
            text: const TextSpan(
              text: 'Gender',
              style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
              children: [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
            DropdownMenuItem(value: 'Other', child: Text('Other')),
          ],
          onChanged: (v) => setState(() => gender = v),
        ),
      ),
    );
  }
}
