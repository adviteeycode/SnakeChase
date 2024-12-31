import 'dart:async';
import 'dart:math';

import 'package:snake_chase/util/constants.dart';

void update(Timer timer, int rows, int cols, Function startGame) {
  if (snakeDirection == Direction.down) {
    if (snake.last + cols >= rows * cols) {
      snake.add(snake.last - (rows - 1) * cols);
    } else {
      snake.add(snake.last + cols);
    }
  } else if (snakeDirection == Direction.up) {
    if (snake.last - cols < 0) {
      snake.add(snake.last + (rows - 1) * cols);
    } else {
      snake.add(snake.last - cols);
    }
  } else if (snakeDirection == Direction.left) {
    if (snake.last % cols == 0) {
      snake.add(snake.last + cols - 1);
    } else {
      snake.add(snake.last - 1);
    }
  } else if (snakeDirection == Direction.right) {
    if ((snake.last + 1) % cols == 0) {
      snake.add(snake.last - cols + 1);
    } else {
      snake.add(snake.last + 1);
    }
  }
  if (snake.last == foodPosition) {
    score++;
    if (gameSpeed > 220) {
      timer.cancel();
      gameSpeed -= 4;
      startGame();
    }
    setFoodPosition(rows, cols);
  } else {
    snake.removeAt(0);
  }
  isGameOver(timer);
}

void isGameOver(Timer timer) {
  for (int i = 0; i < snake.length - 1; i++) {
    if (snake[i] == snake.last) {
      timer.cancel();
      isGameRunning = false;
      snakeDirection = Direction.right;
      break;
    }
  }
}

void setFoodPosition(int rows, int cols) {
  while (snake.contains(foodPosition)) {
    foodPosition = Random().nextInt(rows * cols);
  }
}
