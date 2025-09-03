import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class Screen4Page extends StatefulWidget {
  const Screen4Page({super.key});

  @override
  State<Screen4Page> createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen4Page> {
  final int rows = 10; // A..J
  final int cols = 10;

  final List<String> occupiedSeats = ["H3", "H4", "E6", "E7", "C2", "D2", "D3"];
  final List<String> familySeats = ["A2", "A4", "A6", "A8"];

  // user selected seats
  final List<String> selectedSeats = [];

  String seatCodeForGrid(int gridRow, int col) {
    final int letterIndex = (rows - 1) - gridRow;
    final String letter = String.fromCharCode(65 + letterIndex);
    return "$letter${col + 1}";
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
                              Container(
                                width: 4,
                                height: 10,
                                color: AppColours.lavender,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Silver – A Bold Blend of Style and Comfort",
                                style: TextStyles.size8ConthraxSemiBold
                                    .copyWith(color: AppColours.lavender),
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

            // Legend
            Text(
              "Select Your Seats",
              style: TextStyles.size16WeightBoldConthraxSemiBold,
            ),
            const SizedBox(height: 20),
            Divider(color: AppColours.lightGrey.withOpacity(0.6)),
            const SizedBox(height: 20),

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

                        // Family/Couple Seats
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

            // Search icon
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

            //  SEAT GRID
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: Column(
                children: List.generate(rows, (gridRow) {
                  final int letterIndex = (rows - 1) - gridRow; // J..A
                  final String rowLabel = String.fromCharCode(65 + letterIndex);

                  // ----- A ROW: FAMILY / COUPLE
                  if (rowLabel == 'A') {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Left-side row label
                          SizedBox(
                            width: 20,
                            child: Text(
                              'A',
                              style: TextStyles.size12Promptwhite,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 8),

                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: familySeats.map((code) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                  ),
                                  child: Container(
                                    width: 52,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColours.lightGrey,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.18),
                                        width: 1,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 18,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left-side row label
                        SizedBox(
                          width: 20,
                          child: Text(
                            rowLabel,
                            style: TextStyles.size12Promptwhite,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Seats for this row
                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: cols,
                                  crossAxisSpacing: 6,
                                  mainAxisSpacing: 6,
                                  childAspectRatio: 1.0,
                                ),
                            itemCount: cols,
                            itemBuilder: (context, col) {
                              final String code = seatCodeForGrid(gridRow, col);
                              final bool isOccupied = occupiedSeats.contains(
                                code,
                              );
                              final bool isSelected = selectedSeats.contains(
                                code,
                              );

                              return GestureDetector(
                                onTap: () {
                                  if (!isOccupied) {
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
                                        ? AppColours.red
                                        : isSelected
                                        ? Colors.green
                                        : AppColours.lightGrey,
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
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 15),

            //  SELECT SEATS BUTTON
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
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }

  // Legend helper
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

// Golden curve painter (unchanged)
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
