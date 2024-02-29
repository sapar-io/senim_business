import 'package:flutter/material.dart';

class OwnThemeFields {
  final Color dashboardBackground;
  final Color dashboardSidebarBackground;

  OwnThemeFields({
    required this.dashboardBackground,
    required this.dashboardSidebarBackground,
  });
}

extension ThemeDataExtensions on ThemeData {
  static final Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    // can't use reference to ThemeData since Theme.of() can create a new localized instance from the original theme. Use internal fields, in this case InputDecoreationTheme reference which is not deep copied but simply a reference is copied
    _own[inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty;

  OwnThemeFields own() {
    var o = _own[inputDecorationTheme];
    if (o == null) {
      empty ??= OwnThemeFields(
        dashboardBackground: Colors.white,
        dashboardSidebarBackground: Colors.white,
      );
      o = empty;
    }
    return o!;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();
