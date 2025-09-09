import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class PaymentDeclinedPage extends StatelessWidget {
  const PaymentDeclinedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,

      appBar: AppBar(
        backgroundColor: AppColours.grey11,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const SizedBox.shrink(),
        centerTitle: true,
      ),

      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Red cross icon
              SvgPicture.asset(
                "assets/images/red_cross.svg",
                width: 60,
                height: 60,
              ),

              const SizedBox(height: 20),

              const Text(
                "Payment Declined.",
                style: TextStyles.size16PromptLightred,
              ),

              const SizedBox(height: 15),
              Divider(color: AppColours.lightGrey.withOpacity(0.6)),
              const SizedBox(height: 20),

              const Text(
                "Your booking has been canceled. Please try again.",
                textAlign: TextAlign.center,
                style: TextStyles.size14PromptLightgreyA5,
              ),

              const SizedBox(height: 20),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyles.size14PromptLightgreyA5,
                  children: [
                    const TextSpan(
                      text:
                          "If you're having trouble booking your tickets, please contact JP Cineplex on ",
                    ),
                    TextSpan(
                      text: "077 123 4567",
                      style: TextStyles.size14PromptLightgold.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const TextSpan(text: " for assistance."),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
