import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TermsAgreement extends StatefulWidget {
  const TermsAgreement({super.key});

  @override
  State<TermsAgreement> createState() => _TermsAgreementState();
}

class _TermsAgreementState extends State<TermsAgreement> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
          activeColor: const Color(0xff0D0A5C),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        Flexible(
          child: Wrap(
            children: [
              Text(
                "I’m agree to The  ",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.3.sp,
                  height: 1.0,
                  letterSpacing: 0,
                  color: const Color(0x80212121),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Terms of Service",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.3.sp,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xff0D0A5C),
                  ),
                ),
              ),
              Text(
                " and ",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 13.3.sp,
                  height: 1.0,
                  letterSpacing: 0,
                  color: const Color(0x80212121),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Privacy Policy",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 13.3.sp,
                    height: 1.0,
                    letterSpacing: 0,
                    color: const Color(0xff0D0A5C),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
