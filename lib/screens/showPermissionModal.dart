import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payluminix/essentials/fonts.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:permission_handler/permission_handler.dart'; // You can customize this for your fonts.

void showPermissionModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes it full screen height
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Secure your account on Luminpay',
                style: textStyles.copyWith(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.black)),
            const SizedBox(height: 20),
            Row(
              children: [
                Image.asset(
                  'assets/images/sms.png',
                  height: 26,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38),
                    Text('SMS permission',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(
                        height:
                            4), // Adding some space between the title and the subtitle
                    Text(
                        'To personalize payment management & verify your\nmobile. Your personal message is never read',
                        style: textStyles.copyWith(fontSize: 14)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/call.png',
                  height: 26,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38),
                    Text('Call permission',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Text(
                        'To confirm if your number matches your SIM. Calls\nare nevermade or answered by Vikram',
                        style: textStyles.copyWith(fontSize: 14)),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/location.png',
                  height: 26,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 38),
                    Text('Location Permission',
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(height: 4),
                    Text(
                        'To personalize payment management & verify your\nmobile. Your personal message is never read',
                        style: textStyles.copyWith(fontSize: 14)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 125),
            Center(
              child: Primarybutton(
                onButtonPressed: () {
                  _requestPermissions();
                },
                buttonText: 'Allow',
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      );
    },
  );
}

Future<void> _requestPermissions() async {
    // Request permission for SMS
  var smsPermission = await Permission.sms.request();
  if (smsPermission.isGranted) {
    print('SMS permission granted');
  } else {
    print('SMS permission denied');
  }

  // Request permission for Phone (Call)
  var phonePermission = await Permission.phone.request();
  if (phonePermission.isGranted) {
    print('Phone permission granted');
  } else {
    print('Phone permission denied');
  }

  // Request permission for Location
  var locationPermission = await Permission.location.request();
  if (locationPermission.isGranted) {
    print('Location permission granted');
  } else {
    print('Location permission denied');
  }
}
