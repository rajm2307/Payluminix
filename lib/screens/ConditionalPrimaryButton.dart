import 'package:flutter/material.dart';
import 'package:payluminix/essentials/primaryButton.dart';

class ConditionalPrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final bool validMobile;
  final bool isChecked;

  const ConditionalPrimaryButton({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    required this.isChecked,
    required this.validMobile,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    TextStyle textStyle;

    if (isChecked && validMobile) {
      backgroundColor = Color.fromRGBO(36, 62, 76, 1);
      textStyle = const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
    } else {
      backgroundColor = Colors.grey;
      textStyle = const TextStyle(color: Colors.white, fontSize: 18);
    }

    return Primarybutton(
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
      backgroundColor: backgroundColor,
      textStyle: textStyle,
    );
  }
}


