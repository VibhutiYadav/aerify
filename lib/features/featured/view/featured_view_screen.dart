import 'package:airline_app/common/widgets/common_ap_bar.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/common_card.dart';
import '../../../util/helpers/colors.dart';

class FeaturedScreen extends StatelessWidget {
  const FeaturedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CommonAppBar(
              title: language.lblFeaturedCharters,
              isEnable: false,
              isVisible: true,
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              height: Get.height,
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CommonCard(
                        imagePath: img_home1,
                        offerText: 'Top-Destination',
                      ),
                    );
                  },
                  itemCount: 3
              )
          ),
        )
    );
  }
}
