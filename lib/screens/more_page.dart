import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
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
          _menuItem("About"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Screens"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Deals & Offers"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Experiences"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Careers"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Customer Service"),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Settings", showIcon: false),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),
          _menuItem("Log Out", showIcon: false),
          Divider(color: AppColours.lightGrey.withOpacity(0.4)),

          const SizedBox(height: 30),
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
                    SizedBox(width: 12),
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

  Widget _menuItem(String label, {bool showIcon = true}) {
    return ListTile(
      title: Text(label, style: TextStyles.size16PromptLight),
      trailing: showIcon
          ? const Icon(Icons.open_in_new, color: Colors.grey, size: 18)
          : null,
      onTap: () {},
    );
  }
}
