import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mft/app/modules/shared/widgets/heading.dart';
import 'package:mft/app/modules/shared/widgets/input_field.dart';
import 'package:mft/app/modules/shared/widgets/password_input_field.dart';
import 'package:mft/app/modules/shared/widgets/width_button.dart';
import 'package:sizer/sizer.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 13.h, 8.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(heading: 'Welcome Back!', body: 'Please login to continue.'),
            SizedBox(height: 2.5.h),
            CustomInputField(
              title: 'Email Address',
              controller: controller.emailEditiingController.value,
              hint: 'Enter your email',
            ),
            CustomPasswordInputField(
              title: 'Password',
              controller: controller.passwordEditiingController.value,
              hint: 'Enter your password',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1,
                      letterSpacing: 0,
                      color: Color(0xFF212121),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),

            Obx(() {
              return WidthButton(
                active: controller.isFormValid.value,
                title: 'Login',
                onTap: () {},
              );
            }),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.0,
                        letterSpacing: 0,
                        color: const Color(0x80212121),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color(0xff0D0A5C),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
