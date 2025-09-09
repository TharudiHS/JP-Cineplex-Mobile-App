import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar1.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/components/text_form_field.dart';
import 'package:jp_cinema_app/screens/password_updated_page.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                const JPAppBar1(title: "New Password"),

                // New Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New Password:", style: TextStyles.size14PromptLight),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      controller: newPasswordController,
                      hint: "Type Your New Password",
                      isPassword: true,
                      isRequired: false,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Confirm Password Field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Password:",
                      style: TextStyles.size14PromptLight,
                    ),
                    const SizedBox(height: 8),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      hint: "Re-enter Your Password",
                      isPassword: true,
                      isRequired: false,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Reset Now Button using CustomButton
                MainButton(
                  label: "RESET NOW",
                  onPressed: () {
                    String newPass = newPasswordController.text.trim();
                    String confirmPass = confirmPasswordController.text.trim();

                    if (newPass.isEmpty || confirmPass.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in both fields."),
                        ),
                      );
                      return;
                    }

                    if (newPass != confirmPass) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords do not match."),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PasswordUpdatedPage(),
                      ),
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
