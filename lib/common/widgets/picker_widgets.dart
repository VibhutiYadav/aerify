import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../util/helpers/colors.dart';

class CountryPicker extends StatelessWidget {
  var controller;
  final String? label;
   CountryPicker({super.key, required this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          textScaleFactor: 1,
          style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 16,
            color: AppColors.lblPrimaryColor,
          ),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller.countryController,
          validator: (value) {
              if (value == null || value.isEmpty) {
              return 'Please select the country';
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    controller.setSelectedCountry(country);
                  },
                );
              },
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.deButtonColor),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),

          ),
          readOnly: true,
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,

              onSelect: (Country country) {
                controller.setSelectedCountry(country);
              },
            );
          },
        ),
      ],
    );
  }
}

class CountryCodePicker extends StatelessWidget {
  var controller;
  final String? label;
  CountryCodePicker({super.key,required this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label!,
          textScaleFactor: 1,
          style: TextStyle(
            fontFamily: 'Manrope-Regular',
            fontSize: 16,
            color: AppColors.lblPrimaryColor,
          ),
        ),
        SizedBox(height: 5),
        InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            print('Phone number: ${number.phoneNumber}');
            print('Dial code: ${number.dialCode}');
            controller.updateCountryCode(number);
            controller.dialCodeController.text = number.dialCode.toString();
            print('Phone number (controller):: ${controller.phoneController.text}');
            print('Dial code (controller):: ${controller.dialCodeController.text}');
          },
          selectorConfig: SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: TextStyle(color: Colors.black),
          initialValue: controller.codeController.value,
          textFieldController: controller.phoneController,
          formatInput: true,
          keyboardType: TextInputType.number,
          maxLength: 12,
          onSaved: (PhoneNumber number) {
            controller.updateCountryCode(number);
          },
          validator: (value){
            if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
            } else if (controller.phoneController.text.length <11) {
            // } else if (!RegExp(r'^\+?[1-9]\d{10}$').hasMatch(value)) {
            return 'Please enter a valid phone number';
            }
            return null;
            },
          inputDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: Icon(Icons.phone),
            border:  OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.deButtonColor),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}


