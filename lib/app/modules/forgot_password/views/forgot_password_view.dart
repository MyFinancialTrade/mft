import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mft/app/modules/forgot_password/views/enter_otp_view.dart';
import 'package:mft/app/modules/shared/widgets/arrow_back.dart';
import 'package:mft/app/modules/shared/widgets/heading.dart';
import 'package:mft/app/modules/shared/widgets/input_field.dart';
import 'package:mft/app/modules/shared/widgets/width_button.dart';
import 'package:mft/app/utils/commons.dart';
import 'package:sizer/sizer.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(7.w, 2.h, 7.w, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrowBack(),
                SizedBox(height: 6.h),
                Header(
                  heading: 'Forgot password?',
                  body:
                      'Please enter the email address linked with your account',
                ),
                SizedBox(height: 2.5.h),
                CustomInputField(
                  title: 'Email Address',
                  controller: controller.emailEditiingController.value,
                  hint: 'yourname@website.com',
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Obx(() {
                return WidthButton(
                  active: controller.isEmailFormValid.value,
                  title: 'Send Code',
                  onTap: () => gotoClass(EnterOtpView()),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
