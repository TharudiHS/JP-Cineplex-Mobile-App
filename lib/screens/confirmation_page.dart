import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/screens/payment_declined_page.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

// widget for instruction sections
class InstructionSection extends StatelessWidget {
  final String title;
  final List<String> instructions;

  const InstructionSection({
    super.key,
    required this.title,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  title,
                  style: TextStyles.size16WeightBoldConthraxSemiBold,
                ),
              ),
              const SizedBox(height: 35),

              ...instructions.map(
                (text) => Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(text, style: TextStyles.size14PromptLightgreyA5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Divider(color: AppColours.lightGrey.withOpacity(0.6)),
        const SizedBox(height: 25),
      ],
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: AppBar(
        backgroundColor: AppColours.grey11,
        elevation: 0,
        title: Text(
          "Confirmation",
          style: TextStyles.size16WeightBoldConthraxSemiBold,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Success Icon
            SvgPicture.asset(
              "assets/images/check_circle.svg",
              width: 60,
              height: 60,
            ),

            const SizedBox(height: 15),
            const Text(
              "Thank you, Your transaction is successful.",
              style: TextStyles.size15Promptwhite,
            ),
            const SizedBox(height: 35),

            // Ticket Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColours.gold),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title + Logo
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Moana 2",
                        style: TextStyles.size24WeightBoldConthraxSemiBoldblack,
                      ),
                      Image.asset("assets/images/JP_cineplex.png", height: 40),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: const [
                      Text(
                        "Platinum Screen",
                        style: TextStyles.size12PromptLightroyalBlue,
                      ),
                      SizedBox(width: 4),
                      Text(
                        " - JP Cineplex Kandy",
                        style: TextStyles.size8PromptLightroyalBlue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // QR + Ticket Count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/qr.png", height: 150),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text("3", style: TextStyles.size48PromptLight),
                          Text(
                            "Tickets",
                            style: TextStyles.size14PromptLightblack,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "TID: 181656670P25109",
                    style: TextStyles.size14PromptLightblack,
                  ),

                  const SizedBox(height: 20),
                  const Divider(thickness: 1.5),
                  const SizedBox(height: 20),

                  const Text(
                    "Thursday, 15 Jan, 2025",
                    style: TextStyles.size24PromptLightblack,
                  ),
                  const SizedBox(height: 20),

                  // Ticket Items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Adult Tickets",
                        style: TextStyles.size12Promptblack,
                      ),
                      Text("1X", style: TextStyles.size12Promptblack),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Child Tickets",
                        style: TextStyles.size12Promptblack,
                      ),
                      Text("2X", style: TextStyles.size12Promptblack),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(
                        child: Text(
                          "Chocolate Caramel Popcorn Delight",
                          style: TextStyles.size12Promptblack,
                        ),
                      ),
                      Text("1X", style: TextStyles.size12Promptblack),
                    ],
                  ),

                  const SizedBox(height: 20),
                  const Divider(thickness: 1.5),

                  // Seat(s) + Showtime
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Seat(s)",
                            style: TextStyles.size14PromptLightblack,
                          ),
                          SizedBox(height: 4),
                          Text(
                            "B1, B2, B3",
                            style: TextStyles.size22PromptLightblack,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "Showtime",
                            style: TextStyles.size14PromptLightblack,
                          ),
                          SizedBox(height: 4),
                          Text(
                            "10:30 AM",
                            style: TextStyles.size22PromptLightblack,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Seat Map
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SvgPicture.asset(
                    "assets/images/Group 5835.svg",
                    width: 412,
                    height: 424,
                  ),
                ],
              ),
            ),

            // Instructions Sections
            InstructionSection(
              title: "Before You Arrive At The Cinema",
              instructions: const [
                "01. Book your tickets online or via the JP Cineplex app to avoid queues and guarantee your seat. (Download now, iPhone or Android).",
                "02. Pre-purchase your favorite movie snacks directly through our mobile app.",
                "03. Check your email or app for your booking confirmation and the e-ticket.",
                "04. Arrive at least 15–20 minutes early to allow time for parking, collecting snacks, or using the restroom.",
                "05. If you have any accessibility needs, contact the cinema in advance to make arrangements.",
              ],
            ),

            InstructionSection(
              title: "When You Arrive At The Cinema",
              instructions: const [
                "06. Have your ticket ready for scanning—either printed or on your phone.",
                "07. Follow the signs or ask a staff member if you’re unsure where your screen is located.",
                "08. If you haven’t pre-purchased snacks, head to the concessions bar to buy your favorite food and drinks.",
                "09. Use the restrooms before your movie starts to avoid interruptions.",
              ],
            ),

            InstructionSection(
              title: "During Your Visit",
              instructions: const [
                "10. Sit in your assigned seats (if applicable).",
                "11. Ensure your mobile devices are switched off or on silent mode, during the movie.",
                "12. Keep conversation and noise to a minimum to respect others.",
                "13. Dispose your trash in the bins provided after the movie ends.",
                "14. If you experience any issues (e.g., sound problems or disruptive guests), speak with a staff member.",
                "15. Sit back, relax and enjoy the Royal Cinema Experience …..",
              ],
            ),

            InstructionSection(
              title: "Parking",
              instructions: const [
                "16. Parking is available on site for the cinema patrons.",
                "17. Allow extra time during peak hours to find a parking slot.",
              ],
            ),

            // Total + Download
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total Costs", style: TextStyles.size20Promptwhite),
                      Text("LKR 4,120.00", style: TextStyles.size20Promptgold),
                    ],
                  ),
                  const SizedBox(height: 25),
                  MainButton(
                    label: "DOWNLOAD E-TICKET",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentDeclinedPage(),
                        ),
                      );
                    },
                    backgroundColor: AppColours.gold,
                    textStyle: TextStyles.size14WeightBoldConthraxSemiBoldblack,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
