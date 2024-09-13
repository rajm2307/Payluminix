import 'package:flutter/material.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/screens/ConditionalPrimaryButton.dart';
import 'package:payluminix/screens/handleMoney.dart';
import 'package:payluminix/screens/showPermissionModal.dart';

class Otppage extends StatefulWidget {
  @override
  _OtppageState createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
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
            ),
            // Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                  const SizedBox(height: 15),
                  // Checkbox and Description
                  const SizedBox(height: 220),
                  // Next Button
                  Center()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
