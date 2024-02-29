import 'package:flutter/material.dart';

enum SMButtonStyle { primary, secondary }

enum SMButtonHeight { large, medium, small }

enum SMButtonWidth { fill, content }

class SMButton extends StatelessWidget {
  final SMButtonStyle style;
  final String title;
  final SMButtonHeight height;
  final SMButtonWidth width;
  final VoidCallback? onPressed;

  const SMButton({
    Key? key,
    this.style = SMButtonStyle.primary,
    required this.title,
    this.height = SMButtonHeight.large,
    this.width = SMButtonWidth.fill,
    required this.onPressed,
  }) : super(key: key);

  bool get _isPrimary {
    return style == SMButtonStyle.primary;
  }

  double get _buttonHeight {
    switch (height) {
      case SMButtonHeight.large:
        return 56.0;
      case SMButtonHeight.medium:
        return 48.0;
      case SMButtonHeight.small:
        return 32.0;
    }
  }

  double? get _buttonWidth {
    switch (width) {
      case SMButtonWidth.fill:
        return double.infinity;
      case SMButtonWidth.content:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _buttonWidth,
      height: _buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _isPrimary ? Theme.of(context).primaryColor : Colors.white,
          side: BorderSide(
            width: _isPrimary ? 0 : 1,
            color: _isPrimary
                ? Colors.transparent
                : Theme.of(context).primaryColor,
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:
                    _isPrimary ? Colors.white : Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
