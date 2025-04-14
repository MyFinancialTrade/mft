import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Header extends StatelessWidget {
  final String heading;
  final String body;
  final TextAlign textAlign;

  final double? headingFontSize;
  final double? bodyFontSize;
  final FontWeight? headingWeight;
  final FontWeight? bodyWeight;
  final Color? headingColor;
  final Color? bodyColor;

  const Header({
    super.key,
    required this.heading,
    required this.body,
    this.textAlign = TextAlign.start,
    this.headingFontSize,
    this.bodyFontSize,
    this.headingWeight,
    this.bodyWeight,
    this.headingColor,
    this.bodyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          textAlign: textAlign,
          style: GoogleFonts.montserrat(
            fontWeight: headingWeight ?? FontWeight.w700,
            fontSize: headingFontSize ?? 18.7.sp,
            height: 1.0,
            letterSpacing: 0,
            color: headingColor ?? const Color(0xFF212121),
          ),
        ),
        SizedBox(height: 1.5.h),
        Text(
          body,
          textAlign: textAlign,
          style: GoogleFonts.montserrat(
            fontWeight: bodyWeight ?? FontWeight.w400,
            fontSize: bodyFontSize ?? 16.7.sp,
            height: 1.5,
            letterSpacing: 0,
            color: bodyColor ?? const Color(0x9E212121),
          ),
        ),
      ],
    );
  }
}
