library scaffold;

import 'package:flutter/material.dart';
import 'package:senim/utils/responsive.dart';
import 'package:senim/config/themes/app_custom_theme.dart';
import 'package:senim/constants/sm_colors.dart';
import 'package:senim/screens/app/dashboard/widgets/popup_avatar.dart';

part 'desktop_scaffold.dart';
part 'mobile_scaffold.dart';

class GeneralScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;

  const GeneralScaffold({
    Key? key,
    required this.title,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MobileScaffold(
        title: title,
        child: child,
      ),
      desktop: _DesktopScaffold(
        title: title,
        child: child,
      ),
    );
  }
}
