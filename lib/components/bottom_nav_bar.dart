import 'package:flutter/material.dart';
import 'package:jp_cinema_app/screens/more_page.dart';
import 'package:jp_cinema_app/screens/movie_bookpage.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';
import '../screens/home_page.dart';
import '../screens/movies_page.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: AppColours.darkGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _pngNavItem("assets/images/home.png", "Home", selectedIndex == 0, () {
            if (selectedIndex != 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            }
          }),
          _pngNavItem(
            "assets/images/movies.png",
            "Movies",
            selectedIndex == 1,
            () {
              if (selectedIndex != 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MoviesPage()),
                );
              }
            },
          ),
          _pngNavItem("assets/images/book.png", "Book", selectedIndex == 2, () {
            if (selectedIndex != 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MovieBookPage()),
              );
            }
          }),
          _pngNavItem(
            "assets/images/food.png",
            "Food & Drink",
            selectedIndex == 3,
            null,
          ),
          _pngNavItem("assets/images/more.png", "More", selectedIndex == 4, () {
            if (selectedIndex != 4) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MorePage()),
              );
            }
          }),
        ],
      ),
    );
  }

  static Widget _pngNavItem(
    String iconPath,
    String label,
    bool isSelected,
    VoidCallback? onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            height: 25,
            width: 25,
            color: isSelected ? AppColours.gold : Colors.white,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: isSelected
                ? TextStyles.size11WeightBoldConthraxSemiBoldgold
                : TextStyles.size11WeightBoldConthraxSemiBoldgold,
          ),
        ],
      ),
    );
  }
}
