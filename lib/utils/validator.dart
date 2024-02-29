import 'package:senim/widgets/sm_textfield.dart';

class Validator {

  static String? validate(String? value, SMTextFieldType type) {
    switch(type) {
      case SMTextFieldType.name:
        return _validateName(value);
      case SMTextFieldType.surname:
        return _validateName(value);
      case SMTextFieldType.email:
        return _validateEmail(value);
      case SMTextFieldType.password:
        return _validatePassword(value);
      case SMTextFieldType.normal:
        return null;
    }
  }

  static String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Это поле не может быть пустым";
    } else if (value.length < 2) {
      return 'Имя должно содержать минимум 2 символа';
    } else {
      return null;
    }
  }

  static String? _validateEmail(String? value) {
    final emailExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (value == null || value.isEmpty) {
      return "Это поле не может быть пустым";
    } else if (!emailExp.hasMatch(value)) {
      return 'Неверный адрес электронной почты';
    } else {
      return null;
    }
  }

  static String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Это поле не может быть пустым";
    } else if (value.length < 8) {
      return 'Пароль должен содержать минимум 8 символов';
    } else {
      return null;
    }
  }
}