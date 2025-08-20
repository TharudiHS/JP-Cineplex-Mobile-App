import 'package:flutter/material.dart';
import 'package:jp_cinema_app/screens/opening_page.dart';
import 'package:jp_cinema_app/utils/app_theme.dart';

void main() {
  runApp(const JPCinemaApp());
}

class JPCinemaApp extends StatelessWidget {
  const JPCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JP Cinema App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OpeningPage(),
    );
  }
}
