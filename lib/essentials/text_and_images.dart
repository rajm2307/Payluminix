import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';

class Text_images extends StatefulWidget {
  final String text;
  final String imageUrl;

  const Text_images({
    super.key,
    required this.text,
    required this.imageUrl,
  });

  @override
  _Text_imagesState createState() => _Text_imagesState();
}

class _Text_imagesState extends State<Text_images> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: Text(
            widget.text,
            style: textStyles,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 375,
          child: Image(
              image: AssetImage(
            widget.imageUrl,
          )),
        ),
      ],
    );
  }
}
