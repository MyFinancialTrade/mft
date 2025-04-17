import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class WidthButton extends StatelessWidget {
  final bool active;
  final String title;
  final VoidCallback onTap;

  const WidthButton({
    super.key,
    required this.active,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.8.h,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: active ? Color(0xFF0D0A5C) : Color(0x800D0A5C),
            borderRadius: BorderRadius.circular(17),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              height: 22 / 18,
              letterSpacing: 0,
              color: const Color(0xFFFAFAFA),
            ),
          ),
        ),
      ),
    );
  }
}
