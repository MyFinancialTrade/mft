import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mft/app/modules/intro/controllers/intro_controller.dart';
import 'package:mft/app/utils/colors.dart';
import 'package:sizer/sizer.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Obx(() {
                return Image.asset(
                  'assets/images/${controller.activeIndex.value == 1 ? "phone" : "money"}.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              }),
            ),
            Positioned(
              top: 46.h,
              left: 0,
              right: 0,
              bottom: -1,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.w),
                    topRight: Radius.circular(5.w),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Obx(() {
                                return DotsIndicator(
                                  dotsCount: 2,
                                  position: controller.activeIndex.value,
                                  decorator: DotsDecorator(
                                    color: AppColors.inactive,
                                    activeColor: AppColors.secondary,
                                    size: Size.square(10.sp),
                                    activeSize: Size(24.sp, 10.sp),
                                    activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10.sp,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                              SizedBox(height: 3.5.h),
                              Obx(
                                () => Text(
                                  controller.activeIndex.value == 1
                                      ? "Traders"
                                      : "IT'S ALL ABOUT MONEY",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 20.5.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 1.0,
                                    letterSpacing: 0.0,
                                    color: Color(0xFF0D0A5C),
                                  ),
                                ),
                              ),
                              SizedBox(height: 3.5.h),
                              Obx(() {
                                return Text(
                                  controller.activeIndex.value == 1
                                      ? "Trade with our recommended broker and unlock Free Community Access on Deposit above 500 USD"
                                      : "This striking animation isn't just text; it's a reality check wrapped in sleek visuals, designed to make you pause and reflect.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.0,
                                    letterSpacing: 0.0,
                                    color: Color(0xFF0D0A5C),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.w,
                        vertical: 2.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Skip',
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                                height: 22 / 20,
                                letterSpacing: 0.0,
                                color: Color(0xFF212121),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => controller.toggleActiveIndex(),
                            child: Container(
                              width: 8.h,
                              height: 8.h,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 40.116,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
