import 'package:airline_app/common/widgets/common_button.dart';
import 'package:airline_app/common/widgets/common_textformfield.dart';
import 'package:airline_app/common/widgets/picker_widgets.dart';
import 'package:airline_app/features/auth/controller/signup_controller.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignupScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final SignupController controller = Get.find<SignupController>();
    final SignupController controller = Get.put(SignupController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  language.lblCreateAcc.tr,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontFamily: 'Manrope-Regular',
                    fontSize: 25,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  language.msgJoinAerify.tr,
                  textScaleFactor: 1,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: 'Manrope-Regular',
                    fontSize: 16,
                    color: AppColors.lblPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  language.msgJoinAerify2.tr,
                  textScaleFactor: 1,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: 'Manrope-Regular',
                    fontSize: 16,
                    color: AppColors.lblPrimaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonTextFormField(
                        isVisible: true,
                        controller: controller.firstNameController,
                        label: language.lblFirstName.tr,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        hintText: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CommonTextFormField(
                        isVisible: true,
                        controller: controller.lastNameController,
                        label: language.lblLastName.tr,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        hintText: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CommonTextFormField(
                        isVisible: true,
                        controller: controller.emailController,
                        label: language.lblEmail.tr,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        hintText: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 10),
                      CountryCodePicker(controller: controller, label: language.lblPhone,),
                      SizedBox(height: 10),
                      CountryPicker(controller: controller, label: language.lblCountry,),
                      SizedBox(height: 10),
                      Obx(() => CommonTextFormField(
                        isVisible: true,
                        controller: controller.passwordController,
                        label: language.lblPwd,
                        keyboardType: TextInputType.text,
                        obscureText: controller.isPasswordVisible.value,
                        suffixIcon: IconButton(
                          icon: Icon(controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () =>
                              controller.togglePasswordVisibility(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
                            return 'Password must have at least one uppercase letter';
                          }
                          if (!RegExp(r'(?=.*?[a-z])').hasMatch(value)) {
                            return 'Password must have at least one lowercase letter';
                          }
                          if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value)) {
                            return 'Password must have at least one special character';
                          }
                          return null;
                        },
                      )),
                      SizedBox(height: 10),
                      CommonTextFormField(
                        isVisible: true,
                        controller: controller.referralCodeController,
                        label: language.lblReferral.tr,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                      ),
                      SizedBox(height: 15),
                      Obx(() => Row(
                        children: [
                          Checkbox(
                              value: controller.isAccepted.value,
                              checkColor: Colors.white,
                              focusColor: AppColors.primaryColor,
                              onChanged: (bool? value) {
                                controller.isAccepted.value = value ?? false;
                              }),
                          Text(language.lblAgree,
                              style: TextStyle(
                                  fontFamily: 'Manrope-Regular',
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700)),
                          Text(language.lblTermsConditions,
                              style: TextStyle(
                                  fontFamily: 'Manrope-Regular',
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                CommonButton(
                  title: language.lblContinue,
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (!controller.isAccepted.value) {
                        Get.snackbar("Alert", "Please accept the terms and conditions.",  snackPosition: SnackPosition.TOP);
                      } else {
                        controller.signup();
                      }
                    }
                  },
                  width: Get.width,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      language.lblAlreadyAcc,
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 14,
                        color: AppColors.primaryColor.withOpacity(0.9),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.offNamed(AppRoutes.login);
                      },
                      child: Text(
                        language.lblLogin,
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontFamily: 'Manrope-Regular',
                          fontSize: 16,
                          color: AppColors.lblPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
