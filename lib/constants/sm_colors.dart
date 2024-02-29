import 'package:flutter/material.dart';

MaterialColor _primaryColor = const MaterialColor(
  0xFF0CAF60,
  <int, Color>{
    50: Color(0xFFE7F7EF),
    100: Color(0xFFE7F7EF),
    200: Color(0xFFCEEFDF),
    300: Color(0xFFCEEFDF),
    600: Color(0xFF86D7B0),
    500: Color(0xFF86D7B0),
    700: Color(0xFF55C790),
    800: Color(0xFF55C790),
    900: Color(0xFF0CAF60),
  },
);

MaterialColor _greyscaleColor = const MaterialColor(
  0xFF1A202C,
  <int, Color>{
    50: Color(0xFFFAFAFA),
    100: Color(0xFFF7FAFC),
    200: Color(0xFFEDF2F7),
    300: Color(0xFFE2E8F0),
    400: Color(0xFFCBD5E0),
    500: Color(0xFFA0AEC0),
    600: Color(0xFF718096),
    700: Color(0xFF4A5568),
    800: Color(0xFF2D3748),
    900: Color(0xFF1A202C),
  },
);

class SMColors {
  static MaterialColor primary = _primaryColor;
  static MaterialColor greyscale = _greyscaleColor;

  static Color errorDark = const Color(0xFFFD4F4F);
  static Color errorBase = const Color(0xFFFD6A6A);
  static Color errorLight = const Color(0xFFFD8181);
}