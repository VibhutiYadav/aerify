
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/helpers/colors.dart';






class CommonListContainer extends StatelessWidget {
  String title;

  String content;

  String image;

  CommonListContainer({
    super.key,
    required this.title,
    required this.content,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: EdgeInsets.all(10), // Added padding for better spacing
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the top
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Image.asset(
                    image,
                    height:
                    40, // Ensure the image height matches the text height
                  ),
                ),
              ),
              SizedBox(width: 10), // Add space between the image and the column
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontWeight: FontWeight.w600,
                        color: AppColors.lblThirdColor,
                        fontSize: 16,
                      ), // Optionally style the text
                    ),
                    SizedBox(height: 5), // Add space between the two texts
                    Text(
                      content,
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w400,
                      ), // Optionally style the text
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

