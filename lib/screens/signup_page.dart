import 'package:flutter/material.dart';
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

  String? gender; // Male / Female / Other
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
                  // logo
                  Image.asset('assets/images/JP_cineplex.png', width: 100),
                  const SizedBox(height: 28),

                  // title
                  Text(
                    'Sign up now',
                    textAlign: TextAlign.center,
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      fontSize: 20,
                      color: AppColours.white,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Full name (hint only)
                  _textField(
                    controller: fullNameCtrl,
                    hint: 'Full Name *',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 12),

                  // Email
                  _textField(
                    controller: emailCtrl,
                    hint: 'Email Address *',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 12),

                  // Mobile
                  _textField(
                    controller: mobileCtrl,
                    hint: 'Mobile Number *',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),

                  // Gender dropdown styled like a field (hint only)
                  _genderField(),
                  const SizedBox(height: 12),

                  // Date of Birth (opens date picker)
                  GestureDetector(
                    onTap: _pickDate,
                    child: AbsorbPointer(
                      child: _textField(
                        controller: dobCtrl,
                        hint: 'Date of Birth',
                        suffixIcon: const Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Password
                  _textField(
                    controller: passwordCtrl,
                    hint: 'Password *',
                    obscureText: _hidePassword,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        _hidePassword ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: Colors.white70,
                      ),
                      onPressed: () =>
                          setState(() => _hidePassword = !_hidePassword),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Confirm Password
                  _textField(
                    controller: confirmPasswordCtrl,
                    hint: 'Confirm Password *',
                    obscureText: _hideConfirm,
                    suffixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        _hideConfirm ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: Colors.white70,
                      ),
                      onPressed: () =>
                          setState(() => _hideConfirm = !_hideConfirm),
                    ),
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
                            style: TextStyle(
                              color: AppColours.lightGrey,
                              fontSize: 11,
                            ),
                            children: [
                              TextSpan(
                                text: 'terms and conditions',
                                style: TextStyle(
                                  color: AppColours.gold,
                                  fontSize: 11,
                                ),
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'privacy policy',
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
                  const SizedBox(height: 14),

                  // SIGN UP button
                  GestureDetector(
                    onTap: _onSignUp,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColours.gold,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'SIGN UP',
                        style: TextStyles.size14WeightBoldConthraxSemiBold
                            .copyWith(color: AppColours.black, fontSize: 16),
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

  /// TextField that only shows a hint (no label)
  Widget _textField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColours.lightGrey, fontSize: 12),
        filled: true,
        fillColor: AppColours.darkGrey,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }

  /// Dropdown styled to look like the other fields, with hint only.
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
          hint: Text(
            'Gender',
            style: TextStyle(color: AppColours.lightGrey, fontSize: 12),
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

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
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
    if (picked != null) {
      dobCtrl.text =
          '${picked.day.toString().padLeft(2, '0')}/'
          '${picked.month.toString().padLeft(2, '0')}/'
          '${picked.year}';
    }
  }

  void _onSignUp() {
    if (fullNameCtrl.text.trim().isEmpty ||
        emailCtrl.text.trim().isEmpty ||
        mobileCtrl.text.trim().isEmpty ||
        gender == null ||
        dobCtrl.text.trim().isEmpty ||
        passwordCtrl.text.isEmpty ||
        confirmPasswordCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }
    if (passwordCtrl.text != confirmPasswordCtrl.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match.')));
      return;
    }
    if (!agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must agree to the terms & conditions.'),
        ),
      );
      return;
    }
  }
}
