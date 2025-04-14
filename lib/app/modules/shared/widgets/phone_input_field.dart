import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sizer/sizer.dart';

class CustomPhoneInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;

  const CustomPhoneInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
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
          child: IntlPhoneField(
            controller: controller,
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
              fillColor: Colors.white,
              hintText: hint,
              hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                height: 24 / 13,
                letterSpacing: 0,
                color: const Color(0x80212121),
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
            ),
            dropdownIconPosition: IconPosition.trailing,
            initialCountryCode: 'US', 
            disableLengthCheck: true,
            showDropdownIcon: false,
            flagsButtonMargin: EdgeInsets.only(left: 2.w),
          ),
        ),
        SizedBox(height: 1.9.h),
      ],
    );
  }
}
