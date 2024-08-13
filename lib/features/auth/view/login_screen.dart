import 'package:airline_app/common/widgets/common_textformfield.dart';
import 'package:airline_app/features/auth/controller/login_controller.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/helpers/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(language.lblLoginAcc,
                    textScaleFactor: 1,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 25,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700)),
              ),
              Center(
                child: Text(language.lblWelcome,
                    textScaleFactor: 1,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 16,
                        color: AppColors.lblPrimaryColor,
                        fontWeight: FontWeight.w400)),
              ),
              Center(
                child: Text(language.msgPleasEnter,
                    textScaleFactor: 1,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 16,
                        color: AppColors.lblPrimaryColor,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 60,
              ),
              CommonTextFormField(
                  isVisible: true,
                  controller: controller.phoneController,
                  label: language.lblPhone,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  hintText: '9516356XXX',
              ),
              SizedBox(
                height: 15,
              ),
              Obx(()=>CommonTextFormField(
                  isVisible: true,
                  controller: controller.passwordController,
                  label: language.lblPwd,
                  keyboardType: TextInputType.text,
                  obscureText: controller.isPasswordVisible.value,
                  suffixIcon: IconButton(
                  icon: Icon(controller.isPasswordVisible.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () => controller.togglePasswordVisibility(),
                ),

              ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(language.lblForgetPwd,
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 40,
              ),
              MaterialButton(
                onPressed: () {
                  controller.logIn();
                },
                color: AppColors.primaryColor,
                height: 60,
                minWidth: 440,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                    language.lblContinue.tr,
                    textScaleFactor: 1,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      language.msgNewToAerify,
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontFamily: 'Manrope-Regular',
                          fontSize: 14,
                          color: AppColors.primaryColor.withOpacity(0.9),
                          fontWeight: FontWeight.w500
                      )
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.signup);
                    },
                    child: Text(
                        language.lblSignup,
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontFamily: 'Manrope-Regular',
                            fontSize: 16,
                            color: AppColors.lblPrimaryColor,
                            fontWeight: FontWeight.w500
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
