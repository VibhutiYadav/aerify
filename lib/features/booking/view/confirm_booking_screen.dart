import 'package:airline_app/common/widgets/common_ap_bar.dart';
import 'package:airline_app/common/widgets/common_button.dart';
import 'package:airline_app/common/widgets/common_textformfield.dart';
import 'package:airline_app/features/booking/controller/confirm_booking_controller.dart';
import 'package:airline_app/main.dart';
import 'package:airline_app/util/helpers/images.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../util/helpers/colors.dart';

class ConfirmBookingScreen extends GetView<ConfirmBookingController> {
  const ConfirmBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: CommonAppBar(title: language.lblConfirmBooking, isEnable: false, isVisible: true, ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _flightSummary(context, controller),
                  SizedBox(height: 10),
                  Divider(
                    height: 15,
                    color: AppColors.primaryBorderColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  _selectedAircraftSummary(context, controller),
                  SizedBox(height: 15),
                  Divider(
                    height: 15,
                    color: AppColors.primaryBorderColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  _detailSummary(context, controller),
                  SizedBox(height: 10),
                  Divider(
                    height: 15,
                    color: AppColors.primaryBorderColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  _paymentSummary(context, controller),
                  SizedBox(height: 10),
                  Divider(
                    height: 15,
                    color: AppColors.primaryBorderColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  SizedBox(height: 10),
                  _paymentMethodSummary(context, controller),
                  SizedBox(height: 10),
                  Divider(
                    height: 15,
                    color: AppColors.primaryBorderColor.withOpacity(0.5),
                    thickness: 1,
                  ),
                  _addressSummary(context, controller),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CommonButton(
          title: language.lblBookNow,
          onPressed: () {
            Get.offNamed('/successfullyBooked');
          },
          width: null,
                ),
        ),
    );
  }
}

Widget _flightSummary(BuildContext context, ConfirmBookingController controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        language.lblFlightSummary,
        textScaleFactor: 1,
        style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 18,
            color: AppColors.lblSecondaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10,),
      Text(
        '${language.msgFlightDetails}:',
        textScaleFactor: 1,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.lblSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10,),
      Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 24,
                color: AppColors.primaryColor,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DottedLine(
                  direction: Axis.vertical,
                  dashLength: 2,
                  dashGapLength: 2,
                  lineThickness: 2,
                  dashRadius: 16,
                  lineLength: 50,
                  dashColor: AppColors.primaryColor,
                ),
              ),
              Icon(
                Icons.location_on,
                size: 24,
                color: AppColors.lblSecondaryColor,
              ),

            ],
          ),
          SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${language.msgFrom}:',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 16,
                        color: AppColors.textSecondaryColor,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'New York (JFK)',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 12,
                        color: AppColors.iconColor,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${language.msgTo}:',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 16,
                        color: AppColors.textSecondaryColor,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    'Los Angeles (LAX)',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontFamily: 'Manrope-Regular',
                        fontSize: 12,
                        color: AppColors.iconColor,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      SizedBox(height: 10,),
      Text(
        '${language.msgDeparture}:',
        textScaleFactor: 1,
        style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 14,
            color: AppColors.lblSecondaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // height: 50,
            width: 150,
            child:   InkWell(
              onTap: ()=>controller.selectDate(context),
              child: CommonTextFormField(
                isVisible: false,
                enable:false,
                controller: controller.dateController,
                keyboardType: TextInputType.none,
                obscureText: false,
                hintText: "${DateTime.now().toLocal()}".split(' ')[0],
                prefixIcon: Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            child: InkWell(
              onTap: ()=>controller.selectTime(context),
              child: CommonTextFormField(
                isVisible: false,
                enable: false,
                controller: controller.timeController,
                keyboardType: TextInputType.none,
                obscureText: false,
                hintText: DateFormat('HH:mm').format(DateTime.now()),  // or 'hh:mm a' for 12-hour format
                prefixIcon: Icon(
                  Icons.access_time,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 10,),
      Text(
        '${language.msgReturn}:',
        textScaleFactor: 1,
        style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 14,
            color: AppColors.lblSecondaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // height: 50,
            width: 150,
            child:   InkWell(
              onTap: ()=>controller.returnSelectDate(context),
              child: CommonTextFormField(
                isVisible: false,
                enable:false,
                controller: controller.returnDateController,
                keyboardType: TextInputType.none,
                obscureText: false,
                hintText: "${DateTime.now().toLocal()}".split(' ')[0],
                prefixIcon: Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            width: 150,
            child: InkWell(
              onTap: ()=>controller.selectTime(context),
              child: CommonTextFormField(
                isVisible: false,
                enable: false,
                controller: controller.returnTimeController,
                keyboardType: TextInputType.none,
                obscureText: false,
                hintText: DateFormat('HH:mm').format(DateTime.now()),  // or 'hh:mm a' for 12-hour format
                prefixIcon: Icon(
                  Icons.access_time,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _selectedAircraftSummary(BuildContext context, ConfirmBookingController controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        language.msgSelectedAirCrafts,
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 18,
          color: AppColors.lblSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10,),
      Container(
        height: 80,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Gulfstream G650',
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 16,
                      color: AppColors.lblSecondaryColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.offerCardSecondaryColor,
                      ),
                      SizedBox(width: 3),
                      Text(
                        '4.9 (420+ Reviews)',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontFamily: 'Manrope-Regular',
                          fontSize: 14,
                          color: AppColors.hintTextPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Image.asset(
                img_plane,
                height: 45,
                width: 125,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              width: 1,
                color: AppColors.primaryColor.withOpacity(0.5)
            )
        ),
      ),
    ],
  );
}

Widget _detailSummary(BuildContext context, ConfirmBookingController controller){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        language.msgEnterPassengerDetails,
        textScaleFactor: 1,
        style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 18,
            color: AppColors.lblSecondaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10,),
      CommonTextFormField(
          isVisible: true,
          label: language.lblFullName,
          controller: controller.nameController,
          hintText: 'email@domain.com',
          keyboardType: TextInputType.text,
          obscureText: false
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: 50,
            width: 170,
            child:   InkWell(
              onTap: ()=>controller.returnSelectDate(context),
              child: CommonTextFormField(
                isVisible: true,
                enable: false,
                label: language.lblDOB,
                controller: controller.returnDateController,
                keyboardType: TextInputType.none,
                obscureText: false,
                hintText: "${DateTime.now().toLocal()}".split(' ')[0],
                prefixIcon: Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          Container(
            width: 170,
            child: InkWell(
              onTap: ()=>controller.selectTime(context),
              child: CommonTextFormField(
                isVisible: true,
                controller: controller.passportController,
                label: language.lblPassportNum,
                keyboardType: TextInputType.number,
                obscureText: false,
                hintText: '9544-4995-6XXXX',  // or 'hh:mm a' for 12-hour format
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _paymentSummary(BuildContext context, ConfirmBookingController controller){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        language.msgPaymentSummary,
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 18,
          color: AppColors.lblSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10),
      Text(
        '${language.msgPricingBreakdown}:',
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 14,
          color: AppColors.lblSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.pricingBreakdown.length,
        itemBuilder: (context, index) {
          final item = controller.pricingBreakdown[index];
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item['title']}:',
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 12,
                      color:AppColors.lblSecondaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    item['price']!,
                    textScaleFactor: 1,
                    style: TextStyle(
                      fontFamily: 'Manrope-Regular',
                      fontSize: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 10,
                color: AppColors.primaryBorderColor.withOpacity(0.5),
                thickness: 0.5,
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
      SizedBox(height: 10),
      Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${language.lblTotal}',
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lblSecondaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                controller.total,
                textScaleFactor: 1,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ],
  );
}

Widget _paymentMethodSummary(BuildContext context, ConfirmBookingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        language.msgPaymentMethod,
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 18,
          color: AppColors.lblSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      SizedBox(height: 10,),
      Text(
        '${language.msgSelectPaymentMethod}:',
        textScaleFactor: 1,
        style: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 14,
          color: AppColors.lblSecondaryColor,
          fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10,),
      Container(
        height: 60,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    img_visa,
                    height: 35,
                    width: 45,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '**** **** **** 8970',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontFamily: 'Manrope-Regular',
                          fontSize: 16,
                          color: AppColors.textSecondaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Expires: 12/26',
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontFamily: 'Manrope-Regular',
                          fontSize: 14,
                          color: AppColors.hintTextPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(
                verified,
                height: 30,
                width: 30,
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ],
  );
}

Widget _addressSummary(BuildContext context, ConfirmBookingController controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${language.lblBillingAddress}',
        textScaleFactor: 1,
        style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 18,
            color: AppColors.lblSecondaryColor,
            fontWeight: FontWeight.w600
        ),
      ),
      SizedBox(height: 10),
      CommonTextFormField(
          isVisible: true,
          label: language.lblStretAddress,
          controller: controller.addressController,
          keyboardType: TextInputType.text,
          hintText: 'XYZ, Lorem Ipsum....',
          obscureText: false
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 50,
            width: 170,
            child:   CommonTextFormField(
              isVisible: true,
              label: language.lblCity,
              controller: controller.cityController,
              keyboardType: TextInputType.text,
              hintText: 'Helenc..',
              obscureText: false,
            ),
          ),
          Container(
            width: 170,
            child:  CommonTextFormField(
              isVisible: true,
              label: language.lblState,
              controller: controller.stateController,
              keyboardType: TextInputType.text,
              hintText: '--state--',
              obscureText: false,
              dropdown: true,
              dropdownItems: controller.state,
              dropdownValue: controller.stateDrop.value,
              onChanged: (value) {
                controller.stateDrop.value = value!;
              },
            ),
          ),
        ],
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // height: 50,
            width: 170,
            child:   CommonTextFormField(
              isVisible: true,
              label: language.lblZipCode,
              controller: controller.zipcodeController,
              keyboardType: TextInputType.number,
              hintText: '2659XX..',
              obscureText: false,
            ),
          ),
          Container(
            width: 170,
            child:   CommonTextFormField(
              isVisible: true,
              label: language.lblCountry,
              controller: controller.countryController,
              keyboardType: TextInputType.text,
              hintText: '--Country--',
              obscureText: false,
              dropdown: true,
              dropdownItems: controller.country,
              dropdownValue: controller.countryDrop.value,
              onChanged: (value) {
                controller.countryDrop.value = value!;
              },
            ),
          ),
        ],
      ),
    ],
  );
}

