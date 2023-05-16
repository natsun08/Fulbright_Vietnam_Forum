/// Main coder: Quan
import 'package:flutter/material.dart';

const fulbrightBlue = Color(0xFF00196E);
const fulbrightGold = Color(0xFFFFAD1D);
const fulbrightSky = Color(0xFFCEEDF6);
const fulbrightStone = Color(0xFFE1E1DE);
const white = Color(0xFFFFFFFF);
const dark = Color(0xFF212121);
const gray = Color(0xFF808080);
const red = Colors.red;

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      // Colors
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: fulbrightBlue,
        secondary: fulbrightGold,
        tertiary: fulbrightSky,
        background: white,
        onBackground: fulbrightStone,
        outline: fulbrightBlue,
        error: red,
      ),

      // Typography
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            fontSize: 48.0,
            fontFamily: 'Garamond Premier Pro',
            color: fulbrightBlue), // Title
        titleMedium: TextStyle(
            fontSize: 32.0,
            fontFamily: 'Garamond Premier Pro',
            color: fulbrightBlue), // Subtitle
        displayLarge: TextStyle(
            fontSize: 28.0,
            fontFamily: 'Halyard Display',
            color: fulbrightBlue), // H0
        displayMedium: TextStyle(
            fontSize: 24.0,
            fontFamily: 'Halyard Display',
            color: fulbrightBlue), // H1
        displaySmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Halyard Display',
            color: dark), // H2
        bodyMedium: TextStyle(
            fontSize: 16.0, 
            fontFamily: 'Halyard Display', 
            color: dark), // Body
        bodySmall: TextStyle(
            fontSize: 11.0,
            fontFamily: 'Halyard Display',
            color: dark), // Caption
        labelMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            fontFamily: 'Halyard Display',
            color: dark), // Button
      ),
    );
  }
}
