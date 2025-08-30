import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/components/text_form_field.dart';
import 'package:jp_cinema_app/screens/setting_page.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Controllers
  final TextEditingController nameController = TextEditingController(
    text: "Kanchani Rathnayake",
  );
  final TextEditingController emailController = TextEditingController(
    text: "kanchanirathnayake@gmail.com",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "07771287198",
  );
  final TextEditingController dobController = TextEditingController(
    text: "1998/12/12",
  );
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String gender = "Female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "Edit Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info label
            Text(
              "Profile information:",
              style: TextStyles.size14PromptLightwhite,
            ),
            const SizedBox(height: 10),

            // Name
            CustomTextFormField(controller: nameController, hint: "Full Name"),
            const SizedBox(height: 14),

            // Email
            CustomTextFormField(
              controller: emailController,
              hint: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 14),

            // Phone
            CustomTextFormField(
              controller: phoneController,
              hint: "Phone Number",
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 14),

            // Gender Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColours.darkGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                value: gender,
                dropdownColor: AppColours.darkGrey,
                isExpanded: true,
                underline: const SizedBox(),
                style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      gender = value;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 14),

            // DOB
            CustomTextFormField(
              controller: dobController,
              hint: "Date of Birth",
              textStyle: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Password Section
            Text("New Password:", style: TextStyles.size14PromptLightwhite),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: passwordController,
              hint: "Type Your New Password",
              isPassword: true,
            ),
            const SizedBox(height: 12),

            Text("Confirm password:", style: TextStyles.size14PromptLightwhite),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: confirmPasswordController,
              hint: "Re-Enter Your Password",
              isPassword: true,
            ),
            const SizedBox(height: 20),

            // Save Button
            MainButton(
              label: "SAVE",
              onPressed: () {
                if (passwordController.text.isNotEmpty &&
                    passwordController.text != confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Passwords do not match"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsPage()),
                );
              },
              backgroundColor: AppColours.gold,
              textStyle: TextStyles.size14WeightBoldConthraxSemiBoldblack,
            ),
          ],
        ),
      ),
    );
  }
}
