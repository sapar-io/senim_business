import 'package:senim/logic/models/user.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Используется для страница аудентификации, для переключение между входом и регистрацией
final userViewModelProvider =
    StateNotifierProvider<_UserViewModel, model.User?>((_) => _UserViewModel());

class _UserViewModel extends StateNotifier<model.User?> {
  _UserViewModel() : super(null);

  void updateUser(model.User? user) {
    // ignore: avoid_print
    print("updateUser ${user?.role}");
    state = user;
  }
}