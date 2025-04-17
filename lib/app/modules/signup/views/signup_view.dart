import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mft/app/modules/Shared/widgets/width_button.dart';
import 'package:mft/app/modules/shared/widgets/heading.dart';
import 'package:mft/app/modules/shared/widgets/input_field.dart';
import 'package:mft/app/modules/shared/widgets/password_input_field.dart';
import 'package:mft/app/modules/shared/widgets/phone_input_field.dart';
import 'package:mft/app/modules/shared/widgets/terms_and_conditions.dart';
import 'package:mft/app/routes/app_pages.dart';
import 'package:mft/app/utils/commons.dart';
import 'package:sizer/sizer.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(8.w, 10.h, 8.w, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                heading: 'Register now and elevate your experience',
                body:
                    'Sign up today to unlock exclusive features and take your experience to the next level with enhanced tools and personalized options',
                textAlign: TextAlign.center,
                headingFontSize: 13.3.sp,
                bodyFontSize: 13.3.sp,
              ),
              SizedBox(height: 2.5.h),
              CustomInputField(
                title: 'First Name',
                controller: TextEditingController(),
                hint: 'Name',
              ),
              CustomInputField(
                title: 'Last Name',
                controller: TextEditingController(),
                hint: 'Last Name',
              ),
              CustomInputField(
                title: 'Email Address',
                controller: TextEditingController(),
                hint: 'Enter your email',
              ),

              CustomPasswordInputField(
                title: 'Password',
                controller: TextEditingController(),
                hint: 'Enter your password',
              ),
              CustomPasswordInputField(
                title: 'Confirm Password',
                controller: TextEditingController(),
                hint: 'Confirm your Password',
              ),
              CustomPhoneInputField(
                title: 'Phone Number',
                hint: ' 000 000 0000',
                controller: TextEditingController(),
              ),
              CustomPhoneInputField(
                title: 'WhatsApp Number',
                hint: ' 000 000 0000',
                controller: TextEditingController(),
              ),
       
              TermsAgreement(),
              SizedBox(height: 2.h),

              WidthButton(active: true, title: 'Signup', onTap: () {}),

              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.0,
                          letterSpacing: 0,
                          color: const Color(0x80212121),
                        ),
                      ),
                      InkWell(
                        onTap: () => goto(Routes.SIGNIN),
                        child: Text(
                          "Sign In",
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
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
