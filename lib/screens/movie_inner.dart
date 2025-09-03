import 'package:flutter/material.dart';
import 'package:jp_cinema_app/data/models/showtime_card.dart';
import 'package:jp_cinema_app/screens/screen1.dart';
import 'package:jp_cinema_app/screens/screen2.dart';
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
                                  TextStyles.size18WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              movie.genres,
                              style: TextStyles.size12Promptwhitegold,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              movie.duration,
                              style: TextStyles.size12Promptwhite,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Release: ${movie.releaseDate}",
                              style: TextStyles.size12Promptwhitegrey8F,
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
                                  style: TextStyles.size12Promptwhitegold,
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
                  Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      title: Text(
                        "Cast & Synopsis",
                        style: TextStyles.size14WeightBoldConthraxSemiBold,
                      ),

                      childrenPadding: const EdgeInsets.only(top: 10),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Synopsis
                            Text(
                              "Synopsis",
                              style:
                                  TextStyles.size16WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              movie.synopsis,
                              style: TextStyles.size14PromptLightwhite,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 25),

                            // Director
                            Text(
                              "Director",
                              style:
                                  TextStyles.size16WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              movie.directors.join(", "),
                              style: TextStyles.size15Promptwhite,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 25),

                            // Cast
                            Text(
                              "Cast",
                              style:
                                  TextStyles.size16WeightBoldConthraxSemiBold,
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 170,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: movie.cast.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 12),
                                itemBuilder: (ctx, i) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                          movie.cast[i]["image"] ?? "",
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        movie.cast[i]["name"] ?? "",
                                        style: TextStyles.size12Promptwhite,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColours.lightGrey.withOpacity(0.4)),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "Showtimes",
                      style: TextStyles.size18WeightBoldConthraxSemiBold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Date tabs with arrows
                  _dateTabs(),
                  const SizedBox(height: 12),

                  ShowtimeCard(
                    screen: "Screen 1",
                    time: "10:30 AM",
                    stripColor: AppColours.royalBlue,
                    textColor: AppColours.royalBlue,
                    destinationPage: const Screen1Page(),
                  ),
                  ShowtimeCard(
                    screen: "Screen 2",
                    time: "10:30 AM",
                    stripColor: AppColours.crimsonRed,
                    textColor: AppColours.crimsonRed,
                    destinationPage: const Screen2Page(),
                  ),
                  ShowtimeCard(
                    screen: "Screen 3 - Luxe",
                    time: "10:30 AM",
                    stripColor: AppColours.bronze,
                    textColor: AppColours.bronze,
                    destinationPage: const Screen2Page(),
                  ),
                  ShowtimeCard(
                    screen: "Screen 4",
                    time: "10:30 AM",
                    stripColor: AppColours.lavender,
                    textColor: AppColours.lavender,
                    destinationPage: const Screen2Page(),
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

  Widget _dateTabs() {
    return Row(
      children: [
        // Left arrow
        _arrowButton(Icons.chevron_left),

        // Tabs
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
        // Right arrow
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
}
