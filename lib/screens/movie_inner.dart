// lib/screens/movie_inner.dart
import 'package:flutter/material.dart';
import '../components/app_bar2.dart';
import '../components/bottom_nav_bar.dart';
import '../data/models/movie_model.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class MovieInnerPage extends StatelessWidget {
  final MovieModel movie;

  const MovieInnerPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Column(
        children: [
          const JPAppBar2(title: "Times and Tickets"),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster + Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          movie.image,
                          width: 120,
                          height: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style:
                                  TextStyles.size14WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              movie.genres,
                              style:
                                  TextStyles.size14WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              movie.duration,
                              style:
                                  TextStyles.size14WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Release: ${movie.releaseDate}",
                              style:
                                  TextStyles.size14WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 8),

                            Row(
                              children: [
                                Icon(
                                  Icons.play_circle_outline,
                                  color: AppColours.gold,
                                  size: 20,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  "Play Trailer",
                                  style: TextStyles
                                      .size14WeightBoldConthraxSemiBold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Divider(color: AppColours.lightGrey.withOpacity(0.4)),

                  // Synopsis + Director + Cast
                  Text(
                    "Synopsis",
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    movie.synopsis,
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "Director",
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie.directors.join(", "),
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 12),

                  Text(
                    "Cast",
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: movie.cast.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (ctx, i) {
                        return Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                movie.cast[i]["image"] ?? "",
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              movie.cast[i]["name"] ?? "",
                              style:
                                  TextStyles.size14WeightBoldConthraxSemiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    "Showtimes",
                    style: TextStyles.size14WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _dateTab("Today", true),
                      _dateTab("Tomorrow", false),
                      _dateTab("Sat 15/02", false),
                    ],
                  ),
                  const SizedBox(height: 12),

                  _showtimeCard("Screen 1", "10:30 AM"),
                  _showtimeCard("Screen 2", "10:30 AM", color: Colors.red),
                  _showtimeCard(
                    "Screen 3 - Luxe",
                    "10:30 AM",
                    color: AppColours.gold,
                  ),
                ],
              ),
            ),
          ),

          const BottomNavBar(selectedIndex: 1),
        ],
      ),
    );
  }

  Widget _dateTab(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColours.gold : AppColours.grey11,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _showtimeCard(
    String screen,
    String time, {
    Color color = Colors.blue,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColours.grey11,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(screen, style: TextStyles.size14WeightBoldConthraxSemiBold),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Icon(Icons.surround_sound, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          const Icon(Icons.event_seat, color: Colors.white, size: 20),
        ],
      ),
    );
  }
}
