import 'dart:convert';

import 'package:airline_app/common/widgets/common_alert_dialog_box.dart';
import 'package:airline_app/common/widgets/common_card.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var subservice = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getLocation();
  }

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

  ///GeoLoacation
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  var address = ''.obs;

  Future<void> getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        ShowAlertBox(title: 'Location Permission', content: 'Please, ON the location permission', onTap: ()=>Geolocator.openLocationSettings(), acTitle: 'Okay');
        // await Geolocator.openLocationSettings();
        if(permission == LocationPermission.denied){
          Future.error('Location services are disabled');
          ShowAlertBox(title: 'Location Permission', content: 'Location services are disabled. Please, ON the location permission', onTap: ()=>Get.back(), acTitle: 'Okay',);
        }
      }
    }

    if(!serviceEnabled){
      ShowAlertBox(title: 'Location Permission', content: 'Location services are disabled. Please, ON the location permission', onTap: ()=>Geolocator.openLocationSettings(), acTitle: 'Okay',);
      return Future.error('Location services are disabled.');
    }

    if(permission == LocationPermission.deniedForever){
      ShowAlertBox(title: language.lblLocationPermission, content: 'Location permissions are permanently denied, we cannot go further.',onTap: ()=>Geolocator.openLocationSettings(), acTitle: 'Okay',);
      throw 'Location permissions are permanently denied, we cannot request permissions.';
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    print('Current Position Called');
    update();

    lat.value = position.latitude;
    long.value = position.longitude;
    print('Latitude => ${lat.value}');
    print('Longitude => ${long.value}');

    getAddress(lat.value, long.value);
  }

  Future<void> getAddress(double latitude, double longitude) async{
    print("lat $latitude");
    print("long $longitude");
    final response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=${Constant.Google_Map_key}',
    ));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      print('Data: ${response.body}');
      if(data['status'] == 'OK' && data['results'].length>0){
        var result = data['results'][0];
        var formattedAddress = result['formatted_address'];
        print('Formatted Address => $formattedAddress');
        address.value = formattedAddress;

      }else{
        print('No result Found');
      }
    }else{
      print('Error in fetching address');
    }
  }
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

