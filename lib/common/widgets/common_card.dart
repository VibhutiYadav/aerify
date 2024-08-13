import 'package:airline_app/common/widgets/cached_network_image.dart';
import 'package:airline_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/helpers/colors.dart';
import '../../util/routes/routes.dart';

class CommonCard extends StatelessWidget {
  final imagePath;
  final offerText;

  const CommonCard(
      {super.key, required this.imagePath, required this.offerText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            cached_network_image(
              image: ' ',
              fit: BoxFit.fill,
              tempImage: imagePath,
            ),
            // Image.asset(
            //   imagePath,
            //   width: double.infinity,
            //   height: 120,
            //   fit: BoxFit.fill,
            // ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                color: AppColors.offerCardPrimaryColor,
                height: 22,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: Text(
                    offerText,
                    textScaleFactor: 1,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 68,
          width: Get.width / 1.03,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New York to Los Angeles",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontFamily: 'Manrope-Regular',
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Text(
                          "Luxury flights starting at",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontFamily: 'Manrope-Regular',
                              fontSize: 12,
                              color: AppColors.lblSecondaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "\$12,000",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontFamily: 'Manrope-Regular',
                              fontSize: 14,
                              color: AppColors.lblSecondaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.featuredDetail);
                  },
                  color: AppColors.primaryColor,
                  height: 40,
                  minWidth: 40,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    language.lblBookNow,
                    textScaleFactor: 1,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
