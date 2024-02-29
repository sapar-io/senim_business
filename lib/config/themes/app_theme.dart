import 'package:senim/constants/sm_colors.dart';
import 'package:flutter/material.dart';
import 'package:senim/config/themes/app_custom_theme.dart';

// ignore: non_constant_identifier_names
ThemeData SMLightThemeData = ThemeData(
  brightness: Brightness.light,
  // Main Color
  primarySwatch: SMColors.primary,
  primaryColor: SMColors.primary,
  // Background
  scaffoldBackgroundColor: Colors.white,
  // Nav
  appBarTheme: AppBarTheme(
    color: Colors.white,
    foregroundColor: SMColors.greyscale.shade900,
    elevation: 0.5,
  ),
  // Tab
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: SMColors.primary,
    unselectedItemColor: SMColors.greyscale.shade600,
  ),
  // Top TabBar
  tabBarTheme: TabBarTheme(
    labelColor: SMColors.greyscale.shade900,
    unselectedLabelColor: SMColors.greyscale.shade600,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: SMColors.primary),
    ),
  ),
  // Font
  fontFamily: 'Montserrat',
  // TextField
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: SMColors.greyscale.shade100,
    hintStyle: TextStyle(color: SMColors.greyscale.shade500),
    iconColor: SMColors.greyscale.shade500,
    prefixIconColor: SMColors.greyscale.shade500,
    suffixIconColor: SMColors.greyscale.shade500,
    // Height
    contentPadding: const EdgeInsets.all(16.0),
    // Border
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: SMColors.primary, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: SMColors.errorBase, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: SMColors.errorBase, width: 1.0),
    ),
  ),
  // TextField
  checkboxTheme: CheckboxThemeData(
    side: BorderSide(
      color: SMColors.greyscale.shade400,
    ),
  ),
  // Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
  ),
  // Divider
  dividerColor: SMColors.greyscale.shade300,
  // Popup Menu
  cardColor: Colors.white,
  popupMenuTheme: const PopupMenuThemeData(
    elevation: 5.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
  ),
  // Text
  textTheme: TextTheme(
    displayLarge: TextStyle(color: SMColors.greyscale.shade900),
    displayMedium: TextStyle(color: SMColors.greyscale.shade900),
    displaySmall: TextStyle(color: SMColors.greyscale.shade900),
    headlineLarge: TextStyle(color: SMColors.greyscale.shade900),
    headlineMedium: TextStyle(color: SMColors.greyscale.shade900),
    headlineSmall: TextStyle(color: SMColors.greyscale.shade900),
    titleLarge: TextStyle(color: SMColors.greyscale.shade900),
    titleMedium: TextStyle(color: SMColors.greyscale.shade900),
    titleSmall: TextStyle(color: SMColors.greyscale.shade900),
    labelLarge: TextStyle(color: SMColors.greyscale.shade900),
    labelMedium: TextStyle(color: SMColors.greyscale.shade900),
    labelSmall: TextStyle(color: SMColors.greyscale.shade900),
    bodyLarge: TextStyle(color: SMColors.greyscale.shade900),
    bodyMedium: TextStyle(color: SMColors.greyscale.shade900),
    bodySmall: TextStyle(color: SMColors.greyscale.shade900),
  ),
)..addOwn(
    OwnThemeFields(
      dashboardBackground: SMColors.greyscale.shade200,
      dashboardSidebarBackground: Colors.white,
    ),
  );
