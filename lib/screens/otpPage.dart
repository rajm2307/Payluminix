import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/screens/homePage.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otppage extends StatefulWidget {
  @override
  _OtppageState createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  TextEditingController _otpController = TextEditingController();
  final String _correctOtp = '123456';

  void _completeOTPPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
    print(
        "isOTPCompleted_________________________________________________________________________");
  }

  otpCheck() {
    if (_otpController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter OTP'),
        ),
      );
      print('Please enter OTP');
    } else if (_otpController.text != _correctOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter Correct OTP'),
        ),
      );
      print('Please enter Correct OTP');
    } else if (_otpController.text == _correctOtp) {
      _completeOTPPage();
      print(
          "isOTPCompleted_________________________________________________________________________");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section with Image and Text

            Container(
              color: Colors.black,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Otp-One-Time-Password--Streamline-Milano.svg.png',
                    height: 300,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text('Enter the OTP sent to\n9360335806',
                            style: textStyle.copyWith(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
            ),
            // Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 45),
                  Pinput(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    length: 6,
                    // onCompleted: (pin) {
                    //   if (pin == _correctOtp) {
                    //     Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(builder: (context) => Homepage()),
                    //     );
                    //   }
                    // },
                    separatorBuilder: (index) => SizedBox(width: 15),

                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 70,
                      textStyle:
                          const TextStyle(fontSize: 20, color: Colors.black),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(0, 0, 0, 1), width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text:
                                'By proceeding, you are indicating that you have read and agree to our ',
                            style:
                                TextStyle(color: Color.fromARGB(150, 0, 0, 0))),
                        TextSpan(
                          text: 'Terms of Use ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                            text: '& ',
                            style:
                                TextStyle(color: Color.fromARGB(150, 0, 0, 0))),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 170,
            ),

            Center(
                child: Primarybutton(
              onButtonPressed: otpCheck,
              buttonText: 'Done',
            )),
          ],
        ),
      ),
    );
  }
}
