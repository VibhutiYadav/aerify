import 'package:airline_app/common/widgets/common_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:airline_app/util/helpers/images.dart';


class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var subservice = 0.obs;

  // Carousel Control
  final List<Widget> carouselItems = [
    CommonCard( imagePath:img_home1, offerText: 'Top Destinations',),
    CommonCard( imagePath:img_home1, offerText: 'Special Offer',),
    CommonCard( imagePath:img_home1, offerText: 'Latest Deals',),
  ];


  var carouselIndex = 0.obs;

  void onPageChanged(int index) {
    carouselIndex.value = index;
  }

  final List<SubService> services = [
    SubService(
      title: 'Miami to Bahamas',
      offerText: 'Last-Minute Deals',
      subtitle: 'Save 10% on your',
      subtitle2: 'next charter',
      image: img_home2,
    ),
    SubService(
      title: 'Spain to Hawaii',
      offerText: 'Last-Minute Deals',
      subtitle: 'Special rates',
      subtitle2: 'available now',
      image: img_home3,
    ),
  ];
}

class SubService {
  final String title;
  final String offerText;
  final String subtitle;
  final String subtitle2;
  final String image;

  SubService({
    required this.title,
    required this.offerText,
    required this.subtitle,
    required this.subtitle2,
    required this.image,
  });
}

