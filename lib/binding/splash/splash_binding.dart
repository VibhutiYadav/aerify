import 'package:get/get.dart';
import '../../features/spalsh/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize SplashController
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
