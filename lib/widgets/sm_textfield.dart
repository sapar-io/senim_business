import 'package:senim/utils/validator.dart';
import 'package:flutter/material.dart';

enum SMTextFieldType {
  name,
  surname,
  email,
  password,
  normal,
}

class SMTextField extends StatefulWidget {
  final SMTextFieldType type;
  final Icon? icon;
  final String? placeholder;
  final TextEditingController controller;
  final bool focus;
  final ValueSetter<String>? onSaved;
  final bool enabled;
  final bool validate;

  const SMTextField({
    Key? key,
    this.type = SMTextFieldType.normal,
    this.icon,
    this.placeholder,
    required this.controller,
    this.focus = false,
    this.onSaved,
    this.enabled = true,
    this.validate = true,
  }) : super(key: key);

  @override
  State<SMTextField> createState() => _SMTextFieldState();
}

class _SMTextFieldState extends State<SMTextField> {
  String get _defaultPlaceholder {
    switch (widget.type) {
      case SMTextFieldType.name:
        return "Ваше имя";
      case SMTextFieldType.surname:
        return "Ваше фамилия";
      case SMTextFieldType.email:
        return "Электронная почта";
      case SMTextFieldType.password:
        return "Пароль";
      case SMTextFieldType.normal:
        return "";
    }
  }

  Icon? get _defaultLeftIcon {
    switch (widget.type) {
      case SMTextFieldType.name:
        return const Icon(Icons.person);
      case SMTextFieldType.surname:
        return const Icon(Icons.co_present_outlined);
      case SMTextFieldType.email:
        return const Icon(Icons.mail);
      case SMTextFieldType.password:
        return const Icon(Icons.security);
      case SMTextFieldType.normal:
        return null;
    }
  }

  TextInputType? get _keyboardType {
    switch (widget.type) {
      case SMTextFieldType.name:
        return null;
      case SMTextFieldType.surname:
        return null;
      case SMTextFieldType.email:
        return TextInputType.emailAddress;
      case SMTextFieldType.password:
        return null;
      case SMTextFieldType.normal:
        return null;
    }
  }

  bool get _isPassword => widget.type == SMTextFieldType.password;

  bool _hidePass = true;

  IconButton? get _rightIcon {
    return !_isPassword
        ? null
        : IconButton(
            icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _hidePass = !_hidePass;
              });
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      cursorColor: Theme.of(context).primaryColor,
      onSaved: (value) {
        if (widget.onSaved != null && value != null) {
          widget.onSaved!(value);
        }
      },
      obscureText: _isPassword && _hidePass,
      keyboardType: _keyboardType,
      autofocus: widget.focus,
      validator: (value) => widget.validate ? Validator.validate(value, widget.type) : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.placeholder ?? _defaultPlaceholder,
        prefixIcon: widget.icon ?? _defaultLeftIcon,
        suffixIcon: _rightIcon,
      ),
    );
  }
}
