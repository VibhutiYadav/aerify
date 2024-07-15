import 'package:airline_app/features/notification/controller/notification_controller.dart';
import 'package:airline_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../../common/widgets/commonListContainer.dart';
import '../../../common/widgets/common_ap_bar.dart';
import '../../../util/helpers/colors.dart';


class Notificationscreen extends StatelessWidget {
  const Notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller=Get.find<NotificationController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size(60, 60),
          child: CommonAppBar(
            title: language.lblNotifications,
            isEnable: true,
            isVisible: true,
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Today",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 14,
                      color: AppColors.lblSecondaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommonListContainer(
                    title: controller.NotificationTextList[index].text,
                    content: controller.NotificationTextList[index].content,
                    image: controller.NotificationTextList[index].imagePath,
                  );
                },
                itemCount:controller.NotificationTextList.length,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Yesterday",
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 14,
                      color: AppColors.lblSecondaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommonListContainer(
                    title: controller.NotificationTextList[index].text,
                    content: controller.NotificationTextList[index].content,
                    image: controller.NotificationTextList[index].imagePath,
                  );
                },
                itemCount:controller.NotificationTextList.length,
              )
            ],
          ),
        ]),
      ),
    );
  }

}