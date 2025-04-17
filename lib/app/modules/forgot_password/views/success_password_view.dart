import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mft/app/modules/shared/widgets/bold_text.dart';
import 'package:mft/app/modules/shared/widgets/width_button.dart';
import 'package:mft/app/routes/app_pages.dart';
import 'package:mft/app/utils/commons.dart';
import 'package:sizer/sizer.dart';

class SuccessPasswordView extends GetView {
  const SuccessPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(6.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 1.h),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 13.h),

                  SizedBox(
                    height: 23.h,
                    width: 23.h,
                    child: Image.asset('assets/images/success.png', scale: .5),
                  ),
                  SizedBox(height: 13.h),
                  BoldText(text: 'Password Updated!', fontSize: 21.sp),
                  SizedBox(height: 3.h),

                  Text(
                    'Your password has been reset! You can now log in with your new password.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      height: 22 / 18,
                      letterSpacing: 0,
                      color: const Color(
                        0x80212121,
                      ), // #212121 with 50% opacity
                    ),
                  ),
                ],
              ),
            ),
            WidthButton(
              active: true,
              title: 'Login',
              onTap: () {
                goto(Routes.SIGNIN);
              },
            ),
          ],
        ),
      ),
    );
  }
}
