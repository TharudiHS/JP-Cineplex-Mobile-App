import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class ChooseTicketTypePage extends StatefulWidget {
  const ChooseTicketTypePage({super.key});

  @override
  State<ChooseTicketTypePage> createState() => _ChooseTicketTypePageState();
}

class _ChooseTicketTypePageState extends State<ChooseTicketTypePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "Ticket Type - 10:00"),

      //  booking summary
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeInOut,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 25,
                ),
                constraints: const BoxConstraints(minHeight: 64),
                decoration: BoxDecoration(
                  color: AppColours.black,
                  border: const Border(
                    top: BorderSide(color: AppColours.white, width: 1.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColours.black.withOpacity(0.35),
                      blurRadius: 6,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Booking",
                                  style: TextStyles
                                      .size16WeightBoldConthraxSemiBold,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "Summary",
                                  style: TextStyles
                                      .size16WeightBoldConthraxSemiBold,
                                ),
                              ],
                            ),
                            const SizedBox(width: 6),
                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: AppColours.white,
                              size: 20,
                            ),
                          ],
                        ),

                        if (!_isExpanded)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyles.size15Promptwhite,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "LKR 2,920.00",
                                style: TextStyles.size16Promptgold,
                              ),
                            ],
                          ),
                      ],
                    ),

                    // BODY
                    if (_isExpanded) ...[
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Adult Tickets  1X",
                            style: TextStyles.size14PromptLightwhite,
                          ),
                          Text(
                            "LKR 1,800.00",
                            style: TextStyles.size14PromptLightwhite,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Child Tickets  2X",
                            style: TextStyles.size14PromptLightwhite,
                          ),
                          Text(
                            "LKR 1,000.00",
                            style: TextStyles.size14PromptLightwhite,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Booking Fee",
                            style: TextStyles.size12Promptwhite,
                          ),
                          Text(
                            "LKR 120.00",
                            style: TextStyles.size12Promptwhite,
                          ),
                        ],
                      ),
                      const Divider(color: Colors.white24, height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyles.size15Promptwhite,
                          ),
                          Text(
                            "LKR 2,920.00",
                            style: TextStyles.size16Promptgold,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),

          const BottomNavBar(selectedIndex: 2),
        ],
      ),

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
                          const Text(
                            "Thursday, 15 Jan, 2025",
                            style: TextStyles.size10Promptwhite,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                width: 4,
                                height: 10,
                                color: AppColours.white,
                              ),
                              const SizedBox(width: 5),
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

            // Ticket section (unchanged)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/showtime-box-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  _ticketRow(title: "Adult Tickets", price: "LKR 1,800.00"),
                  const SizedBox(height: 12),
                  const Divider(color: Colors.white24, height: 1.5),
                  const SizedBox(height: 12),
                  _ticketRow(
                    title: "Child Tickets",
                    price: "LKR 500.00",
                    subtitle: "(Under 12 Years Old)",
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Please Note A LKR 60.00 Booking Fee Is Charged Per \nTicket Booked Online.",
                    style: TextStyles.size12PromptLightgrey70,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Buttons (unchanged)
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
      decoration: const BoxDecoration(color: AppColours.gold),
      alignment: Alignment.center,
      child: Icon(icon, size: 15, color: AppColours.black),
    );
  }
}
