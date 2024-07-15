import 'package:get/get.dart';

class DetailController extends GetxController{

  final List<FD> details = [
    FD(
      title: 'Flight Duration',
      subtitle: 'Approximately 6 hours',
    ),
   FD(
      title: 'Aircraft',
      subtitle: 'Gulfstream G650',
    ),
    FD(
      title: 'Amenities',
      subtitle: 'WiFi, In-Flight Entertainment',
    ),
  ];
}

class FD{
  final String title;
  final String subtitle;

  FD({
    required this.title,
    required this.subtitle,
  });
}