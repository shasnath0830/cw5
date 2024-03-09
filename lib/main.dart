// main.dart file
import 'package:flutter/material.dart';
import 'rocket_selection_screen.dart'; // Make sure to import this

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rocket Racing Game',
      home: RocketSelectionScreen(), // Start with the selection screen
    );
  }
}
