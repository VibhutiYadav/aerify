import 'package:airline_app/util/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../util/helpers/images.dart';
import '../controller/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(appLogo, height: 200, width: 200),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
