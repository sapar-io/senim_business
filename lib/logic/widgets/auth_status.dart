import 'package:senim/logic/general_providers.dart';
import 'package:senim/widgets/empty_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChange;
});

class AuthStatus extends ConsumerStatefulWidget {
  final WidgetBuilder nonSignedInBuilder;
  final Widget Function(BuildContext, String) signedInBuilder;

  const AuthStatus({
    Key? key,
    required this.signedInBuilder,
    required this.nonSignedInBuilder,
  }) : super(key: key);

  @override
  ConsumerState<AuthStatus> createState() => _AuthStatusState();
}

class _AuthStatusState extends ConsumerState<AuthStatus> {
  // -- Build --
  @override
  Widget build(BuildContext context) {
    final authStateChanges = ref.watch(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) => _data(context, user),
      loading: () => _loading(),
      error: (_, __) => _error(),
    );
  }

  Widget _data(BuildContext context, User? firebaseUser) {
    if (firebaseUser == null) {
      return widget.nonSignedInBuilder(context);
    } else {
      return widget.signedInBuilder(context, firebaseUser.uid);
    }
  }

  // - Components --
  Widget _loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _error() {
    return const Scaffold(
      body: EmptyContent(
        title: 'Something went wrong',
        message: 'Can\'t load data right now.',
      ),
    );
  }
}
