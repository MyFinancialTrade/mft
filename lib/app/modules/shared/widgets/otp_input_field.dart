import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sizer/sizer.dart';

class OtpInputField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final onSubmit;
  const OtpInputField({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OtpTextField(
          numberOfFields: 4,
          fieldHeight: 14.w,
          fieldWidth: 14.w,
          margin: EdgeInsets.only(right: 3.w, left: 3.w),
          borderColor: Color(0x21212140),
          showFieldAsBox: true,
          onCodeChanged: (String code) {},
          onSubmit: onSubmit,
        ),
      ],
    );
  }
}
