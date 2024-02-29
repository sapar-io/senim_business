import 'package:firebase_core/firebase_core.dart';
import 'package:senim/logic/widgets/page_manager.dart';
import 'package:senim/utils/app_scrollable.dart';
import 'package:senim/config/routes/app_router.dart';
import 'package:senim/config/themes/app_dark_theme.dart';
import 'package:senim/config/themes/app_theme.dart';
import 'package:senim/utils/utils.dart';
import 'package:senim/firebase_options.dart';
import 'package:senim/logic/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  // Ждем инициализации Firebase
  WidgetsFlutterBinding.ensureInitialized();
  // Инициализируем главный метод Firebase в проекте
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Служба общих настроек - локальные данные
  final sharedPreferences = await SharedPreferences.getInstance();

  // Запускаем приложение в обертке с провайдером Riverpod
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesServiceProvider.overrideWithValue(
        SharedPreferencesService(sharedPreferences),
      )
    ],
    child: const SenimApp(),
  ));
}

class SenimApp extends StatelessWidget {
  const SenimApp({Key? key}) : super(key: key);

  // Создаем уведомителя - который будет вызываться при смене темы (темной - светлой)
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Senim.me',
          theme: SMLightThemeData,
          darkTheme: SMDarkThemeData,
          themeMode: currentMode,
          scrollBehavior: SMAppScrollBehavior(),
          scaffoldMessengerKey: Utils.messengerKey,
          home: const PageManager(),
          onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
          // routes: appRoutes,
        );
      },
    );
  }
}
