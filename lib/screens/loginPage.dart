import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/screens/ConditionalPrimaryButton.dart';
import 'package:payluminix/screens/handleMoney.dart';
import 'package:payluminix/screens/showPermissionModal.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool validMobile = false;

  TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    mobileController.addListener(_validateMobileInput);
  }

  void _validateMobileInput() {
    setState(() {
      validMobile = RegExp(r'^[6-9]\d{9}$').hasMatch(mobileController.text);
    });
  }

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
                    'assets/images/Mobile-Apps--Streamline-Milano.svg.png',
                    height: 300,
                    color: Colors.white,
                  ),
                  // const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 25),
                        child: Text('Tell us your mobile\nnumber',
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
            // Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  TextField(
                    controller: mobileController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'MOBILE NUMBER',
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                    ),
                    style: const TextStyle(
                      fontFamily: 'Lobster',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 15),
                  // Checkbox and Description
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Checkbox(
                          activeColor: Colors.black,
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text:
                                      'Allow Vikram to access your bank information from ',
                                  style: TextStyle(
                                      color: Color.fromARGB(150, 0, 0, 0))),
                              TextSpan(
                                text: 'RBI approved bureaus',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  decoration: TextDecoration.underline,
                                ),
                                // Add tap gesture if needed
                              ),
                              TextSpan(
                                  text:
                                      '. This does not impact your bank information.',
                                  style: TextStyle(
                                      color: Color.fromARGB(150, 0, 0, 0))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 220),
                  // Next Button
                  Center(
                    child: ConditionalPrimaryButton(
                      onButtonPressed: () {
                        if (mobileController.text == "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Please Enter Mobile Number'),
                          ));
                        } else if (_isChecked == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please check the box to proceed'),
                            ),
                          );
                        } else if (validMobile == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter valid mobile number'),
                            ),
                          );
                        } else {
                          showPermissionModal(context);
                        }
                      },
                      buttonText: 'Next',
                      validMobile: validMobile,
                      isChecked: _isChecked,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
