import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class ChooseTicketTypePage extends StatelessWidget {
  const ChooseTicketTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "Ticket Type - 10:00"),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      const SizedBox(width: 15),
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
                                color: AppColours.white,
                              ),
                              const SizedBox(width: 5),

                              // Text
                              Text(
                                "10.30 AM, Screen - 1, JP Cineplex Kandy, Seats:L1,L2,L3",
                                style: TextStyles.size8ConthraxSemiBold
                                    .copyWith(color: AppColours.white),
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

            const SizedBox(height: 16),

            //Ticket section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/images/showtime-box-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Selected seat count row
                  Row(
                    children: [
                      const Icon(
                        Icons.diamond_outlined,
                        color: Colors.white70,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Selected Seat Count : ",
                        style: TextStyles.size16WeightBoldConthraxSemiBold,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyles.size16WeightBoldConthraxSemiBold,
                          children: [
                            const TextSpan(
                              text: "02 ",
                              style: TextStyle(color: AppColours.grey70),
                            ),
                            const TextSpan(
                              text: "/ ",
                              style: TextStyle(color: AppColours.gold),
                            ),
                            TextSpan(
                              text: "03",
                              style: TextStyle(color: AppColours.gold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Adult row
                  _ticketRow(title: "Adult Tickets", price: "LKR 1,800.00"),

                  const SizedBox(height: 12),
                  const Divider(color: Colors.white24, height: 1.5),
                  const SizedBox(height: 12),

                  // Child row
                  _ticketRow(
                    title: "Child Tickets",
                    price: "LKR 500.00",
                    subtitle: "(Under 12 Years Old)",
                  ),

                  const SizedBox(height: 16),

                  // Note
                  const Text(
                    "Please Note A LKR 60.00 Booking Fee Is Charged Per \nTicket Booked Online.",
                    style: TextStyles.size12PromptLightgrey70,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColours.gold, width: 1),
                ),
                child: MainButton(
                  label: "SELECT FOOD & DRINK",
                  onPressed: () {},
                  backgroundColor: AppColours.black,
                  textStyle: TextStyles.size14WeightBoldConthraxSemiBoldgold,
                ),
              ),
            ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MainButton(
                label: "PROCEED TO CHECK OUT",
                onPressed: () {},
                backgroundColor: AppColours.gold,
                textStyle: TextStyles.size14WeightBoldConthraxSemiBoldblack,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _ticketRow({
    required String title,
    required String price,
    String? subtitle,
  }) {
    return Row(
      children: [
        // Left texts
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.size15Promptwhite),
              const SizedBox(height: 4),
              Text(price, style: TextStyles.size12Promptwhite),
              if (subtitle != null)
                Text(subtitle, style: TextStyles.size10PromptLightgrey70),
            ],
          ),
        ),

        // Right quantity controls (static UI)
        _qtySquare(icon: Icons.remove),
        const SizedBox(width: 12),
        const Text("01", style: TextStyles.size15Promptwhite),
        const SizedBox(width: 12),
        _qtySquare(icon: Icons.add),
      ],
    );
  }

  Widget _qtySquare({required IconData icon}) {
    return Container(
      width: 40,
      height: 30,
      decoration: BoxDecoration(color: AppColours.gold),
      alignment: Alignment.center,
      child: Icon(icon, size: 15, color: AppColours.black),
    );
  }
}
