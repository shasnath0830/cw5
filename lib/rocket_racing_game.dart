// Updated RocketRacingGame class in rocket_racing_game.dart
import 'package:cw5/rocket.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';

class RocketRacingGame extends FlameGame {
  final Rocket selectedRocket;
  late final SpriteComponent background;
  late final SpriteComponent rocketSprite;

  bool moveLeft = false;
  bool moveRight = false;

  RocketRacingGame({required this.selectedRocket});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // Load the background sprite
    final backgroundSprite = await loadSprite('background.png');
    background = SpriteComponent(sprite: backgroundSprite, size: size);
    background.size = size;
    add(background);

    final rocketSpriteImage = await loadSprite(selectedRocket.spritePath);
    rocketSprite =
        SpriteComponent(sprite: rocketSpriteImage, size: Vector2(100, 200));

    // Calculate the horizontal center position and add a small offset to move it to the right
    double xOffset = 5;
    double centerX = (size.x - rocketSprite.size.x) / 2 + xOffset;

    // Set the y position to be near the bottom of the screen, adjust the offset as needed
    double bottomOffset = 50;
    double centerY = size.y - rocketSprite.size.y - bottomOffset;

    // Update the position of the rocket
    rocketSprite.position = Vector2(centerX, centerY);

    // Then add the sprite to the game
    add(rocketSprite);

    // Register keyboard event handlers
    RawKeyboard.instance.addListener(_onKeyEvent);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Move the rocket horizontally based on player input
    if (moveLeft) {
      rocketSprite.x -= 200 * dt; // Adjust the speed as needed
    }
    if (moveRight) {
      rocketSprite.x += 200 * dt; // Adjust the speed as needed
    }
  }

  @override
  void onRemove() {
    // Unregister keyboard event handlers
    RawKeyboard.instance.removeListener(_onKeyEvent);
    super.onRemove();
  }

  // Handle keyboard events
  void _onKeyEvent(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        moveLeft = true;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        moveRight = true;
      }
    } else if (event is RawKeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        moveLeft = false;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        moveRight = false;
      }
    }
  }
}
