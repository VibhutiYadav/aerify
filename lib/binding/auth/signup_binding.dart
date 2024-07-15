import 'package:get/get.dart';
import '../../features/auth/controller/signup_controller.dart';


class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
