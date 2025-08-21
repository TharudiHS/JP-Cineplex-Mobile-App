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
            // JP Cineplex Logo + Home
            Container(
              color: AppColours.darkGrey, // dark grey background here
              padding: const EdgeInsets.symmetric(vertical: 18),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset("assets/images/JP_cineplex.png", height: 50),
                  const SizedBox(height: 15),
                  Container(height: 1, width: 350, color: AppColours.greyC2),
                  const SizedBox(height: 20),
                  Text(
                    "Home",
                    style: TextStyles.size16WeightBoldConthraxSemiBold,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // My Orders
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Orders",
                    style: TextStyles.size18WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No upcoming orders… / 02 Movie tickets ordered →",
                    style: TextStyles.size14PromptLight,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "ALL TICKET ORDERS →",
                      style: TextStyles.size14WeightBoldConthraxSemiBoldgold,
                    ),
                  ),
                ],
              ),
            ),

            _divider(),

            // Now Showing / Coming Soon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    "Now Showing",
                    style: TextStyles.size18WeightBoldConthraxSemiBold.copyWith(
                      color: AppColours.gold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "Coming Soon",
                    style: TextStyles.size18WeightBoldConthraxSemiBold,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Movie Posters
            SizedBox(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                children: [
                  _movieCard("assets/images/madha_raja.jpg", "Madha Gaja Raja"),
                  _movieCard("assets/images/Moana2.jpg", "Moana 2"),
                  _movieCard("assets/images/game.jpg", "Game Changer"),
                ],
              ),
            ),

            _divider(),

            // SEE IT FIRST SECTION
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyles.size14WeightBoldConthraxSemiBold,
                  children: [
                    TextSpan(
                      text: "See It ",
                      style: const TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: "First",
                      style: TextStyle(color: AppColours.gold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Three Movies under See it First
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _movieCard("assets/images/sonic3.jpeg", "The Hedgehog 3"),
                  _movieCard(
                    "assets/images/denof.jpeg",
                    "Den of Thieves 2 Pantera",
                  ),
                  _movieCard("assets/images/Moana2.jpg", "Moana 2"),
                ],
              ),
            ),

            _divider(),

            // Screens Section
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
            Image.asset("assets/images/screens.png"),
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
                  backgroundColor: AppColours.black, // dark bg
                  foregroundColor: AppColours.gold,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 1,
                  ), // white border
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

            _divider(),

            // Deals
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
              "assets/images/deal_upgrade.png",
              "Upgrade Your Experience",
            ),
            _dealCard(
              "assets/images/deal_half_price.png",
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

            // Bottom Navigation with PNG icons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: AppColours.darkGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _pngNavItem("assets/images/home.png", "Home"),
                  _pngNavItem("assets/images/movies.png", "Movies"),
                  _pngNavItem("assets/images/book.png", "Book"),
                  _pngNavItem("assets/images/food.png", "Food & Drink"),
                  _pngNavItem("assets/images/more.png", "More"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Divider widget
  static Widget _divider() {
    return Column(
      children: [
        const SizedBox(height: 30),
        Container(height: 1, width: 350, color: AppColours.greyC2),
        const SizedBox(height: 30),
      ],
    );
  }

  // Movie Card Widget
  // Movie Card Widget
  static Widget _movieCard(String imgPath, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Movie Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imgPath,
              height: 180,
              fit: BoxFit.cover,
              width: 150,
            ),
          ),
          const SizedBox(height: 10),

          // Movie Title
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.size12PromptLight,
          ),
          const SizedBox(height: 10),

          // Times & Tickets Button
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 36), // full width button
              side: const BorderSide(color: Colors.white),
              backgroundColor: AppColours.black,
              foregroundColor: AppColours.gold,
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
