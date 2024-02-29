import 'package:senim/constants/sm_colors.dart';
import 'package:flutter/material.dart';

class SMCheckbox extends FormField<bool> {
  SMCheckbox({
    Key? key,
    required Widget title,
    FormFieldSetter<bool>? onSaved,
    bool autoValidate = true,
    bool initialValue = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: (validate) {
            return !autoValidate
                ? null
                : validate ?? false
                    ? null
                    : "ho";
          },
          initialValue: initialValue,
          builder: (FormFieldState<bool> state) {
            return CheckboxListTile(
              dense: state.hasError,
              title: title,
              value: state.value,
              onChanged: state.didChange,
              subtitle: state.hasError
                  ? Builder(
                      builder: (BuildContext context) => Text(
                        state.errorText ?? "errorTextNotFound",
                        style: TextStyle(color: Theme.of(context).errorColor),
                      ),
                    )
                  : null,
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: SMColors.primary,
            );
          },
        );
}
