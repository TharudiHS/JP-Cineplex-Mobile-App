import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jp_cinema_app/components/app_bar1.dart';
import 'package:jp_cinema_app/components/text_form_field.dart';
import 'package:jp_cinema_app/screens/home_page.dart';
import 'package:jp_cinema_app/screens/reset_password_page.dart';
import 'package:jp_cinema_app/screens/signup_page.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';
import '../components/main_button.dart';

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
                const JPAppBar1(title: "Login"),

                // Email Field
                CustomTextFormField(
                  controller: emailController,
                  hint: "Enter your email or mobile number",
                  isRequired: true,
                ),

                const SizedBox(height: 16),

                // Password Field
                CustomTextFormField(
                  controller: passwordController,
                  hint: "Password",
                  isPassword: true,
                  isRequired: true,
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
                      style: TextStyles.size14PromptLightgold,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Login Button
                CustomButton(
                  label: "LOGIN",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
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
                      child: Text("OR", style: TextStyles.size14PromptRegular),
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
                      "Don't have an account yet? ",
                      style: TextStyles.size14PromptLight,
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
                        style: TextStyles.size14PromptLightgold,
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
                    style: TextStyles.size14PromptLightgold,
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
