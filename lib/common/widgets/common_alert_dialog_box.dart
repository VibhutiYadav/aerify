import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/helpers/colors.dart'; // Assuming you have this file for color definitions

class ShowAlertBox extends StatelessWidget {
  final String title;
  final String content;
  final String acTitle;
  final String? acTitle2;
  final Function() onTap;
  final Function()? onTap2;

  const ShowAlertBox({
    Key? key,
    required this.title,
    required this.content,
    required this.acTitle,
    required this.onTap,
    this.acTitle2,
    this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title.tr,
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 18,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        content.tr,
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 14,
          color: AppColors.textColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            acTitle.tr,
            textScaleFactor: 1,
            style: TextStyle(
              fontFamily: 'Manrope-Regular',
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: onTap,
        ),
        if (acTitle2 != null && onTap2 != null)
          CupertinoDialogAction(
            child: Text(
              acTitle2!.tr,
              textScaleFactor: 1,
              style: TextStyle(
                fontFamily: 'Manrope-Regular',
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: onTap2,
          ),
      ],
    );
  }
}
