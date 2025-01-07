import 'package:flutter/material.dart';
import 'package:snake_chase/Constants/constant.dart';
import 'package:snake_chase/GameMachanics/game_machanics.dart';
import 'package:snake_chase/Screens/game_screen.dart';
import 'package:snake_chase/util/my_text.dart';

Widget gameOverScreen(BuildContext context, Function startGame) {
  TextEditingController nameController = TextEditingController();
  return AlertDialog(
    title: MyText(
      text: "Game Over",
      textColor: Colors.red,
      fontSize: 40,
      letterSpacing: 0,
    ),
    content: Column(
      children: [
        MyText(
          text: "You scored : $score",
          textColor: Colors.green,
          letterSpacing: 0,
        ),
        SizedBox(height: 10),
        Divider(),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Enter your name...",
          ),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          if (nameController.text.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: MyText(
                  text: '$score saved as ${nameController.text}',
                  letterSpacing: 0,
                  fontSize: 18,
                ),
                duration: Duration(seconds: 7),
                backgroundColor: Colors.green,
              ),
            );
            restartGame();
            nameController.clear();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GameScreen()));
          }
        },
        child: MyText(
          text: "Submit",
          fontSize: 18,
          textColor: Colors.deepPurple,
          letterSpacing: 0,
        ),
      ),
      TextButton(
        onPressed: () {
          nameController.clear();
          restartGame();
          startGame();
          Navigator.pop(context);
        },
        child: MyText(
          text: "Restart",
          fontSize: 18,
          textColor: Colors.deepPurple,
          letterSpacing: 0,
        ),
      ),
    ],
  );
}
