import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class LanguageSelectPage extends StatefulWidget {
  const LanguageSelectPage({super.key});

  @override
  State<LanguageSelectPage> createState() => _LanguageSelectPageState();
}

class _LanguageSelectPageState extends State<LanguageSelectPage> {
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/images/traditional_bg.png', fit: BoxFit.cover),

          // Scrollable content
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // Logo
                  Image.asset(
                    'assets/images/JP_cineplex.png',
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 120),

                  // Prompt text
                  Text(
                    'Please Select Your Language',
                    style: TextStyles.size14PromptLight,
                  ),
                  const SizedBox(height: 100),

                  // Language options
                  _buildLanguageOption('English'),
                  const SizedBox(height: 10),
                  _buildLanguageOption('Sinhala'),
                  const SizedBox(height: 10),
                  _buildLanguageOption('Tamil'),

                  const SizedBox(height: 110),

                  // Select button
                  GestureDetector(
                    onTap: () {
                      if (selectedLanguage != null) {
                        // Navigate to next page or save selection
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        // Show warning if no language selected
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a language'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 380,
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      decoration: BoxDecoration(color: AppColours.gold),
                      alignment: Alignment.center,
                      child: Text(
                        'SELECT',
                        style: TextStyles.size14WeightBoldConthraxSemiBoldblack,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    final bool isSelected = selectedLanguage == language;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          language,
          style: TextStyles.size20WeightBoldConthraxSemiBold.copyWith(
            color: isSelected ? AppColours.gold : AppColours.lightGrey,
          ),
        ),
      ),
    );
  }
}
