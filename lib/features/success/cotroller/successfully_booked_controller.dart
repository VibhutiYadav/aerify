import 'dart:async';
import 'package:airline_app/features/dashboard/home.dart';
import 'package:get/get.dart';
import 'package:airline_app/util/routes/routes.dart';

import '../../dashboard/controller/home_controller.dart';

class SuccessfullyBookedController extends GetxController {
  // Get.find<Home>
  HomeController homeController =Get.put(HomeController());
  @override
  void onInit() {
    super.onInit();
    print('Timer called');
    startTimer();
  }

  void startTimer() {
    Timer(Duration(milliseconds: 1000), () {
      // homeController.currentIndex.value=2;
      Get.offAll(HomeScreen(pageIndex:2));
    });
  }
}
