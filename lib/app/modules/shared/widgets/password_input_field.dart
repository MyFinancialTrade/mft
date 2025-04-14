import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomPasswordInputField extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const CustomPasswordInputField({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
  });

  @override
  State<CustomPasswordInputField> createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            height: 32 / 15,
            letterSpacing: 0,
            color: const Color(0xFF212121),
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 7.h,
          child: TextFormField(
            controller: widget.controller,
            //  expands: true,
            // maxLines: null,
            // minLines: null,
            obscureText: _obscureText,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              height: 24 / 13,
              letterSpacing: 0,
              color: const Color(0xFF212121),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 1.h, left: 4.w),
              
              filled: true,
              fillColor: const Color(0xFFFAFAFA),
              hintText: widget.hint,
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 24 / 13,
                letterSpacing: 0,
                color: const Color(0x80212121),
              ),
              suffixIcon: GestureDetector(
                onTap: () => setState(() => _obscureText = !_obscureText),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0x21212147),
                    size: 20,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0x24212121),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0x24212121),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Color(0xFF212121),
                  width: 1,
                ),
              ),
              focusColor: const Color(0xff212121),
            ),
          ),
        ),
        SizedBox(height: 1.9.h),
      ],
    );
  }
}
