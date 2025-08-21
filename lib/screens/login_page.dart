import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jp_cinema_app/screens/reset_password_page.dart';
import 'package:jp_cinema_app/screens/signup_page.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

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
                  "Login",
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
                const SizedBox(height: 16),

                // Password Field
                _buildInputField(
                  label: "Password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 10),

                // Remember me
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      activeColor: AppColours.gold,
                      checkColor: AppColours.black,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),
                    Text(
                      "Remember me",
                      style: TextStyles.size14WeightBoldConthraxSemiBold
                          .copyWith(fontSize: 12, color: AppColours.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Login Button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColours.gold,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "LOGIN",
                      style: TextStyles.size14WeightBoldConthraxSemiBold
                          .copyWith(color: AppColours.black, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Divider OR
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColours.lightGrey,
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR",
                        style: TextStyles.size14WeightBoldConthraxSemiBold
                            .copyWith(
                              color: AppColours.lightGrey,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColours.lightGrey,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Social Logins
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/facebook.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 20),
                    SvgPicture.asset(
                      'assets/images/google.svg',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account yet? ",
                      style: TextStyles.size14WeightBoldConthraxSemiBold
                          .copyWith(fontSize: 12, color: AppColours.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyles.size14WeightBoldConthraxSemiBold
                            .copyWith(fontSize: 12, color: AppColours.gold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Forgot Password
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot Password?",
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
