import 'package:flutter/material.dart';
import 'package:jp_cinema_app/screens/screen1.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class ShowtimeCard extends StatelessWidget {
  final String screen;
  final String time;
  final Color stripColor;
  final Color textColor;

  const ShowtimeCard({
    super.key,
    required this.screen,
    required this.time,
    required this.stripColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Screen1Page()),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/images/showtime-box-bg.png",
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            decoration: const BoxDecoration(color: AppColours.black),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 80,
                  decoration: BoxDecoration(color: stripColor),
                ),
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
}
