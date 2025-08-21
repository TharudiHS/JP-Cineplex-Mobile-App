import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo + Line + Home Title
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset("assets/images/JP_cineplex.png", height: 50),
                  const SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.white, // White divider line
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Home",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // My Orders
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Orders",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "No upcoming orders… / 02 Movie tickets ordered",
                    style: TextStyles.size14PromptLight.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "ALL TICKET ORDERS →",
                      style: TextStyles.size14PromptLightgold,
                    ),
                  ),
                ],
              ),
            ),

            // Now Showing / Coming Soon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Now Showing",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      color: AppColours.gold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Coming Soon",
                    style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Movie Posters
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _movieCard(
                    "assets/images/madha_gaja_raja.jpg",
                    "Madha Gaja Raja",
                  ),
                  _movieCard("assets/images/moana2.jpg", "Moana 2"),
                  _movieCard("assets/images/ghost_hunter.jpg", "Ghost Hunter"),
                ],
              ),
            ),

            // --- SEE IT FIRST SECTION ---
            const SizedBox(height: 20),
            Center(
              child: Text(
                "See It First",
                style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                  color: AppColours.gold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Bottom Navigation with PNG icons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: AppColours.darkGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _pngNavItem("assets/icons/home.png", "Home"),
                  _pngNavItem("assets/icons/movies.png", "Movies"),
                  _pngNavItem("assets/icons/book.png", "Book"),
                  _pngNavItem("assets/icons/food.png", "Food & Drink"),
                  _pngNavItem("assets/icons/more.png", "More"),
                ],
              ),
            ),

            // Three Movies under See it First
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _movieCard("assets/images/sonic3.jpg", "The Hedgehog 3"),
                  _movieCard(
                    "assets/images/den_of_thieves2.jpg",
                    "Den of Thieves 2 Pantera",
                  ),
                  _movieCard("assets/images/moana2.jpg", "Moana 2"),
                ],
              ),
            ),

            // Screens
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Screens",
                style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Image.asset("assets/images/screen1.jpg"),
            const SizedBox(height: 5),
            Center(
              child: Text(
                "Screen 1 - JP Cineplex Kandy",
                style: TextStyles.size14PromptLight.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColours.gold,
                  foregroundColor: AppColours.black,
                ),
                onPressed: () {},
                child: const Text("DISCOVER MORE"),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Text(
                "View More Screens ↓",
                style: TextStyles.size14PromptLightgold,
              ),
            ),

            // Deals
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Deals",
                style: TextStyles.size14WeightBoldConthraxSemiBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _dealCard(
              "assets/images/deal_upgrade.jpg",
              "Upgrade Your Experience",
            ),
            _dealCard(
              "assets/images/deal_half_price.jpg",
              "Half Price Wednesdays",
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "View More Deals ↓",
                style: TextStyles.size14PromptLightgold,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Movie Card Widget
  static Widget _movieCard(String imgPath, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 150,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imgPath, height: 180, fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColours.gold,
              foregroundColor: AppColours.black,
            ),
            onPressed: () {},
            child: const Text("TIMES & TICKETS"),
          ),
        ],
      ),
    );
  }

  // Navigation Item with PNG icons
  static Widget _pngNavItem(String iconPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(iconPath, height: 24, width: 24),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  // Deal Card
  static Widget _dealCard(String imgPath, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              imgPath,
              height: 120,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
