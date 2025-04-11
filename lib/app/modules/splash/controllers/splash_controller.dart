import 'package:get/get.dart';
import 'dart:async';

import 'package:sizer/sizer.dart';

class SplashController extends GetxController {
  var scale = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    _animateLogo();
  }

  void _animateLogo() async {
    await Future.delayed(Duration(milliseconds: 800));
    scale.value = 0.8.px;

    await Future.delayed(Duration(milliseconds: 800));
    scale.value = 1.6.px;

    await Future.delayed(Duration(milliseconds: 800));
    scale.value = 2.4.px;

    await Future.delayed(Duration(milliseconds: 1200));
    Get.offAllNamed('/intro'); 
  }
}
