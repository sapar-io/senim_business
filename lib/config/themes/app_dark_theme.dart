import 'package:senim/constants/sm_colors.dart';
import 'package:flutter/material.dart';
import 'package:senim/config/themes/app_custom_theme.dart';

// ignore: non_constant_identifier_names
ThemeData SMDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  // Main Color
  primarySwatch: SMColors.primary,
  primaryColor: SMColors.primary,
  // Background
  scaffoldBackgroundColor: SMColors.greyscale.shade900,
  // Nav
  appBarTheme: AppBarTheme(
    color: SMColors.greyscale.shade800,
    foregroundColor: Colors.white,
    elevation: 0.5,
  ),
  // Tab
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: SMColors.greyscale.shade800,
    selectedItemColor: SMColors.primary,
    unselectedItemColor: SMColors.greyscale.shade600,
  ),
  // Top TabBar
  tabBarTheme: TabBarTheme(
    labelColor: SMColors.greyscale.shade50,
    unselectedLabelColor: SMColors.greyscale.shade500,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: SMColors.primary),
    ),
  ),
  // Font
  fontFamily: 'Montserrat',
  // TextField
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: SMColors.greyscale.shade700,
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
      color: SMColors.greyscale.shade700,
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
  dividerColor: SMColors.greyscale.shade700,
  // Popup Menu
  cardColor: SMColors.greyscale.shade800,
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
    displayLarge: TextStyle(color: SMColors.greyscale.shade50),
    displayMedium: TextStyle(color: SMColors.greyscale.shade50),
    displaySmall: TextStyle(color: SMColors.greyscale.shade50),
    headlineLarge: TextStyle(color: SMColors.greyscale.shade50),
    headlineMedium: TextStyle(color: SMColors.greyscale.shade50),
    headlineSmall: TextStyle(color: SMColors.greyscale.shade50),
    titleLarge: TextStyle(color: SMColors.greyscale.shade50),
    titleMedium: TextStyle(color: SMColors.greyscale.shade50),
    titleSmall: TextStyle(color: SMColors.greyscale.shade50),
    labelLarge: TextStyle(color: SMColors.greyscale.shade50),
    labelMedium: TextStyle(color: SMColors.greyscale.shade50),
    labelSmall: TextStyle(color: SMColors.greyscale.shade50),
    bodyLarge: TextStyle(color: SMColors.greyscale.shade50),
    bodyMedium: TextStyle(color: SMColors.greyscale.shade50),
    bodySmall: TextStyle(color: SMColors.greyscale.shade50),
  ),
)..addOwn(
    OwnThemeFields(
      dashboardBackground: SMColors.greyscale.shade900,
      dashboardSidebarBackground: SMColors.greyscale.shade800,
    ),
  );
