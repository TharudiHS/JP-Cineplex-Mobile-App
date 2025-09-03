import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class Screen2Page extends StatefulWidget {
  const Screen2Page({super.key});

  @override
  State<Screen2Page> createState() => _Screen1State();
}

class _Screen1State extends State<Screen2Page> {
  final int rows = 10;
  final int cols = 8;

  // occupied seats
  final List<String> occupiedSeats = ['H3', 'H4', 'E5', 'E6', 'E7'];
  final List<String> selectedSeats = ['C4', 'C5'];

  String seatCode(int row, int col) {
    String rowLabel = String.fromCharCode(65 + row); // A-J
    return '$rowLabel${col + 1}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "Booking"),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Movie header
            Stack(
              children: [
                Container(
                  height: 89,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/Moana2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(color: AppColours.black.withOpacity(0.4)),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 10,
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/images/Moana2.jpg",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Moana 2",
                            style: TextStyles.size16WeightBoldConthraxSemiBold,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Thursday, 15 Jan, 2025",
                            style: TextStyles.size10Promptwhite,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              // Vertical bar
                              Container(
                                width: 4,
                                height: 10,
                                color: AppColours.crimsonRed,
                              ),
                              const SizedBox(width: 5),

                              // Text
                              Text(
                                "Gold - A Touch of Classic Elegance",
                                style: TextStyles.size8ConthraxSemiBold
                                    .copyWith(color: AppColours.crimsonRed),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Legend Section
            Text(
              "Select Your Seats",
              style: TextStyles.size16WeightBoldConthraxSemiBold,
            ),
            const SizedBox(height: 20),
            Divider(color: AppColours.lightGrey.withOpacity(0.6)),
            const SizedBox(height: 20),

            // inside your build()
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        legendBox(AppColours.lightGrey, "Available"),
                        const SizedBox(height: 30),
                        legendBox(AppColours.red, "Occupied"),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Selected Seat(s)
                        Row(
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Selected Seat(s)",
                              style: TextStyles.size12Promptwhite,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),

                        //Family/Couple Seats
                        Row(
                          children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: AppColours.lightGrey,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.black87,
                                size: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Family/Couple Seats",
                              style: TextStyles.size12Promptwhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
            Divider(color: AppColours.lightGrey.withOpacity(0.6)),
            const SizedBox(height: 20),

            // search icon
            Padding(
              padding: const EdgeInsets.only(right: 12, bottom: 4),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: AppColours.white),
                  tooltip: 'Search',
                ),
              ),
            ),

            // Golden curve
            CustomPaint(painter: CurvePainter(), child: Container(height: 40)),
            const Text(
              "SCREEN",
              style: TextStyles.size14WeightBoldConthraxSemiBold,
            ),

            const SizedBox(height: 20),

            // Seat Grid
            SizedBox(
              height: 400,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: rows * cols,
                itemBuilder: (context, index) {
                  int row = index ~/ cols;
                  int col = index % cols;
                  String code = seatCode(row, col);

                  bool isOccupied = occupiedSeats.contains(code); // red squares
                  bool isSelected = selectedSeats.contains(
                    code,
                  ); // green check marks
                  bool isFamilySeat = false; // unused in your image

                  return GestureDetector(
                    onTap: () {
                      if (!isOccupied && !isFamilySeat) {
                        setState(() {
                          if (isSelected) {
                            selectedSeats.remove(code);
                          } else {
                            selectedSeats.add(code);
                          }
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isOccupied
                            ? Colors.red
                            : isSelected
                            ? Colors.green
                            : Colors.grey[300], // neutral gray
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                size: 16,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(Icons.favorite, color: Colors.red, size: 24),
                ),
              ),
            ),

            // Select Seats Button
            Padding(
              padding: const EdgeInsets.all(12),
              child: MainButton(
                label: "SELECT SEATS",
                onPressed: () {
                  if (selectedSeats.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Seats booked: ${selectedSeats.join(", ")}",
                        ),
                      ),
                    );
                  }
                },
                backgroundColor: AppColours.gold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget legendBox(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(text, style: TextStyles.size12Promptwhite),
      ],
    );
  }
}

// Golden curve painter
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColours.gold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      -size.height,
      size.width,
      size.height,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
