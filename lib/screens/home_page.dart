import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Image.asset("assets/images/traditional_bg.png", fit: BoxFit.cover),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo & Home Title
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/JP_cineplex.png",
                            width: 80,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Home",
                            style: TextStyles.size14WeightBoldConthraxSemiBold
                                .copyWith(
                                  fontSize: 16,
                                  color: AppColours.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // My Orders Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Orders",
                          style: TextStyles.size14WeightBoldConthraxSemiBold
                              .copyWith(fontSize: 14, color: AppColours.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "No upcoming orders.. / 02 Movie tickets ordered →",
                          style: TextStyle(
                            color: AppColours.lightGrey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "ALL TICKET ORDERS →",
                            style: TextStyle(
                              color: AppColours.gold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(color: AppColours.darkGrey),

                  // Now Showing & Coming Soon Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Now Showing",
                          style: TextStyle(
                            color: AppColours.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Coming Soon",
                          style: TextStyle(
                            color: AppColours.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildMovieCard(
                          "assets/images/movie1.png",
                          "Madha Gaja Raja",
                        ),
                        const SizedBox(width: 12),
                        _buildMovieCard("assets/images/movie2.png", "Moana 2"),
                        const SizedBox(width: 12),
                        _buildMovieCard(
                          "assets/images/movie3.png",
                          "Other Movie",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // See It First Section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(
                      "See It First",
                      style: TextStyle(
                        color: AppColours.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _buildMovieCard("assets/images/movie4.png", "Sonic 3"),
                        const SizedBox(width: 12),
                        _buildMovieCard(
                          "assets/images/movie5.png",
                          "Den of Thieves 2",
                        ),
                        const SizedBox(width: 12),
                        _buildMovieCard("assets/images/movie2.png", "Moana 2"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80), // space for bottom nav
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Colors.black,
        selectedItemColor: AppColours.gold,
        unselectedItemColor: AppColours.lightGrey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: "Book",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "Food & Drink",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "More"),
        ],
      ),
    );
  }

  Widget _buildMovieCard(String image, String title) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: AppColours.darkGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
              ),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColours.black,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(8),
                ),
              ),
              child: Text(
                "TIMES & TICKETS",
                style: TextStyle(
                  color: AppColours.gold,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
