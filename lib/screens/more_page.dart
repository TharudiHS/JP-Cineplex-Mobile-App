import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/screens/setting_page.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "More"),
      body: ListView(
        children: [
          _menuItem(context, "About"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Screens"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Deals & Offers"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Experiences"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Careers"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Customer Service"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Settings", showIcon: false),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem(context, "Log Out", showIcon: false),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),

          const SizedBox(height: 30),

          // Footer section
          Center(
            child: Column(
              children: [
                const Text(
                  "©2025 JP Cineplex",
                  style: TextStyles.size12Promptwhitegold,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Terms & Conditions",
                      style: TextStyles.size12PromptLight.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "FAQs",
                      style: TextStyles.size12PromptLight.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Image.asset("assets/images/JP_cineplex.png", height: 50),
                const SizedBox(height: 8),
                const Text(
                  "Developed by Archmage Solutions",
                  style: TextStyles.size12Promptwhitegold,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  /// Updated: now takes [BuildContext] so navigation works
  Widget _menuItem(BuildContext context, String label, {bool showIcon = true}) {
    return ListTile(
      title: Text(label, style: TextStyles.size16PromptLight),
      trailing: showIcon
          ? const Icon(Icons.open_in_new, color: Colors.grey, size: 18)
          : null,
      onTap: () {
        if (label == "Settings") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SettingsPage()),
          );
        }
      },
    );
  }
}
