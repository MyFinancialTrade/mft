import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mft/app/utils/colors.dart';
import 'package:sizer/sizer.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Obx(() => AnimatedScale(
              scale: controller.scale.value,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Image.asset(
                'assets/icons/logo.png',
                width: 30.w,
                height: 30.w,
              ),
            )),
      ),
    );
  }
}
