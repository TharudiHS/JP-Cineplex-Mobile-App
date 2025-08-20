import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';
import 'language_select_page.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LanguageSelectPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/traditional_bg.png', fit: BoxFit.cover),

          // Logo + Tagline
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/JP_cineplex.png',
                  width: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                Text(
                  'A Royal Cinema Experience',
                  style: TextStyles.size14WeightBoldConthraxSemiBold,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
