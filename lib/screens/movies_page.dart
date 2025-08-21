import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';
import 'package:jp_cinema_app/screens/home_page.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // JP Cineplex Logo + Home
            Container(
              color: AppColours.grey11,
              padding: const EdgeInsets.symmetric(vertical: 18),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset("assets/images/JP_cineplex.png", height: 50),
                  const SizedBox(height: 15),
                  Container(
                    height: 0.1,
                    width: 370,
                    color: AppColours.lightGrey,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Movies",
                    style: TextStyles.size16WeightBoldConthraxSemiBold,
                  ),
                ],
              ),
            ),

            // Search bar
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColours.grey11),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: AppColours.greyC2),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),

            // Tabs (Now Showing / Coming Soon / See It First)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Now Showing",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      color: AppColours.gold,
                    ),
                  ),
                  const SizedBox(width: 18),
                  Text(
                    "Coming Soon",
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    "See It First",
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Movies List
            _movieItem(
              "assets/images/madha_raja.jpg",
              "Madha Gaja Raja",
              "2h 30m",
            ),
            _movieItem("assets/images/Moana2.jpg", "Moana 2", "2h 30m"),
            _movieItem("assets/images/game.jpg", "Game Changer", "2h 30m"),
            _movieItem("assets/images/sonic3.jpeg", "The Hedgehog 3", "2h 30m"),
            _movieItem(
              "assets/images/denof.jpeg",
              "Den of Thieves 2 Pantera",
              "2h 30m",
            ),

            const SizedBox(height: 30),

            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: AppColours.darkGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _pngNavItem("assets/images/home.png", "Home", context),
                  _pngNavItem("assets/images/movies.png", "Movies", context),
                  _pngNavItem("assets/images/book.png", "Book", context),
                  _pngNavItem(
                    "assets/images/food.png",
                    "Food & Drink",
                    context,
                  ),
                  _pngNavItem("assets/images/more.png", "More", context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Movie Item widget
  static Widget _movieItem(String img, String title, String duration) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(img, height: 150, width: 130, fit: BoxFit.cover),
          ),
          const SizedBox(width: 20),

          // Movie Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.size15Promptwhite),
                const SizedBox(height: 8),

                // Genre tags
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _tag("ACTION", AppColours.grey58, Colors.white),
                    _tag("SCI-FI", AppColours.grey75, Colors.white),
                    _tag("DRAMA", AppColours.goldDark, AppColours.black),
                    _tag("2D", AppColours.purple, Colors.white),
                    _tag("3D", AppColours.orange, Colors.white),
                    _tag("DOLBY ATMOS", AppColours.blue, Colors.white),
                    _tag("U/A", AppColours.green, Colors.white),
                  ],
                ),

                const SizedBox(height: 6),

                Text(duration, style: TextStyles.size12Promptwhite),

                const SizedBox(height: 6),

                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      const Icon(
                        Icons.play_circle_outline,
                        color: AppColours.gold,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "Play Trailer",
                        style: TextStyles.size14PromptLight.copyWith(
                          color: AppColours.gold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Genre Tag
  static Widget _tag(String text, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: bg),
      child: Text(text, style: TextStyles.size10Promptwhite),
    );
  }

  // Bottom Nav Item
  static Widget _pngNavItem(
    String iconPath,
    String label,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        if (label == "Home") {
          Navigator.pushNamed(context, "/home");
        } else if (label == "Movies") {
          Navigator.pushNamed(context, "/movies");
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 25, width: 25),
          const SizedBox(height: 6),
          Text(label, style: TextStyles.size11WeightBoldConthraxSemiBoldgold),
        ],
      ),
    );
  }
}
