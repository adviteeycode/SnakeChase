import 'package:flutter/material.dart';
import 'package:snake_chase/util/constants.dart';

class SnakePixel extends StatelessWidget {
  const SnakePixel({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    if (index == snake.last) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        // eyes of the snake
        child: Padding(padding: const EdgeInsets.all(3), child: eyeOfSnake()),
      );
    } else {
      // body of the snake
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }
  }
}

// eyes cordination with its direction
Widget eyeOfSnake() {
  // snake moving right direction
  if (snakeDirection == Direction.right) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        singleEyeOfSnake(),
        singleEyeOfSnake(),
      ],
    );
  }
  // if snake moving left direction
  else if (snakeDirection == Direction.left) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        singleEyeOfSnake(),
        singleEyeOfSnake(),
      ],
    );
  }
  // if snake moving up direction
  else if (snakeDirection == Direction.up) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        singleEyeOfSnake(),
        singleEyeOfSnake(),
      ],
    );
  }
  // if snake moving down direction
  else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        singleEyeOfSnake(),
        singleEyeOfSnake(),
      ],
    );
  }
}

Container singleEyeOfSnake() {
  return Container(
    height: 5,
    width: 6,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(5),
    ),
  );
}
