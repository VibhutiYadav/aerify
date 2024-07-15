import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPVerifiedScreen extends StatefulWidget {
  const OTPVerifiedScreen({super.key});

  @override
  State<OTPVerifiedScreen> createState() => _OTPVerifiedScreenState();
}

class _OTPVerifiedScreenState extends State<OTPVerifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
              language.msgSuccessMsg,
              textScaleFactor: 1,
              style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w400),
            ),
            Text(
              language.msgSuccessMsg2,
              textScaleFactor: 1,
              style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: AppColors.lblPrimaryColor, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 230,),
            MaterialButton(
              onPressed: () {
                Get.offNamed(AppRoutes.home);
              },
              color: Color(0xff1061FF),
              height: 60,
              minWidth: 350,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                language.msgSuccessMsg3,
                textScaleFactor: 1,
                textDirection: TextDirection.ltr,
                style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
