import 'dart:async';
import 'package:airline_app/util/routes/routes.dart';
import 'package:get/get.dart';
import '../../onboarding/view/walkthrough_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(
      Duration(seconds: 3), () {
        Get.offNamed(AppRoutes.walkthrough);
      },
    );
  }
}
