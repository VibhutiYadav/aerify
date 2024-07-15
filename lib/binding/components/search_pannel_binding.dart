import 'package:get/get.dart';
import '../../common/controller/search_pannel_contoller.dart';

class HomeBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<SearchPannelController>(() => SearchPannelController());
  }
}