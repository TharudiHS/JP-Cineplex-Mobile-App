import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Profile information",
              style: TextStyles.size16WeightBoldConthraxSemiBold,
            ),
            const SizedBox(height: 22),
            _infoRow("Full Name:", "Kanchani Rathnayake"),
            const SizedBox(height: 15),
            _infoRow("Email Address:", "kanchanirathnayake@gmail.com"),
            const SizedBox(height: 15),
            _infoRow("Mobile Number:", "07771287198"),
            const SizedBox(height: 15),
            _infoRow("Gender:", "Female"),
            const SizedBox(height: 15),
            _infoRow("Date of Birth:", "1998/12/12"),
            const SizedBox(height: 15),
            Divider(color: AppColours.lightGrey.withOpacity(0.4)),
            _infoRow("Password:", "********"),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // TODO: Add edit profile logic
              },
              child: Text(
                "Edit Profile",
                style: TextStyles.size12Promptwhitegold.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label, style: TextStyles.size14PromptLight),
          ),
          Expanded(child: Text(value, style: TextStyles.size15Promptwhite)),
        ],
      ),
    );
  }
}
