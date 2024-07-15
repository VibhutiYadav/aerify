// lib/controllers/search_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPannelController extends GetxController{
  final TextEditingController controller = TextEditingController();

  void dispose() {
    controller.dispose();
  }

  void clear() {
    controller.clear();
  }
}
