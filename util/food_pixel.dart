import 'package:flutter/material.dart';
import 'package:snake_chase/util/constants.dart';

class FoodPixel extends StatelessWidget {
  const FoodPixel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      child: Center(
        child: Text(
          score.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: (score < 100) ? 20 : 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
