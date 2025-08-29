import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/components/text_form_field.dart';

import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: AppBar(
        backgroundColor: AppColours.black,
        elevation: 0,
        title: Text(
          "Edit Profile",
          style: TextStyles.size16WeightBoldConthraxSemiBold,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info label
            Text(
              "Profile information:",
              style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
            ),
            const SizedBox(height: 10),

            // Name
            CustomTextFormField(controller: nameController, hint: "Full Name"),
            const SizedBox(height: 12),

            // Email
            CustomTextFormField(
              controller: emailController,
              hint: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),

            // Phone
            CustomTextFormField(
              controller: phoneController,
              hint: "Phone Number",
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),

            // Gender Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: AppColours.darkGrey,
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<String>(
                value: "Female",
                dropdownColor: AppColours.darkGrey,
                isExpanded: true,
                underline: const SizedBox(),
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(value: "Male", child: Text("Male")),
                  DropdownMenuItem(value: "Female", child: Text("Female")),
                  DropdownMenuItem(value: "Other", child: Text("Other")),
                ],
                onChanged: (value) {},
              ),
            ),
            const SizedBox(height: 12),

            // DOB
            CustomTextFormField(
              controller: dobController,
              hint: "Date of Birth",
              suffixIcon: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Password Section
            Text(
              "New Password:",
              style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: passwordController,
              hint: "Type Your New Password",
              isPassword: true,
            ),
            const SizedBox(height: 12),

            Text(
              "Confirm password:",
              style: TextStyles.size13WeightBoldConthraxSemiBoldgreyC2,
            ),
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
                // Save action
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
