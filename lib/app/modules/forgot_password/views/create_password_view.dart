import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mft/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:mft/app/modules/shared/arrow_back.dart';
import 'package:mft/app/modules/shared/widgets/heading.dart';
import 'package:mft/app/modules/shared/widgets/password_input_field.dart';
import 'package:mft/app/modules/shared/widgets/width_button.dart';
import 'package:sizer/sizer.dart';

class CreatePasswordView extends GetView<ForgotPasswordController> {
  const CreatePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  heading: 'Create new password',
                  body: 'Please enter a new password.',
                ),
                SizedBox(height: 8.h),
                CustomPasswordInputField(
                  title: 'Password',
                  controller: TextEditingController(),
                  hint: 'Enter your password',
                ),
                CustomPasswordInputField(
                  title: 'Confirm Password',
                  controller: TextEditingController(),
                  hint: 'Confirm your password',
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Obx(() {
                return WidthButton(
                  active: controller.isPasswordFormValid.value,
                  title: 'Reset',
                  onTap: () {},
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
