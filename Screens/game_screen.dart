import 'package:flutter/material.dart';
import 'package:snake_chase/Screens/game_s_back.dart';
import 'package:snake_chase/Screens/game_s_front.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final int screenWidth = MediaQuery.of(context).size.width.toInt();
    final int screenHeight = MediaQuery.of(context).size.height.toInt();

    int rows = (screenHeight ~/ screenWidth) * 7;
    int cols = screenHeight ~/ screenWidth * rows;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Game_sBackScreen(),
              Game_sFrontScreen(
                rows: cols,
                cols: rows,
              ),
            ],
          ),
        ));
  }
}
