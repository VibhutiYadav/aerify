import 'package:get/get.dart';

import '../../features/notification/controller/notification_controller.dart';

class NotificationBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<NotificationController>(()=>NotificationController());
  }
}