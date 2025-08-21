import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dobController = TextEditingController();

  String? selectedGender;
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/traditional_bg.png', fit: BoxFit.cover),

          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              children: [
                // Logo
                Image.asset(
                  'assets/images/JP_cineplex.png',
                  width: 100,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 40),

                // Title
                Text(
                  "Sign up now",
                  style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                    fontSize: 20,
                    color: AppColours.white,
                  ),
                ),
                const SizedBox(height: 40),

                // Full Name
                _buildInputField(
                  "Full Name *",
                  "Enter your full name",
                  fullNameController,
                ),
                const SizedBox(height: 16),

                // Email
                _buildInputField(
                  "Email Address *",
                  "Enter your email",
                  emailController,
                ),
                const SizedBox(height: 16),

                // Mobile
                _buildInputField(
                  "Mobile Number *",
                  "Enter your mobile number",
                  mobileController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),

                // Gender Dropdown
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Gender *",
                      style: TextStyles.size14WeightBoldConthraxSemiBold
                          .copyWith(fontSize: 12, color: AppColours.lightGrey),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColours.darkGrey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedGender,
                          dropdownColor: AppColours.darkGrey,
                          hint: Text(
                            "Select Gender",
                            style: TextStyle(
                              color: AppColours.lightGrey,
                              fontSize: 12,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                          items: ["Male", "Female", "Other"]
                              .map(
                                (gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Date of Birth
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.dark(
                              primary: AppColours.gold,
                              onPrimary: Colors.black,
                              surface: AppColours.darkGrey,
                              onSurface: Colors.white,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      dobController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                  child: AbsorbPointer(
                    child: _buildInputField(
                      "Date of Birth",
                      "Select your date of birth",
                      dobController,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                _buildInputField(
                  "Password *",
                  "Enter your password",
                  passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 16),

                // Confirm Password
                _buildInputField(
                  "Confirm Password *",
                  "Re-enter your password",
                  confirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                // Terms & Conditions Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      activeColor: AppColours.gold,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: "By signing up you agree to the website ",
                          style: TextStyle(
                            color: AppColours.lightGrey,
                            fontSize: 11,
                          ),
                          children: [
                            TextSpan(
                              text: "terms and conditions",
                              style: TextStyle(
                                color: AppColours.gold,
                                fontSize: 11,
                              ),
                            ),
                            const TextSpan(text: " and "),
                            TextSpan(
                              text: "privacy policy",
                              style: TextStyle(
                                color: AppColours.gold,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Sign Up Button
                GestureDetector(
                  onTap: () {
                    if (!_validateInputs()) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Account created successfully!"),
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
                      "SIGN UP",
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

  Widget _buildInputField(
    String label,
    String hint,
    TextEditingController controller, {
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
            fontSize: 12,
            color: AppColours.lightGrey,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
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

  bool _validateInputs() {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        mobileController.text.isEmpty ||
        selectedGender == null ||
        dobController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all required fields.")),
      );
      return false;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match.")));
      return false;
    }

    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You must agree to the terms & conditions."),
        ),
      );
      return false;
    }

    return true;
  }
}
