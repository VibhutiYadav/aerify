// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//
// class SignupController extends GetxController {
//   RxBool isPasswordVisible = false.obs;
//   RxString password = ''.obs;
//
//   void togglePasswordVisibility() {
//     print("pressed");
//     isPasswordVisible.toggle();
//
//     print("password visible ${isPasswordVisible.value}");
//     update();
//   }
//
//   final TextEditingController firstNameController = TextEditingController();
//   final TextEditingController lastNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   // final TextEditingController countryCodeController = TextEditingController(text: '+91'); // Set default to India
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController referralCodeController = TextEditingController();
//
//   var isChecked = false.obs;
//
//   ///Country Code
//   var initialNumber = PhoneNumber(isoCode: 'IN').obs; // Set default to India
//   var codeController = TextEditingController().obs; // Use .obs for reactive controller
//   var selectedCountryCode = '+91'.obs; // Set def
//   void updateCountryCode(String code) {
//     selectedCountryCode.value = code; // Update reactive variable
//     codeController.value.text = code; // Update the TextEditingController
//   }
//
//
//   @override
//   void onClose() {
//     firstNameController.dispose();
//     lastNameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     countryController.dispose();
//     // countryCodeController.dispose();
//     passwordController.dispose();
//     referralCodeController.dispose();
//     super.onClose();
//   }
//
//   void toggleCheckbox() {
//     isChecked.value = !isChecked.value;
//   }
//
//
// }
//

import 'dart:convert';

import 'package:airline_app/features/auth/model/signup_model.dart';
import 'package:airline_app/util/constants/constant.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {

  ///Password Visiblity
  RxBool isPasswordVisible = false.obs;
  RxString password = ''.obs;

  void togglePasswordVisibility() {
    print("pressed");
    isPasswordVisible.toggle();
    print("password visible ${isPasswordVisible.value}");
    update();
  }
  var isChecked = false.obs;
  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  ///Terms and Condition
  var isAccepted = false.obs ;

  ///All TextEditingControllr
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();
  final TextEditingController dialCodeController = TextEditingController();

  ///Country code picker
  var codeController =PhoneNumber(isoCode: "IN",phoneNumber: "0000000000").obs;
  void updateCountryCode(code) {
    codeController.value = code; // Update the TextEditingController
  }

 final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  ///Country Controller
  var selectedCountry = Country(
    phoneCode: '91',
    countryCode: 'IN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: '9845012345',
    displayName: 'India',
    fullExampleWithPlusSign: '+919845012345',
    displayNameNoCountryCode: 'India',
    e164Key: '',
  ).obs;
  var countryController = TextEditingController();

  void setSelectedCountry(Country country) {
    selectedCountry.value = country;
    countryController.text = country.name ?? '';
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    passwordController.dispose();
    referralCodeController.dispose();
    super.onClose();
  }

  Validation(){

  }

  ///API Calling

  var isLoading = false.obs;
  late SignupModel signupModel;

  Future<void> signup() async{
    try{

      isLoading.value = true;

      Map data = {
        'firstname' : firstNameController.text.trim(),
        'lastname' : lastNameController.text,
        'email' : emailController.text.trim(),
        'mobile_code' : dialCodeController.text.trim(),
        'mobile' : phoneController.text.trim().trim(),
        'country' : countryController.text.trim(),
        'password' : passwordController.text.trim(),
        'agree': "on",
      };

      final response = await http.post(
        Uri.parse(Constant.Signup),
        body: data,
      );

      print('Data ---> ${jsonEncode(data)}');
      print('Status Code ---> ${response.statusCode}');
      print('Status Code ---> ${response.body}');

      if(response.statusCode == 200){
        signupModel = SignupModel.fromJson(jsonDecode(response.body));
        Get.snackbar('Success', 'Register Successful...', snackPosition: SnackPosition.TOP);
        Get.offNamed('/login');
      }else{
        Get.snackbar('Please Check!!!', 'Please fill all the fields', snackPosition: SnackPosition.TOP);
      }
    }catch(error){
      print(error);
      Get.snackbar('Error', 'An error occurred. Please try again.', snackPosition: SnackPosition.TOP);
    }finally{
      isLoading.value = false;
    }
  }
}
