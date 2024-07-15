import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/helpers/colors.dart';
import '../../../util/routes/routes.dart';
import '../controller/home_controller.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundColor,
        leading:Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: InkWell(
            onTap: () {

            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 30,
                width: 30,
                color: Colors.white, // Set the desired color here
                child: Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        title: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                language.lblChangeLocation,
                style: TextStyle(
                  fontFamily: 'Manrope-Regular',
                  fontSize: 12,
                  color: AppColors.lblSecondaryColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "Indore, India",
                style: TextStyle(
                  fontFamily: 'Manrope-Regular',
                  fontSize: 16,
                  color: AppColors.lblSecondaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.notification);
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
        ],
      ),
    );
  }
}


