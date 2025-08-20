import 'package:flutter/material.dart';
import 'app_colours.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColours.black,
      scaffoldBackgroundColor: AppColours.black,
      fontFamily: 'Conthrax',
      useMaterial3: false,
    );
  }
}
