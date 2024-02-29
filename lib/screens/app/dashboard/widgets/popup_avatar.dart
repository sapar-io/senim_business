import 'package:senim/config/routes/app_router.dart';
import 'package:senim/logic/models/user.dart' as model;
import 'package:senim/logic/view_models/auth_view_model.dart';
import 'package:senim/logic/view_models/user_view_model.dart';
import 'package:senim/main.dart';
import 'package:senim/logic/general_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupAvatar extends ConsumerStatefulWidget {
  const PopupAvatar({Key? key, required this.isMobile}) : super(key: key);

  final bool isMobile;

  @override
  PopupAvatarState createState() => PopupAvatarState();
}

class PopupAvatarState extends ConsumerState<PopupAvatar> {
  model.User? _user;

  @override
  void initState() {
    super.initState();
  }

  // -- Methods --
  List<PopupMenuEntry> _menuItems(int userRole) {
    switch (userRole) {
      case 0:
        return [
          _themeItem(),
          const PopupMenuDivider(),
          _loginItem(),
          _signUpItem(),
        ];
      default:
        return [
          _themeItem(),
          const PopupMenuDivider(),
          _logoutItem(),
        ];
    }
  }

  // -- Build --
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userViewModelProvider);
    final userRole = user?.role ?? 0;

    setState(() {
      _user = user;
    });

    return PopupMenuButton(
      child: _avatar(),
      itemBuilder: (BuildContext context) => _menuItems(userRole),
    );
  }

  // -- Widgets --
  Widget _avatar() {
    return _user == null
        ? Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widget.isMobile ? 24 : 32),
            child: const Icon(Icons.menu, size: 32),
          )
        : Padding(
            padding:
                EdgeInsets.symmetric(horizontal: widget.isMobile ? 24 : 32),
            child: const Icon(Icons.person_outline, size: 32),
          );
    // : Container(
    //     margin: EdgeInsets.symmetric(horizontal: widget.isMobile ? 24 : 32),
    //     child: CircleAvatar(
    //       radius: widget.isMobile ? 16 : 24,
    //       backgroundImage: const NetworkImage(
    //           'https://www.pphfoundation.ca/wp-content/uploads/2018/05/default-avatar.png'),
    //     ),
    //   );
  }

  PopupMenuItem _themeItem() {
    return PopupMenuItem(
      child: ListTile(
        leading: Icon(Theme.of(context).brightness == Brightness.light
            ? Icons.dark_mode
            : Icons.light_mode),
        title: Text(Theme.of(context).brightness == Brightness.light
            ? 'Темная тема'
            : 'Светлая тема'),
        onTap: () {
          SenimApp.themeNotifier.value =
              Theme.of(context).brightness == Brightness.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
          Navigator.pop(context);
        },
      ),
    );
  }

  PopupMenuItem _loginItem() {
    return PopupMenuItem(
      child: ListTile(
        leading: const Icon(Icons.waving_hand_outlined),
        title: const Text('Войти'),
        onTap: () async {
          ref.read(authViewModelProvider.notifier).set(isLogin: true);
          Navigator.pop(context);
          await Navigator.pushNamed(context, AppRoutes.auth);
        },
      ),
    );
  }

  PopupMenuItem _signUpItem() {
    return PopupMenuItem(
      child: ListTile(
        leading: const Icon(Icons.waving_hand_outlined),
        title: const Text('Создать аккаунт'),
        onTap: () async {
          ref.read(authViewModelProvider.notifier).set(isLogin: false);
          Navigator.pop(context);
          await Navigator.pushNamed(context, AppRoutes.auth);
        },
      ),
    );
  }

  PopupMenuItem _logoutItem() {
    return PopupMenuItem(
      child: ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Выйти'),
        onTap: () async {
          Navigator.pop(context);
          await ref.read(authRepositoryProvider).signOut();
        },
      ),
    );
  }
}
