import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final Rx<TextEditingController> emailEditiingController =
      TextEditingController().obs;
  final Rx<TextEditingController> passwordEditiingController =
      TextEditingController().obs;
  final Rx<TextEditingController> conformPasswordEditiingController =
      TextEditingController().obs;

  var isEmailFormValid = false.obs;
  RxBool isPasswordFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailEditiingController.value.addListener(_validateEmailForm);
    passwordEditiingController.value.addListener(_validatePasswordlForm);
    conformPasswordEditiingController.value.addListener(_validatePasswordlForm);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _validateEmailForm() {
    final email = emailEditiingController.value.text.trim();

    // final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    // isFormValid.value = emailRegex.hasMatch(email);
    isEmailFormValid.value = email != '';
  }

  void _validatePasswordlForm() {
    isPasswordFormValid.value =
        passwordEditiingController.value.text != '' &&
        conformPasswordEditiingController.value.text != '' &&
        passwordEditiingController.value.text ==
            conformPasswordEditiingController.value.text;
  }
}
