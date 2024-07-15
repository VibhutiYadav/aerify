import 'package:airline_app/features/onboarding/controller/walkthrough_controller.dart';
import 'package:get/get.dart';

class WalkthroughBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<WalkThroughController>(() => WalkThroughController());
  }
}