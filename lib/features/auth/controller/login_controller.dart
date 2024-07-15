import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxString password = ''.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}