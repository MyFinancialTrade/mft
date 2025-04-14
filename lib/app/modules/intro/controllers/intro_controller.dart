import 'package:get/get.dart';

class IntroController extends GetxController {
  RxDouble activeIndex = 0.0.obs;

  void setActiveIndex(double index) => activeIndex.value = index;
  void toggleActiveIndex() => activeIndex.value = 1 ;
}
