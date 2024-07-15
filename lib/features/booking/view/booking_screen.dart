import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/common_ap_bar.dart';


class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child:  CommonAppBar(
          title:language.lblBooking,
          isVisible: false,
          isEnable: true,
        ),
      ),
      body: Column(
        children: [
          Container(

          ),
        ],
      ),
    );
  }
}
