import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart'; // Import the components library

void main() {
  runApp(GameWidget(game: RocketRacingGame()));
}

class RocketRacingGame extends FlameGame {
  late final SpriteComponent background;

  @override
  Future<void> onLoad() async {
    // Call the super method to make sure all Flame components are properly initialized
    await super.onLoad();
    // Load the background sprite using the 'loadSprite' method
    final sprite = await loadSprite('background.png');
    // Instantiate your background as a SpriteComponent
    background = SpriteComponent(sprite: sprite, size: size);
    // Ensure the background covers the entire screen
    background.size = size;

    // Add the background as a component to the game
    add(background);
  }
}
