import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WalkThroughController extends GetxController {
  var currentPage = 0.obs;
  PageController pageController = PageController();

  List<Map<String, String>> pages = [
    {
      "background image": 'assets/images/onboarding1.png',
      "title": 'Welcome to \nAerify Charter \nServices',
      "description": 'Experience the ultimate in \nPrivate Aviation',
      'buttonName': 'Next'
    },
    {
      "background image": 'assets/images/onboarding2.png',
      "title": 'Search and \nBook Flights',
      "description": 'Search for available flights \nselect your preferred aircraft \nand book your journey with ease',
      'buttonName': 'Next'
    },
    {
      "background image": 'assets/images/onboarding3.png',
      "title": 'Customize \nYour Journey',
      "description": 'Tailor your travel experience by \nchoosing your departure date, time, \nand passenger preferences',
      'buttonName': 'Next'
    },
  ];

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void continueMethod() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Get.offNamed(AppRoutes.login); // Navigate to login screen when onboarding is complete
    }
  }
}
