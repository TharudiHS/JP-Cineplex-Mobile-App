import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jp_cinema_app/components/app_bar3.dart';
import 'package:jp_cinema_app/components/bottom_nav_bar.dart';
import 'package:jp_cinema_app/components/main_button.dart';
import 'package:jp_cinema_app/components/text_form_field.dart';
import 'package:jp_cinema_app/screens/confirmation_page.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool showDiscountField = false;
  bool agreed = false;

  final TextEditingController discountController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    discountController.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return nameController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        agreed;
  }

  @override
  Widget build(BuildContext context) {
    _isFormValid();

    return Scaffold(
      backgroundColor: AppColours.black,
      appBar: buildAppBar3(context, "Payment - 10:00"),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            //  Booking Summary card
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
                        Icons.shopping_cart_outlined,
                        size: 18,
                        color: AppColours.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Booking Summary",
                        style: TextStyles.size16WeightBoldConthraxSemiBold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _summaryRow("Adult Tickets  1X", "LKR 1,800.00"),
                  const SizedBox(height: 12),
                  _summaryRow("Child Tickets  2X", "LKR 1,000.00"),
                  const SizedBox(height: 12),
                  _summaryRow("Booking Fee", "LKR 120.00"),
                  const SizedBox(height: 14),
                  const Divider(color: Colors.white, height: 1),
                  const SizedBox(height: 14),
                  Text(
                    "Food & Beverages",
                    style: TextStyles.size16WeightBoldConthraxSemiBold,
                  ),
                  const SizedBox(height: 12),
                  _summaryRow(
                    "Chocolate Caramel Popcorn Delight  1X",
                    "LKR 1,200.00",
                  ),
                  const SizedBox(height: 14),
                  const Divider(color: Colors.white, height: 1),
                  const SizedBox(height: 14),
                  // Total Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyles.size16WeightBoldConthraxSemiBold,
                      ),
                      Text(
                        "LKR 4,120.00",
                        style: TextStyles.size14WeightBoldConthraxSemiBold
                            .copyWith(color: AppColours.gold),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Discount Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MainButton(
                      label: "Have a Discount Code?",
                      onPressed: () => setState(
                        () => showDiscountField = !showDiscountField,
                      ),
                      backgroundColor: AppColours.gold,
                      textStyle:
                          TextStyles.size14WeightBoldConthraxSemiBoldblack,
                    ),
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            ),

            //  Discount
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                child: showDiscountField
                    ? Padding(
                        key: const ValueKey('discountOpen'),
                        padding: const EdgeInsets.only(top: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: AppColours.black,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.04),
                                  ),
                                ),
                                child: TextField(
                                  controller: discountController,
                                  style: TextStyles.size12Promptwhite,
                                  decoration: InputDecoration(
                                    hintText: "Enter Discount Code",
                                    hintStyle: TextStyles.size12Promptwhite
                                        .copyWith(color: Colors.grey),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 12,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),

                            // APPLY button
                            SizedBox(
                              width: 92,
                              height: 30,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColours.black,
                                  side: const BorderSide(
                                    color: AppColours.gold,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(),
                                ),
                                child: Text(
                                  "APPLY",
                                  style: TextStyles
                                      .size14WeightBoldConthraxSemiBoldblack
                                      .copyWith(
                                        color: AppColours.gold,
                                        fontSize: 13,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox.shrink(key: ValueKey('discountClosed')),
              ),
            ),

            const SizedBox(height: 20),

            //  Billing Information
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header centered
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      child: Text(
                        "Billing Information",
                        style: TextStyles.size16WeightBoldConthraxSemiBold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Full Name
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextFormField(
                        controller: nameController,
                        hint: "Full Name",
                        isRequired: true,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Mobile
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextFormField(
                        controller: phoneController,
                        hint: "Mobile Number",
                        isRequired: true,
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Email
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextFormField(
                        controller: emailController,
                        hint: "Email Address",
                        isRequired: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            //  Terms & Conditions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: agreed,
                    onChanged: (val) => setState(() => agreed = val ?? false),
                    checkColor: AppColours.black,
                    activeColor: AppColours.gold,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        style: TextStyles.size12Promptwhite,
                        children: [
                          const TextSpan(text: "I have read and agree to the "),
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyles.size12Promptwhite.copyWith(
                              color: AppColours.gold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColours.gold,
                            ),
                          ),
                          const TextSpan(text: " and the JP Cineplex "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyles.size12Promptwhite.copyWith(
                              color: AppColours.gold,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColours.gold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 1,
                color: Colors.white.withOpacity(0.06),
              ),
            ),

            const SizedBox(height: 12),

            //  Payment Method
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Select Payment Method",
                style: TextStyles.size16WeightBoldConthraxSemiBold,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColours.gold, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.credit_card, color: AppColours.gold),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Credit or Debit Card",
                        style: TextStyles.size12Promptwhite,
                      ),
                    ),
                    Image.asset(
                      "assets/images/visa.png",
                      height: 20,
                      errorBuilder: (_, __, ___) => const SizedBox(width: 28),
                    ),
                    const SizedBox(width: 6),
                    Image.asset(
                      "assets/images/mastercard.webp",
                      height: 20,
                      errorBuilder: (_, __, ___) => const SizedBox(width: 28),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MainButton(
                label: "PAY NOW",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmationPage(),
                    ),
                  );
                },
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

  Widget _summaryRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            left,
            style: TextStyles.size12Promptwhite,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(right, style: TextStyles.size12Promptwhite),
      ],
    );
  }
}
