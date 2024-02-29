import 'package:flutter/material.dart';
import 'package:senim/config/themes/app_custom_theme.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  const RoundedContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).own().dashboardSidebarBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: child,
    );
  }
}
