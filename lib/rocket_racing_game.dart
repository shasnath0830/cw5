// RocketRacingGame class in rocket_racing_game.dart
import 'package:cw5/rocket.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class RocketRacingGame extends FlameGame {
  final Rocket selectedRocket;
  late final SpriteComponent background;
  late final SpriteComponent rocketSprite;

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
    rocketSprite = SpriteComponent(sprite: rocketSpriteImage, size: Vector2(100, 200));

    // Calculate the horizontal center position and add a small offset to move it to the right
    double xOffset = 5; // Adjust this value to move the rocket more to the right
    double centerX = (size.x - rocketSprite.size.x) / 2 + xOffset;

    // Set the y position to be near the bottom of the screen, adjust the offset as needed
    double bottomOffset = 50; // Adjust this value as needed to move the rocket up from the very bottom
    double centerY = size.y - rocketSprite.size.y - bottomOffset;

    // Update the position of the rocket
    rocketSprite.position = Vector2(centerX, centerY);

    // Then add the sprite to the game
    add(rocketSprite);

  }
}
