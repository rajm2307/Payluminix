import 'package:flutter/material.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:payluminix/essentials/fonts.dart';

class Primarybutton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;
  final Color? backgroundColor; 
  final TextStyle? textStyle; 

  const Primarybutton({
    super.key,
    required this.buttonText,
    required this.onButtonPressed,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  _PrimarybuttonState createState() => _PrimarybuttonState();
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              widget.backgroundColor ?? const Color.fromRGBO(36, 62, 76, 1)),
        ),
        onPressed: widget.onButtonPressed,
        child: Text(
          widget.buttonText,
          style: widget.textStyle ?? const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
