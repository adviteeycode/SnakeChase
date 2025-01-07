import 'package:flutter/material.dart';
import 'package:snake_chase/Constants/constant.dart';

// snake
Container snakePixel(int index) {
  if (snake.last == index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: snakeEyes(),
    );
  }
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

// snake eyes
Padding snakeEyes() {
  if (currentDirection == Direction.right) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          snakeEye(),
          snakeEye(),
        ],
      ),
    );
  } else if (currentDirection == Direction.left) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          snakeEye(),
          snakeEye(),
        ],
      ),
    );
  } else if (currentDirection == Direction.up) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          snakeEye(),
          snakeEye(),
        ],
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          snakeEye(),
          snakeEye(),
        ],
      ),
    );
  }
}

// snake eye
Container snakeEye() {
  return Container(
    height: 5,
    width: 5,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

// food
Container foodPixel() {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 255, 8),
      borderRadius: BorderRadius.circular(4),
    ),
  );
}

// empty
Container emptyPixel() {
  return Container(
    margin: const EdgeInsets.all(3),
    color: Colors.transparent,
  );
}
