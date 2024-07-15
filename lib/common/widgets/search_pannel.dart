import 'package:airline_app/common/controller/search_pannel_contoller.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPannel extends StatelessWidget {
  final hintText;
  IconData icon;
   SearchPannel({Key? key, required this.hintText,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchPannelController searchController = Get.put(SearchPannelController());
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8),
                child: Icon(
                  icon,
                  color: AppColors.iconColor,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: searchController.controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(fontFamily: 'Manrope-Regular', fontSize: 14, color: AppColors.iconColor, fontWeight: FontWeight.w500),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  autofocus: false,
                  onChanged: (value) {
                    print('Search query: $value');
                  },
                  onSubmitted: (value) {
                    print('Search submitted: $value');
                  },
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.clear),
              //   onPressed: () {
              //     searchController.clear();
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
