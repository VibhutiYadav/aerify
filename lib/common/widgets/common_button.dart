import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../util/helpers/colors.dart';

class CommonButton extends StatelessWidget {
  String title;
  Function() onPressed;
  final width;
   CommonButton({super.key, required this.title, required this.onPressed, required this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=>onPressed(),
      color: AppColors.primaryColor,
      height: 60,
      minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        // language.lblBookNow,
        textScaleFactor: 1,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontFamily: 'Manrope-SemiBold',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}