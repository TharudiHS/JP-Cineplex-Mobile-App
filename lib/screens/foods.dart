import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar2.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class FoodsPage extends StatelessWidget {
  const FoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JPAppBar2(title: "Food & Drink"),
            const SizedBox(height: 30),

            // Category Tabs
            _selectTabs(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // Category Tabs
  Widget _selectTabs() {
    return Row(
      children: [
        _arrowButton(Icons.chevron_left),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _selectTab("ALL", true),
                _selectTab("Promotions", false),
                _selectTab("Combos", false),
                _selectTab("Beverages", false),
                _selectTab("Popcorn", false),
                _selectTab("Packaged Drinks", false),
                _selectTab("Confectionery", false),
                _selectTab("Chips", false),
                _selectTab("Ice cream", false),
              ],
            ),
          ),
        ),
        _arrowButton(Icons.chevron_right),
      ],
    );
  }

  Widget _selectTab(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? AppColours.gold : const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? AppColours.black : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _arrowButton(IconData icon) {
    return Container(
      color: AppColours.gold,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Icon(icon, color: AppColours.black, size: 22),
    );
  }
}
