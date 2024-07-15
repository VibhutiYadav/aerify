import 'package:airline_app/util/helpers/images.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var unreadCount = 0.obs;
  void updateUnreadCount(int count) {
    unreadCount.value = count;
  }
  List NotificationTextList = [
    NotificationText(
        text: "Payment Successful",
        content:
            "Lorem ipsum dolor sit amet consectetur. Ultrices tincidunt eleifend vitae.",
        imagePath: ic_wallet),
    NotificationText(
        text: "Credit Card added!",
        content:
            "Lorem ipsum dolor sit amet consectetur. Ultrices tincidunt eleifend vitae.",
        imagePath: ic_card),
    NotificationText(
        text: "5% Special Discount!",
        content:
            "Lorem ipsum dolor sit amet consectetur. Ultrices tincidunt eleifend vitae.",
        imagePath: ic_discount)
  ];
}

class NotificationText {
  String text;
  String imagePath;
  String content;

  NotificationText(
      {required this.text, required this.imagePath, required this.content});
}
