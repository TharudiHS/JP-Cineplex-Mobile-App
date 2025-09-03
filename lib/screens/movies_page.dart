import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar2.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/data/models/movie_model.dart';
import 'package:jp_cinema_app/screens/movie_inner.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: const JPAppBar2(title: "Movies"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            Column(
              children: movieList.map((movie) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieInnerPage(movie: movie),
                      ),
                    );
                  },
                  child: _movieItem(movie.image, movie.title, movie.duration),
                );
              }).toList(),
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
}
