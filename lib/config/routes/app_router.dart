import 'package:senim/screens/additional/add_company/add_company_screen.dart';
import 'package:senim/screens/additional/add_order/add_order_screen.dart';
import 'package:senim/screens/additional/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:senim/screens/auth/auth_screen.dart';

class AppRoutes {
  static const auth = '/auth';
  static const settings = '/settings';
  static const addOrder = '/addOrder';
  static const addCompany = '/addCompany';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.auth:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AuthScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.settings:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const SettingsScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.addOrder:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AddOrderScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.addCompany:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AddCompanyScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      // case AppRoutes.entryPage:
      //   final mapArgs = args as Map<String, dynamic>;
      //   final job = mapArgs['job'] as Job;
      //   final entry = mapArgs['entry'] as Entry?;
      //   return MaterialPageRoute<dynamic>(
      //     builder: (_) => EntryPage(job: job, entry: entry),
      //     settings: settings,
      //     fullscreenDialog: true,
      //   );
      default:
        // ignore: todo
        // TODO: Throw
        return null;
    }
  }
}
