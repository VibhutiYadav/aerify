import 'package:get/get.dart';
import '../../features/dashboard/controller/home_controller.dart';

class HomeBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<HomeController>(() => HomeController());
  }
}