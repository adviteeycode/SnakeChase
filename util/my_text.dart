import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 24,
    this.letterSpacing = 4,
    this.opacity = 1,
  });

  final String text;
  final Color color;
  final double fontSize;
  final double letterSpacing;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.orbitron(
          color: color.withOpacity(opacity),
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          fontWeight: FontWeight.bold,
        ));
  }
}
