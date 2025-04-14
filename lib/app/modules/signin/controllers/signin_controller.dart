import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final Rx<TextEditingController> emailEditiingController =
      TextEditingController().obs;
  final Rx<TextEditingController> passwordEditiingController =
      TextEditingController().obs;

  var isFormValid = false.obs;
  @override
  void onInit() {
    super.onInit();
    emailEditiingController.value.addListener(_validateForm);
    passwordEditiingController.value.addListener(_validateForm);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _validateForm() {
    final email = emailEditiingController.value.text.trim();
    final password = passwordEditiingController.value.text;

    // final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    // isFormValid.value = emailRegex.hasMatch(email) && password.length >= 8;
    isFormValid.value = email != '' && password != '';
  }
}
