import 'package:get/get.dart';

import '../../features/booking/controller/confirm_booking_controller.dart';

class ConfirmBookingBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<ConfirmBookingController>(() => ConfirmBookingController());
  }
}