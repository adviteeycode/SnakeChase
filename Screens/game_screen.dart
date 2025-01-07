import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snake_chase/Constants/constant.dart';
import 'package:snake_chase/GameMachanics/game_machanics.dart';
import 'package:snake_chase/Screens/pixels.dart';
import 'package:snake_chase/GameMachanics/pixel_counter.dart';
import 'package:snake_chase/Screens/game_over_screen.dart';
import 'package:snake_chase/util/my_text.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // intitalizing variables

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    findColumn(width);
    findRow(width / col, height);

    void startGame() {
      isGameRunning = true;
      food = generateFood();
      Timer.periodic(Duration(milliseconds: speedOfSnake), (timer) {
        setState(() {
          moveSnake(timer, startGame);
          if (isGameOver()) {
            timer.cancel();
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => gameOverScreen(context, startGame),
            );
          }
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Container(),
            GestureDetector(
              onTap: (isGameRunning) ? null : startGame,
              onVerticalDragUpdate: (details) {
                if (details.delta.dy < 0 &&
                    currentDirection != Direction.down) {
                  currentDirection = Direction.up;
                } else if (details.delta.dy > 0 &&
                    currentDirection != Direction.up) {
                  currentDirection = Direction.down;
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0 &&
                    currentDirection != Direction.left) {
                  currentDirection = Direction.right;
                } else if (details.delta.dx < 0 &&
                    currentDirection != Direction.right) {
                  currentDirection = Direction.left;
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    MyText(
                      text: "Score: $score",
                    ),
                    Expanded(
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: row * col,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: col),
                          itemBuilder: (context, index) {
                            if (snake.contains(index)) {
                              return snakePixel(index);
                            } else if (index == food) {
                              return foodPixel();
                            } else {
                              return emptyPixel();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
