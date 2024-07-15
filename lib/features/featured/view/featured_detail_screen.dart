import 'package:airline_app/common/widgets/cached_network_image.dart';
import 'package:airline_app/common/widgets/common_ap_bar.dart';
import 'package:airline_app/common/widgets/common_button.dart';
import 'package:airline_app/features/booking/view/booking_screen.dart';
import 'package:airline_app/features/featured/controller/detail_controller.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class FeaturedDetailScreen extends GetView<DetailController> {
  const FeaturedDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final DetailController controller = Get.find<DetailController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonAppBar(title: language.lblFeaturedCharters, isEnable: false, isVisible: true,),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopContainer(context),
                  SizedBox(height: 10,),
                  _buildMidContainer(context),
                  SizedBox(height: 10),
                  _buildBottomContainer(context, controller),
                  SizedBox(height: 80,),
                  CommonButton(
                      title: language.lblBookNow,
                      width: Get.width,
                      onPressed: ()=> Get.toNamed('/confirmBooking'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTopContainer(BuildContext context){
  return Column(
    children: [
      cached_network_image(
        image: '',
        fit: BoxFit.fill,
        tempImage: img_detail1,
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 25,
            width: 50,
            decoration: BoxDecoration(
                color: AppColors.offerCardSecondaryColor,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.star,
                  size: 13,
                  color: Colors.white,
                ),
                Text(
                  '4.9',
                  textScaleFactor: 1,
                  style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 13, color: Colors.white),
                ),

              ],
            ),
          ),
          Container(
            height: 25,
            width: 100,
            decoration: BoxDecoration(
                color: Color(0xff218E0F),
                borderRadius: BorderRadius.circular(4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.thumb_up,
                  size: 13,
                  color: Colors.white,
                ),
                Text(
                  '420+ Review',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    ],
  );
}

Widget _buildMidContainer(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'New York to Los Angeles',
        style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 20, color: AppColors.primaryHeadingColor, fontWeight: FontWeight.w700),
      ),
      Row(
        children: [
          Text(
            '\$12000',
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff1061FF),
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '/Day',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff606D7F),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child:  ReadMoreText(
            'Experience the ultimate in comfort and convenience with Aerify Charter Service. Our luxury charters offer a seamless journey from the bustling city to your desired destination, ensuring you travel in style and relaxation.',
            trimMode: TrimMode.Line,
            trimLines: 3,
            colorClickableText: Colors.red,
            trimCollapsedText: 'Read more',
            trimExpandedText: 'Read less',
            style: TextStyle(
              fontFamily: 'Manrope-Regular',
              fontSize: 14,
              color: AppColors.lightTextColor,
              fontWeight: FontWeight.w400,
            ),
            moreStyle: TextStyle(
              fontFamily: 'Manrope-Regular',
              fontSize: 14,
              color: AppColors.primaryHeadingColor,
              fontWeight: FontWeight.w600,
            ),
            lessStyle: TextStyle(
              fontFamily: 'Manrope-Regular',
              fontSize: 14,
              color: AppColors.primaryHeadingColor,
              fontWeight: FontWeight.w600,
            ),
          ),

        ),
      ),
    ],
  );
}

Widget _buildBottomContainer(BuildContext context, controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        language.msgFlightDetails,
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 18,
          color: Color(0xff000000),
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 20,),
      StaggeredGrid.count(
        crossAxisCount: 2, // Number of columns in the grid
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        children: List.generate(controller.details.length, (index) {
          final detail = controller.details[index];
          return  Container(
            height: 68,
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.details[index].title,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 13,
                      color: AppColors.lightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    controller.details[index].subtitle,
                    textScaleFactor: 1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 13,
                      color: AppColors.primaryHeadingColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.primaryBorderColor,
                width: 1,
              ),
            ),
          );
        }),
      ),
    ],
  );
}
