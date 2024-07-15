import 'package:airline_app/features/success/cotroller/successfully_booked_controller.dart';
import 'package:get/get.dart';

class SuccessfullyBookedBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SuccessfullyBookedController>(() => SuccessfullyBookedController());
  }
}