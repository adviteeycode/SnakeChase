import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake_chase/util/constants.dart';
import 'package:snake_chase/util/food_pixel.dart';
import 'package:snake_chase/util/game_control.dart';
import 'package:snake_chase/util/snake_pixel.dart';

class Game_sFrontScreen extends StatefulWidget {
  const Game_sFrontScreen({super.key, required this.rows, required this.cols});

  final int rows;
  final int cols;

  @override
  State<Game_sFrontScreen> createState() => _Game_sFrontScreenState();
}

class _Game_sFrontScreenState extends State<Game_sFrontScreen> {
  @override
  void initState() {
    super.initState();
    setFoodPosition(widget.rows, widget.cols);
  }

  void startGame() {
    Timer.periodic(Duration(milliseconds: gameSpeed), (timer) {
      setState(() {
        update(timer, widget.rows, widget.cols, startGame);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isGameRunning) {
          isGameRunning = true;
          startGame();
        }
      },
      onVerticalDragUpdate: (details) {
        if (details.delta.dy < 0 && snakeDirection != Direction.down) {
          snakeDirection = Direction.up;
        } else if (details.delta.dy > 0 && snakeDirection != Direction.up) {
          snakeDirection = Direction.down;
        }
      },
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0 && snakeDirection != Direction.left) {
          snakeDirection = Direction.right;
        } else if (details.delta.dx < 0 && snakeDirection != Direction.right) {
          snakeDirection = Direction.left;
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.rows * widget.cols,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.cols,
          ),
          itemBuilder: (context, index) {
            if (index == foodPosition) {
              return const FoodPixel();
            } else if (snake.contains(index)) {
              return SnakePixel(index: index);
            } else {
              return Container(
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
