import 'package:airline_app/common/widgets/common_textformfield.dart';
import 'package:airline_app/features/auth/controller/signup_controller.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.find<SignupController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                language.lblCreateAcc.tr,
                  textScaleFactor: 1,
                style:TextStyle(fontFamily: 'Manrope-Regular', fontSize: 25, color: AppColors.primaryColor, fontWeight: FontWeight.w700)
              ),
              Text(
                language.msgJoinAerify.tr,
                  textScaleFactor: 1,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w400)
              ),
              Text(
                  language.msgJoinAerify2.tr,
                  textScaleFactor: 1,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w400)
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
                      controller: controller.fullNameController,
                      label: language.lblFullName.tr, 
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: '',
                    ),
                    SizedBox(height: 10),
                   CommonTextFormField(
                     isVisible: true,
                      controller: controller.emailController,
                      label: language.lblEmail.tr,
                      keyboardType: TextInputType.emailAddress,
                     obscureText: false,
                     hintText:'',
                    ),
                    SizedBox(height: 10),
                    CommonTextFormField(
                      isVisible: true,
                      controller: controller.phoneController,
                      label: language.lblPhone.tr,
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                    ),
                    SizedBox(height: 10),
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
                    )),
                    // CommonTextFormField(
                    //   isVisible: true,
                    //   controller: controller.passwordController,
                    //   label: 'Password'.tr,
                    //   obscureText: true,
                    //   keyboardType: TextInputType.text,
                    //   suffixIcon: IconButton(
                    //     icon: Icon(controller.isPasswordVisible.value
                    //         ? Icons.visibility
                    //         : Icons.visibility_off),
                    //     onPressed: () => controller.togglePasswordVisibility(),
                    //   ),
                    // ),
                    SizedBox(height: 10),
                    CommonTextFormField(
                      isVisible: true,
                      controller: controller.referralCodeController,
                      label: language.lblReferral.tr,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                onPressed: (){
                  Get.offNamed(AppRoutes.otp);
                },
                color: AppColors.primaryColor,
                height: 60,
                minWidth: 365,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  language.lblContinue,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    language.lblAlreadyAcc,
                      textScaleFactor: 1,
                    style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 14, color: AppColors.primaryColor.withOpacity(0.9), fontWeight: FontWeight.w400)
                  ),
                  InkWell(
                    onTap: () {
                      Get.offNamed(AppRoutes.login);
                    },
                    child: Text(
                      language.lblLogin,
                        textScaleFactor: 1,
                      style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w500)
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


