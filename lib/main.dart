// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_alexa_integration/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Home Automation',
      home: HomePage(),
    );
  }
}
