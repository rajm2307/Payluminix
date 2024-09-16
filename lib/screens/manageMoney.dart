import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/essentials/text_and_images.dart';
import 'package:payluminix/screens/handleMoney.dart';
import 'package:payluminix/screens/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Managemoney extends StatefulWidget {
  const Managemoney({super.key});

  @override
  State<Managemoney> createState() => _ManagemoneyState();
}

class _ManagemoneyState extends State<Managemoney> {

      // Function to navigate to login page and save onboarding status
  void _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTimeUser', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
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
                  onPressed: _completeOnboarding,

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
            TextSpan(text: 'Manage ', style: textStyle),
            TextSpan(
                text: 'Money\n',
                style: textStyle.copyWith(
                  color: const Color.fromRGBO(96, 182, 203, 1),
                )),
            TextSpan(style: textStyle, text: 'with Luminpay'),
          ])),
          const SizedBox(
            height: 25,
          ),
          const Text_images(
            text:
                'Easily monitor your spending,\nsavings, and earnings all in one place.\n \n \n',
            imageUrl:
                'assets/images/Data-Organization--Streamline-Milano.svg.png',
          ),
          const SizedBox(
            height: 35,
          ),
          Primarybutton(
            onButtonPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Handlemoney(),
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
