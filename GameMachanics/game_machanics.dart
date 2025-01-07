import 'dart:async';
import 'dart:math';

import 'package:snake_chase/Constants/constant.dart';

void moveSnake(Timer timer, Function startGame) {
  if (currentDirection == Direction.right) {
    (snake.last % col == col - 1)
        ? snake.add(snake.last - col + 1)
        : snake.add(snake.last + 1);
  } else if (currentDirection == Direction.left) {
    (snake.last % col == 0)
        ? snake.add(snake.last + col - 1)
        : snake.add(snake.last - 1);
  } else if (currentDirection == Direction.up) {
    (snake.last - col < 0)
        ? snake.add(snake.last + (row - 1) * col)
        : snake.add(snake.last - col);
  } else {
    (snake.last + col >= row * col)
        ? snake.add(snake.last - (row - 1) * col)
        : snake.add(snake.last + col);
  }

  if (snake.contains(food)) {
    food = generateFood();
    score++;
    if (speedOfSnake > 190) speedOfSnake -= 5;
    timer.cancel();
    startGame();
  } else {
    snake.removeAt(0);
  }
}

int generateFood() {
  while (snake.contains(food)) {
    food = Random().nextInt(row * col);
  }
  return food;
}

bool isGameOver() {
  for (int i = 0; i < snake.length - 1; i++) {
    if (snake[i] == snake.last) {
      return true;
    }
  }
  return false;
}

void restartGame() {
  isGameRunning = false;
  snake = [47, 48, 49, 50, 51];
  score = 0;
  speedOfSnake = 300;
  food = generateFood();
}
