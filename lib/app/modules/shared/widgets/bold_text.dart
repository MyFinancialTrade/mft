import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const BoldText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: fontSize ?? 16,
        height: 1.0,
        letterSpacing: 0,
        color: color ?? const Color(0xff0D0A5C),
      ),
    );
  }
}
