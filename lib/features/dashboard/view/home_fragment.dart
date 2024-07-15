import 'package:airline_app/features/dashboard/components/my_app_bar.dart';
import 'package:airline_app/features/dashboard/controller/home_controller.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:airline_app/util/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/widgets/search_pannel.dart';
import '../../../main.dart';
import '../components/carousel_bar.dart';
import '../components/service_component.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: MyAppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
                children: [
              SearchPannel(
                hintText: 'Where do you want to fly today?',
                icon: Icons.search_outlined,
              ),
              SizedBox(height: 15,),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language.lblExOffer,
                          textScaleFactor: 1,
                          style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 18, color: AppColors.lblSecondaryColor, fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(AppRoutes.featured);
                          },
                          child: Text(
                            language.lblViewAll,
                            textScaleFactor: 1,
                            style: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 12, color: AppColors.iconColor.withOpacity(0.9), fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                    // SizedBox.shrink(),
                    Container(
                      decoration: BoxDecoration(
                          color:AppColors.backgroundColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),

                        )
                      ),

                      // color: Colors.red,
                        width: context.width,
                        height:230,
                        child: CarouselBar())
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                // color: Colors.red,
                width:context.width ,
                height: context.height/2.2,
                child: ServiceComponent(controller: controller,),
              ),
            ]),
          ),
        ));
  }
}
