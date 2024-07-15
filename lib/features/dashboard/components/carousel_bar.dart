import 'package:airline_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../util/helpers/colors.dart';
import '../controller/home_controller.dart';

class CarouselBar extends StatefulWidget {
  @override
  State<CarouselBar> createState() => _CarouselBarState();
}

class _CarouselBarState extends State<CarouselBar> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: controller.carouselItems.map((item) {
        // Return the widget created by the controller
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
                child: item);
          },
        );
      }).toList(),
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          controller.onPageChanged(index);
        },
      ),
    );
  }
}

