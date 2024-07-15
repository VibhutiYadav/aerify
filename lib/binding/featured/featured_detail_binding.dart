import 'package:airline_app/features/featured/controller/detail_controller.dart';
import 'package:get/get.dart';

class FeaturedDetailBinding extends Bindings{
  void dependencies(){
    Get.lazyPut<DetailController>(()=>DetailController());
  }
}