import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    this.fontSize = 24,
    this.textColor = Colors.white,
    this.letterSpacing = 3,
  });

  final String text;
  final double fontSize;
  final Color textColor;
  final double letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.orbitron(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ),
      textAlign: TextAlign.center,
    );
  }
}
