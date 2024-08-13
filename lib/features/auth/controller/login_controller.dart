import 'dart:convert';
import 'package:airline_app/features/auth/model/login_model.dart';
import 'package:http/http.dart' as http;

import 'package:airline_app/util/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///Password visible/invisible code
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


  ///API
  var isLoading = false.obs;
  late LoginModel loginModel;
  Future <void> logIn() async{
    try{

      isLoading.value = true;

      Map data = {
        'mobile' : phoneController.text.trim(),
        'password' : passwordController.text.trim(),
      };

      final response = await http.post(
          Uri.parse(Constant.Login),
          body : data
      );
      print('Data ---> ${jsonEncode(data)}');
      print('Status Code ---> ${response.statusCode}');
      print('Status Code ---> ${response.body}');
      if(response.statusCode==200){
        loginModel = LoginModel.fromJson(jsonDecode(response.body));
        Get.snackbar('Success', 'Login Successful...', snackPosition: SnackPosition.TOP);
        Get.offNamed('/home');
      }else{
        Get.snackbar('Please Check!!!', 'Invalid phone number/password', snackPosition: SnackPosition.TOP);
      }
    }catch(error){
      print(error);
      Get.snackbar('Error', 'An error occurred. Please try again.', snackPosition: SnackPosition.TOP);
    }finally{
      isLoading.value = false;
    }
  }
}