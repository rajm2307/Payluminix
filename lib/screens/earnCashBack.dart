import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/essentials/text_and_images.dart';
import 'package:payluminix/screens/handleMoney.dart';
import 'package:payluminix/screens/manageMoney.dart';

class EarnCashBack extends StatefulWidget {
  const EarnCashBack({super.key});

  @override
  State<EarnCashBack> createState() => _EarnCashBackState();
}

class _EarnCashBackState extends State<EarnCashBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Handlemoney(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: textStyles,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: 'Earn ', style: textStyle),
            TextSpan(
                text: 'cashback\n',
                style: textStyle.copyWith(
                  color: const Color.fromRGBO(96, 182, 203, 1),
                )),
            TextSpan(style: textStyle, text: 'on every \ntransaction')
          ])),
          const SizedBox(
            height: 25,
          ),
          const Text_images(
            text:
                'Start saving with each purchase and\nwatch your rewards grow.',
            imageUrl:
                'assets/images/Becoming-Rich-2--Streamline-Milano.svg.png',
          ),
          const SizedBox(
            height: 35,
          ),
          Primarybutton(
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Managemoney(),
                ),
              );
            },
            buttonText: 'Next',
          )
        ],
      ),
    );
  }
}
