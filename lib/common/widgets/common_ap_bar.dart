import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../util/helpers/colors.dart';
class CommonAppBar extends StatelessWidget {
  bool isVisible;
  String title;
  bool isEnable;
  Function()? pressed;
  CommonAppBar({super.key,required this.isVisible, required this.title, required this.isEnable, this.pressed,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      toolbarHeight: 100,
      title: Text(
        title,
        textScaleFactor: 1,
        style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 18,
            color: AppColors.lblSecondaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
      centerTitle: true,
      leading: isVisible
        ?
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ) ,
            height: 30,
            width: 30,
            // Set the desired color here
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.primaryColor,
                size: 20,
              ),
            ),
          ),
        ),
      )
      :Container(),
      actions: isEnable
          ? [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {
              // Get.toNamed();
            },
            child: ClipOval(
              child: Container(
                height: 35,
                width: 35,
                color: AppColors.primaryColor, // Set the desired color here
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
      ]
          : [],
    );
  }
}
