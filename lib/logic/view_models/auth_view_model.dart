import 'package:flutter_riverpod/flutter_riverpod.dart';

// Используется для страница аудентификации, для переключение между входом и регистрацией
final authViewModelProvider =
    StateNotifierProvider<_AuthViewModel, bool>((_) => _AuthViewModel());

class _AuthViewModel extends StateNotifier<bool> {
  _AuthViewModel() : super(true);

  void toggle() {
    var oldValue = state;
    state = !oldValue;
  }

  void set({required bool isLogin}) {
    state = isLogin;
  }
}
