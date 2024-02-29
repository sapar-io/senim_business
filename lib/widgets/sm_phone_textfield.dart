import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SMPhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool focus;

  const SMPhoneTextField({
    Key? key,
    required this.controller,
    this.focus = false,
  }) : super(key: key);

  @override
  State<SMPhoneTextField> createState() => _SMPhoneTextFieldState();
}

class _SMPhoneTextFieldState extends State<SMPhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: 'KZ',
      controller: widget.controller,
      invalidNumberMessage: 'Неверный номер телефона',
      decoration: const InputDecoration(
        counterText: '',
      ),
      pickerDialogStyle: PickerDialogStyle(
        searchFieldInputDecoration: const InputDecoration(
          labelText: "Поиск страны",
        ),
      ),
    );
  }
}
