import 'package:flutter/material.dart';
import 'package:jp_cineplex_movie/components/app_bar2.dart';
import 'package:jp_cineplex_movie/utils/app_colours.dart';
import 'package:jp_cineplex_movie/utils/text_styles.dart';

class MovieBookPage extends StatelessWidget {
  const MovieBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JPAppBar2(title: "Book"),
            const SizedBox(height: 30),

            // Date Tabs
            _dateTabs(),
            const SizedBox(height: 12),

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

  // ---------------- Date Tabs -----------------
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

  // ---------------- Showtime Card -----------------
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

  // ---------------- Movie Card -----------------
  Widget _buildMovieCard(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String location,
    required List<Widget> showtimeWidgets,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColours.darkGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster
          ClipRRect(
            child: Image.asset(
              imagePath,
              height: 220,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          // Title
          Text(title, style: TextStyles.size14PromptLightwhite),
          const SizedBox(height: 4),

          // Location
          Text(location, style: TextStyles.size14PromptLightwhite),
          const SizedBox(height: 12),

          // Showtime cards
          Column(children: showtimeWidgets),
        ],
      ),
    );
  }
}
