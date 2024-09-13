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






// import 'package:flutter/material.dart';

// class Primarybutton extends StatefulWidget {
//   final String buttonText;
//   final VoidCallback onButtonPressed;
//   final bool isChecked; // New boolean to control the style

//   const Primarybutton({
//     super.key,
//     required this.buttonText,
//     required this.onButtonPressed,
//     required this.isChecked, // Pass the isChecked state here
//   });

//   @override
//   _PrimarybuttonState createState() => _PrimarybuttonState();
// }

// class _PrimarybuttonState extends State<Primarybutton> {
//   @override
//   Widget build(BuildContext context) {
//     // Conditional styling based on the isChecked property
//     Color backgroundColor;
//     TextStyle textStyle;

//     if (widget.isChecked) {
//       backgroundColor = Colors.green; // Change background color if checked
//       textStyle = const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
//     } else {
//       backgroundColor = Colors.grey; // Default color when not checked
//       textStyle = const TextStyle(color: Colors.white, fontSize: 18);
//     }

//     return SizedBox(
//       width: 345,
//       height: 55,
//       child: TextButton(
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
//         ),
//         onPressed: widget.onButtonPressed,
//         child: Text(
//           widget.buttonText,
//           style: textStyle,
//         ),
//       ),
//     );
//   }
// }
