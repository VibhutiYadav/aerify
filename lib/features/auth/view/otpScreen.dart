import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 90, left: 15),
                      child: Text(
                        language.msgAlmostThere,
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontFamily: 'Manrope-Regular',
                            fontSize: 25,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        language.msgAlmostThere2,
                        textScaleFactor: 1,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontFamily: 'Manrope-Regular',
                            fontSize: 16,
                            color: AppColors.lblPrimaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 2),
                      child: Text(
                        language.msgAlmostThere3,
                        textScaleFactor: 1,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontFamily: 'Manrope-Regular',
                            fontSize: 16,
                            color: AppColors.lblPrimaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110, right: 50),
                      child: Row(
                        children: [
                          Text(
                            language.msgAlmostThere4,
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontFamily: 'Manrope-Regular',
                                fontSize: 16,
                                color: AppColors.lblPrimaryColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            language.msgAlmostThere5,
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontFamily: 'Manrope-Regular',
                                fontSize: 16,
                                color: AppColors.lblPrimaryColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        left: 10,
                      ),
                      child: _buildOtpDialogWidget(),
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: MaterialButton(
                        onPressed: () {
                          Get.offNamed(AppRoutes.otpverified);
                        },
                        color: Color(0xff1061FF),
                        height: 60,
                        minWidth: 350,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          language.lblContinue,
                          textScaleFactor: 1,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ]
              ),
            )
        )
    );
  }

  Widget _buildOtpDialogWidget() {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 14,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500),
      decoration: BoxDecoration(
        color: AppColors.deButtonColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: AppColors.deButtonColor,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: 6,
      validator: (s) {
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
