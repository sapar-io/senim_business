import 'dart:async';

import 'package:senim/logic/general_providers.dart';
import 'package:senim/logic/view_models/user_view_model.dart';
import 'package:senim/logic/widgets/auth_status.dart';
import 'package:senim/screens/app/dashboard/dashboard_screen.dart';
import 'package:senim/widgets/empty_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/models/user.dart' as model;

class PageManager extends ConsumerStatefulWidget {
  const PageManager({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _PageManagerState();
}

class _PageManagerState extends ConsumerState<PageManager> {
  // -- Variables --
  model.User? _user;
  StreamSubscription<model.User?>? _listener;

  // -- Methods --
  _getUser(String? uid) async {
    if (_listener != null || uid == null) return;

    Future.delayed(const Duration(seconds: 3), () async {
      _listener = ref
          .read(userRepositoryProvider)
          .listenUser(uid: uid)
          .listen((userListen) {
        ref.read(userViewModelProvider.notifier).updateUser(userListen);

        if (userListen == null) {
          ref.read(authRepositoryProvider).signOut();
          return;
        }

        setState(() {
          _user = userListen;
        });
      });
    });
  }

  void _logoutClearing() {
    _listener?.cancel();
    _listener = null;
    _user = null;
    Future.delayed(Duration.zero, () {
      ref.read(userViewModelProvider.notifier).updateUser(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AuthStatus(
      nonSignedInBuilder: (_) {
        _logoutClearing();
        return const DashboardScreen();
      },
      signedInBuilder: (_, uid) {
        _getUser(uid);

        if (_user == null) {
          return _loading();
        }

        if (_user!.role == 2 && _user!.status.isVerified == false) {
          return _waitApprove();
        } else {
          return const DashboardScreen();
        }
      },
    );
  }

  // -- Widgets --
  Widget _waitApprove() {
    return const Scaffold(
      body: EmptyContent(
        title: 'Ждите админа',
        message: 'Пока вас подтвердят',
      ),
    );
  }

  Widget _loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
