import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mft/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:mft/app/modules/forgot_password/views/create_password_view.dart';
import 'package:mft/app/modules/shared/widgets/arrow_back.dart';
import 'package:mft/app/modules/shared/widgets/bold_text.dart';
import 'package:mft/app/modules/shared/widgets/heading.dart';
import 'package:mft/app/modules/shared/widgets/light_text.dart';
import 'package:mft/app/modules/shared/widgets/otp_input_field.dart';
import 'package:mft/app/modules/shared/widgets/width_button.dart';
import 'package:mft/app/utils/commons.dart';
import 'package:sizer/sizer.dart';

class EnterOtpView extends GetView<ForgotPasswordController> {
  const EnterOtpView({super.key});
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
                Header(heading: 'Entre OTP', body: 'We have sent an OTP to'),
                BoldText(text: 'johndoe@example.com'),
                SizedBox(height: 8.h),
                OtpInputField(
                  onSubmit: (value) {
                    debugPrint(value);
                  },
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: [
                        LightText(text: "Didn’t received code? "),
                        InkWell(onTap: () {}, child: BoldText(text: 'Resend')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Obx(() {
                return WidthButton(
                  active: controller.isEmailFormValid.value,
                  title: 'verify',
                  onTap: () => gotoClass(CreatePasswordView()),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
