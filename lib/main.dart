import 'package:flutter/material.dart';
import 'package:payluminix/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Luminix',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}





