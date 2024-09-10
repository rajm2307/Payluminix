import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/essentials/text_and_images.dart';
import 'package:payluminix/screens/tell_us_your_mobile_no.dart';

class Handlemoney extends StatefulWidget {
  const Handlemoney({super.key});

  @override
  State<Handlemoney> createState() => _HandlemoneyState();
}

class _HandlemoneyState extends State<Handlemoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 55,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(text: 'Transform the\n', style: textStyle),
              TextSpan(style: textStyle, text: 'way you handle\n'),
              TextSpan(
                  text: 'money',
                  style: textStyle.copyWith(
                    color: const Color.fromRGBO(96, 182, 203, 1),
                  )),
            ])),
            const SizedBox(
              height: 25,
            ),
            const Text_images(
              text: 'Track your spending and save for what\nmatters.',
              imageUrl: 'assets/images/Receive Money.png',
            ),
            const SizedBox(
              height: 35,
            ),
            Primarybutton(
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobileNumberScreen(),
                  ),
                );
              },
              buttonText: 'Get Started',
            )
          ],
        ),
      ),
    );
  }
}
