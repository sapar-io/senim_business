library auth;

import 'package:flutter/material.dart';
import 'package:senim/constants/sm_colors.dart';
import 'package:senim/logic/view_models/auth_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:senim/logic/general_providers.dart';
import 'package:senim/utils/utils.dart';
import 'package:senim/widgets/sm_button.dart';
import 'package:senim/widgets/sm_phone_textfield.dart';
import 'package:senim/widgets/sm_textfield.dart';
import 'package:senim/utils/responsive.dart';
import 'package:senim/screens/auth/onboarding/onboarding_screen.dart';

part 'widgets/header_title.dart';
part 'widgets/auth_toggle.dart';
part 'login_screen.dart';
part 'signup_screen.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, ref, _) {
      return ref.watch(authViewModelProvider)
          ? const _LoginScreen()
          : const _SignUpScreen();
    });
  }
}
