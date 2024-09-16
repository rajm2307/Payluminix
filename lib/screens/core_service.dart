import 'package:flutter/material.dart';

class CoreService extends StatefulWidget {
  const CoreService({super.key});

  @override
  State<CoreService> createState() => _CoreServiceState();
}

class _CoreServiceState extends State<CoreService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Service"),),);
  }
}