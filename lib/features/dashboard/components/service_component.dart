import 'package:airline_app/common/widgets/cached_network_image.dart';
import 'package:airline_app/common/widgets/common_card.dart';
import 'package:airline_app/features/dashboard/controller/home_controller.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../../../util/helpers/colors.dart';
class ServiceComponent extends StatelessWidget {
  final HomeController controller;

  const ServiceComponent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
             language.lblExOffer,
              textScaleFactor: 1,
           style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 18, color: AppColors.lblSecondaryColor, fontWeight: FontWeight.w600),
         ),
         SizedBox(height: 15),
         Container( width:context.width*2,
             child: _serviceContainer(context)
         ),
       ],
    );
  }

  Widget _serviceContainer(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      childAspectRatio: 0.5,
      // mainAxisSpacing: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        controller.services.length,
            (index) => InkWell(
          onTap: () {
            print("index----$index");
            controller.subservice.value = index;

          },
          child: Container(

            height: 400,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child:Column(
              children: [
                Stack(
                  children: [
                    cached_network_image(image: null,tempImage: controller.services[index].image, fit:BoxFit.cover, ),
                    // Image.asset(
                    //   controller.services[index].image,
                    //   width: double.infinity,
                    //   // height: 200,
                    //   fit: BoxFit.cover,
                    // ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        color: AppColors.offerCardSecondaryColor,
                        height: 22,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            controller.services[index].offerText,
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
                  height: Get.height/6,
                  width: Get.width/1.03,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            controller.services[index].title,
                            textScaleFactor: 1,
                            maxLines: 1,
                            style: TextStyle(fontFamily: 'Manrope-Regular',fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),

                          ),
                        ),
                        Text(
                          controller.services[index].subtitle,
                          textScaleFactor: 1,
                          style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 12, color: AppColors.lblSecondaryColor, fontWeight: FontWeight.w500),

                        ),
                        Text(
                          controller.services[index].subtitle2,
                          textScaleFactor: 1,
                          style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 14, color: AppColors.lblSecondaryColor, fontWeight: FontWeight.w500),

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
            ),
          ),
        ),
      ),
    );
  }


}
