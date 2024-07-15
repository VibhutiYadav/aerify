import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cotroller/successfully_booked_controller.dart';

class SuccessfullyBooked extends GetView<SuccessfullyBookedController> {
  const SuccessfullyBooked({super.key});

  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            Image.asset(verified, height: 200, width: 200,),
            SizedBox(height: 20,),
            Text(
              language.lblSuccess,
              textScaleFactor: 1,
              style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 25, color: AppColors.primaryColor, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10,),
            Text(
              language.msgFinalSuccessMsg,
              textScaleFactor: 1,
              style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w400),
            ),
            Text(
              language.msgFinalSuccessMsg2,
              textScaleFactor: 1,
              style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
