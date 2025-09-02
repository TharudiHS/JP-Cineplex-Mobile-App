import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar2.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class MovieBookPage extends StatelessWidget {
  const MovieBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JPAppBar2(title: "Book"),
            const SizedBox(height: 30),

            // Date Tabs
            _dateTabs(),
            const SizedBox(height: 12),

            //Cinema feature row
            const CinemaFeaturesRow(),
            const SizedBox(height: 20),

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

            // Movies list
            Column(
              children: [
                _buildMovieCard(
                  context,
                  imagePath: "assets/images/snow_white.jpg",
                  title: "Snow White",
                  location: "At Jp Cineplex - Kandy",
                  showtimeWidgets: [
                    _showtimeCard(
                      "Screen 1",
                      "10:30 AM",
                      stripColor: AppColours.royalBlue,
                      textColor: AppColours.royalBlue,
                    ),
                    _showtimeCard(
                      "Screen 2",
                      "10:30 AM",
                      stripColor: AppColours.crimsonRed,
                      textColor: AppColours.crimsonRed,
                    ),
                    _showtimeCard(
                      "Screen 3 - Luxe",
                      "10:30 AM",
                      stripColor: AppColours.bronze,
                      textColor: AppColours.bronze,
                    ),
                    _showtimeCard(
                      "Screen 4",
                      "10:30 AM",
                      stripColor: AppColours.lavender,
                      textColor: AppColours.lavender,
                    ),
                  ],
                ),
                _buildMovieCard(
                  context,
                  imagePath: "assets/images/indian2.jpeg",
                  title: "Indian 2",
                  location: "At Jp Cineplex - Kandy",
                  showtimeWidgets: [
                    _showtimeCard(
                      "Screen 1",
                      "10:30 AM",
                      stripColor: AppColours.royalBlue,
                      textColor: AppColours.royalBlue,
                    ),
                    _showtimeCard(
                      "Screen 2",
                      "10:30 AM",
                      stripColor: AppColours.crimsonRed,
                      textColor: AppColours.crimsonRed,
                    ),
                    _showtimeCard(
                      "Screen 3 - Luxe",
                      "10:30 AM",
                      stripColor: AppColours.bronze,
                      textColor: AppColours.bronze,
                    ),
                    _showtimeCard(
                      "Screen 4",
                      "10:30 AM",
                      stripColor: AppColours.lavender,
                      textColor: AppColours.lavender,
                    ),
                  ],
                ),
                _buildMovieCard(
                  context,
                  imagePath: "assets/images/sky_force.jpg",
                  title: "Sky Force",
                  location: "At Jp Cineplex - Kandy",
                  showtimeWidgets: [
                    _showtimeCard(
                      "Screen 1",
                      "10:30 AM",
                      stripColor: AppColours.royalBlue,
                      textColor: AppColours.royalBlue,
                    ),
                    _showtimeCard(
                      "Screen 2",
                      "10:30 AM",
                      stripColor: AppColours.crimsonRed,
                      textColor: AppColours.crimsonRed,
                    ),
                    _showtimeCard(
                      "Screen 3 - Luxe",
                      "10:30 AM",
                      stripColor: AppColours.bronze,
                      textColor: AppColours.bronze,
                    ),
                    _showtimeCard(
                      "Screen 4",
                      "10:30 AM",
                      stripColor: AppColours.lavender,
                      textColor: AppColours.lavender,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //   Date Tabs
  Widget _dateTabs() {
    return Row(
      children: [
        _arrowButton(Icons.chevron_left),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _dateTab("TODAY", true),
                _dateTab("TOMORROW", false),
                _dateTab("SAT 15/02", false),
              ],
            ),
          ),
        ),
        _arrowButton(Icons.chevron_right),
      ],
    );
  }

  Widget _dateTab(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: selected ? AppColours.gold : const Color(0xFF1C1C1C),
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

  //  Showtime Card
  Widget _showtimeCard(
    String screen,
    String time, {
    required Color stripColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            child: Image.asset(
              "assets/images/showtime-box-bg.png",
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Card content
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // Left colored strip
                Container(
                  width: 12,
                  height: double.infinity,
                  color: stripColor,
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          screen,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(time, style: TextStyles.size24Promptwhitegold),
                      ],
                    ),
                  ),
                ),

                // Right-side icons
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    children: [
                      Image.asset("assets/images/dolby.png", height: 30),
                      const SizedBox(width: 8),
                      Image.asset("assets/images/3d.png", height: 30),
                      const SizedBox(width: 8),
                      Image.asset("assets/images/IR.png", height: 30),
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

  //  Movie Card
  Widget _buildMovieCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String location,
    required List<Widget> showtimeWidgets,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            child: Image.asset(
              "assets/images/showtime-box-bg.png",
              width: double.infinity,
              height: 720,
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Poster
                Center(
                  child: ClipRRect(
                    child: Image.asset(
                      imagePath,
                      height: 310,
                      width: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                Center(
                  child: Text(
                    title,
                    style: TextStyles.size24WeightBoldConthraxSemiBold,
                  ),
                ),

                const SizedBox(height: 10),

                // Location
                Center(
                  child: Text(
                    location,
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                ),

                const SizedBox(height: 12),

                // Showtime cards
                Column(children: showtimeWidgets),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//  Cinema Features Row
class CinemaFeaturesRow extends StatelessWidget {
  const CinemaFeaturesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          _buildFeature("assets/images/gold.png", "GOLD CLASS"),
          _buildFeature("assets/images/dolby.png", "DOLBY ATMOS 7.1"),
          _buildFeature("assets/images/3d.png", "3D CINEMA"),
          _buildFeature("assets/images/4dx.png", "4Dx CINEMA"),
          _buildFeature("assets/images/IR.png", "INFRA-RED HEARING"),
          _buildFeature("assets/images/cc.png", "CLOSED CAPTION"),
          _buildMoreButton(),
        ],
      ),
    );
  }

  Widget _buildFeature(String imagePath, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, height: 24, fit: BoxFit.contain),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyles.size3Promptwhite,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.arrow_forward_ios, color: Colors.white, size: 22),
          SizedBox(height: 6),
          Text("MORE", style: TextStyles.size10Promptwhite),
        ],
      ),
    );
  }
}
