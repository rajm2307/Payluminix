import 'package:flutter/material.dart';
import 'package:payluminix/essentials/primaryButton.dart';
import 'package:payluminix/screens/earnCashBack.dart';
import 'package:payluminix/screens/handleMoney.dart';
import 'package:payluminix/screens/manageMoney.dart';
import 'package:payluminix/screens/tell_us_your_mobile_no.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: EarnCashBack(),
    );
  }
}
