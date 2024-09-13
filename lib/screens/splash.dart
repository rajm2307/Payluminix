import 'package:flutter/material.dart';
import 'package:payluminix/screens/earnCashBack.dart';
import 'package:payluminix/screens/tell_us_your_mobile_no.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isFirstTimeUser;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();
  }

  // Check if the user is a first-time user using SharedPreferences
  Future<void> _checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('isFirstTimeUser') ??
        true; // Default to true if not found
    setState(() {
      isFirstTimeUser = firstTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTimeUser == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (isFirstTimeUser == true) {
      return const EarnCashBack();
    } else {
      return LoginScreen();
    }
  }
}