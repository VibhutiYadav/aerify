import 'package:airline_app/common/widgets/common_ap_bar.dart';
import 'package:airline_app/common/widgets/search_pannel.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CommonAppBar(
          title: language.lblSearch,
          isVisible: false,
          isEnable: true,
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchPannel(
                  hintText: 'Shop',
                icon: Icons.location_on_outlined,
                ),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Results for ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff5A5A5A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '“Shop”',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff1061FF),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '7 found ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff1061FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.watch_later_outlined, color: Color(0xff5A5A5A),),
                              SizedBox(width: 7,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Burger ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff5A5A5A),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        'Shop',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff5A5A5A),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '2972 Westheimer Rd. Santa\nAna, Illinois 85486  ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xffB8B8B8),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          Text(
                            '2.7 km ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff1061FF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );

                  }),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
