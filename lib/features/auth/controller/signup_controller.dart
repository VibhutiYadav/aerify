import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  RxBool isPasswordVisible = false.obs;
  RxString password = ''.obs;

  void togglePasswordVisibility() {
    print("pressed");
    isPasswordVisible.toggle();

    print("password visible ${isPasswordVisible.value}");
    update();
  }

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  var isChecked = false.obs;

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    referralCodeController.dispose();
    super.onClose();
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

}
