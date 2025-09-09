import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar2.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/screens/order_details.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: JPAppBar2(title: "Home"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            // My Orders
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Orders",
                    style: TextStyles.size18WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "No upcoming orders… / 02 Movie tickets ordered",
                    style: TextStyles.size14PromptLight,
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OrderDetailsPage(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "ALL TICKET ORDERS",
                          style:
                              TextStyles.size14WeightBoldConthraxSemiBoldgold,
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColours.gold,
                          size: 22,
                        ),
                      ],
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _movieCard("assets/images/madha_raja.jpg", "Madha Gaja Raja"),
                  _movieCard("assets/images/Moana2.jpg", "Moana 2"),
                  _movieCard("assets/images/game.jpg", "Game Changer"),
                ],
              ),
            ),

            _divider(),

            // SEE IT FIRST SECTION
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyles.size18WeightBoldConthraxSemiBold,
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
            const SizedBox(height: 16),

            // Three Movies under See it First
            SizedBox(
              height: 350,
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
            Center(
              child: Text(
                "Screens",
                style: TextStyles.size18WeightBoldConthraxSemiBold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset("assets/images/screens.png"),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                "Screen 1 - JP Cineplex Kandy",
                style: TextStyles.size15Promptwhite,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColours.black,
                  foregroundColor: AppColours.gold,
                  side: const BorderSide(color: AppColours.grey5E, width: 2.5),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                ),
                onPressed: () {},
                child: const Text("DISCOVER MORE"),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset("assets/images/image.png"),
            ),
            const SizedBox(height: 12),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View More Screens",
                    style: TextStyles.size14WeightBoldConthraxSemiBoldgold,
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_downward, color: AppColours.gold, size: 22),
                ],
              ),
            ),

            _divider(),

            // Deals Section
            Center(
              child: Text(
                "Deals",
                style: TextStyles.size18WeightBoldConthraxSemiBold,
              ),
            ),
            const SizedBox(height: 16),

            // Upgrade Your Experience
            _dealCard(
              "assets/images/deal_upgrade.png",
              "Upgrade Your Experience",
            ),

            // Half Price Image Only
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/deal_half_price.png",
                  height: 170,
                ),
              ),
            ),

            const SizedBox(height: 16),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View More Deals",
                    style: TextStyles.size14WeightBoldConthraxSemiBoldgold,
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_downward, color: AppColours.gold, size: 22),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }

  static Widget _divider() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          height: 1,
          width: double.infinity,
          color: AppColours.lightGrey,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  static Widget _movieCard(String imgPath, String title) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image.asset(
              imgPath,
              height: 210,
              fit: BoxFit.cover,
              width: 150,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyles.size12PromptLight,
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 36),
              side: const BorderSide(color: Colors.white),
              backgroundColor: AppColours.black,
              foregroundColor: AppColours.gold,
            ),
            onPressed: () {},
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "TIMES & TICKETS",
                style: TextStyles.size12WeightBoldConthraxSemiBoldgold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _dealCard(String imgPath, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(imgPath, height: 250, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColours.black,
              foregroundColor: AppColours.gold,
              side: const BorderSide(color: AppColours.grey5E, width: 2.5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            onPressed: () {},
            child: const Text("MORE INFO"),
          ),
        ],
      ),
    );
  }
}
