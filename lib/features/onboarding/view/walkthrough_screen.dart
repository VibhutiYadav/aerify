import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/walkthrough_controller.dart';

class WalkThroughScreen extends StatelessWidget {
  final WalkThroughController controller = Get.find<WalkThroughController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: controller.pageController,
          itemCount: controller.pages.length,
          onPageChanged: controller.onPageChanged,
          itemBuilder: (context, index) {
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(controller.pages[index]['background image']!),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding:EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 120),
                      Text(
                        controller.pages[index]['title']!,
                        textScaleFactor: 1,
                        style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 32, color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        controller.pages[index]['description']!,
                          textScaleFactor: 1,
                        style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400)
                      ),
                    ],
                  ),
                ),
              ),
              floatingActionButton: MaterialButton(
                onPressed: () {
                  if (index == controller.pages.length - 1) {
                    controller.continueMethod(); // Change this to navigate to the next screen or perform any action
                  } else {
                    controller.pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                height: 56,
                minWidth: 350,
                child: Text(
                  language.lblNext.tr,
                    textScaleFactor: 1,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(fontFamily: 'Manrope-SemiBold', fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600)
                ),
              ),
            );
          },
        ),
        Positioned(
          left: 20,
          top: 70,
          child: Align(
            alignment: Alignment.topRight,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.pages.length,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                offset: 8,
                dotWidth: 10,
                dotHeight: 8,
                spacing: 8,
                expansionFactor: 2.5,
                radius: 16,
                dotColor: Colors.white,
                activeDotColor: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              iconSize: 100,
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                if (controller.pageController.page == controller.pages.length - 1) {
                  controller.continueMethod(); // Change this to navigate to the next screen or perform any action
                } else {
                  controller.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
