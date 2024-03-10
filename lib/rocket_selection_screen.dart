// Corrected imports for rocket_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:cw5/rocket.dart'; // Import the Rocket class
import 'package:cw5/rocket_racing_game.dart'; // Import the game class
import 'package:flame/game.dart';

class RocketSelectionScreen extends StatefulWidget {
  const RocketSelectionScreen({super.key});

  @override
  _RocketSelectionScreenState createState() => _RocketSelectionScreenState();
}

class _RocketSelectionScreenState extends State<RocketSelectionScreen> {
  Rocket? selectedRocket;
  double rocketX = 0; // Initial X position of the rocket
  double rocketY = 0; // Initial Y position of the rocket
  double rocketSize = 50; // Size of the rocket
  bool gameStarted = false; // Set this to true when the game starts

  // Define a list of available rockets
  final List<Rocket> rockets = [
    Rocket('Standard', 'assets/images/rockets/Standard.png'),
    Rocket('Falcon', 'assets/images/rockets/Falcon.png'),
    // Add more rockets here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Rocket'),
      ),
      body: ListView.builder(
        itemCount: rockets.length,
        itemBuilder: (context, index) {
          final rocket = rockets[index];
          return ListTile(
            title: Text(rocket.name),
            leading: Image.asset(rocket
                .spritePath), // This assumes you have these images in your assets
            onTap: () {
              setState(() {
                selectedRocket = rocket;
              });
            },
            selected: selectedRocket == rocket,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedRocket != null) {
            // Navigate to the game and pass the selected rocket
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GameWidget(
                  game: RocketRacingGame(selectedRocket: selectedRocket!),
                ),
              ),
            );
          } else {
            // Show an error or prompt to select a rocket
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please select a rocket to proceed.'),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
