import 'package:flutter/material.dart';
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
                // Logo
                Image.asset(
                  'assets/images/JP_cineplex.png',
                  width: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 60),

                // Title
                Text(
                  "New Password",
                  style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColours.white,
                  ),
                ),
                const SizedBox(height: 40),

                // New Password Field
                _buildInputField(
                  label: "New Password",
                  hint: "Type Your New Password",
                  controller: newPasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                // Confirm Password Field
                _buildInputField(
                  label: "Confirm Password",
                  hint: "Re-enter Your Password",
                  controller: confirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 40),

                // Reset Now Button
                GestureDetector(
                  onTap: () {
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          "$label:",
          style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
            fontSize: 12,
            color: AppColours.lightGrey,
          ),
        ),
        const SizedBox(height: 6),

        // Input
        TextField(
          controller: controller,
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColours.lightGrey, fontSize: 12),
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
