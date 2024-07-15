// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../util/helpers/colors.dart';
//
// class CommonTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final String? label;
//   final TextInputType keyboardType;
//   late final bool obscureText;
//   final bool isVisible;
//   final String? hintText;
//   Widget? suffixIcon;
//   Widget? prefixIcon;
//   bool? enable;
//   Function()? onTap;
//
//   CommonTextFormField({Key? key,required this.isVisible, required this.controller, this.label, required this.keyboardType, required this.obscureText,   this.hintText,   this.suffixIcon, this.prefixIcon, this.enable, this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return isVisible
//         ? Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label!,
//           textScaleFactor: 1,
//           style: TextStyle(
//             fontFamily: 'Manrope-Regular',
//             fontSize: 16,
//             color: AppColors.lblPrimaryColor,
//           ),
//         ),
//         SizedBox(height: 5),
//         TextFormField(
//           enabled: enable,
//           controller: controller,
//           keyboardType: keyboardType,
//           obscureText: obscureText,
//           inputFormatters: [LengthLimitingTextInputFormatter(25)],
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//             filled: true,
//             fillColor: Colors.white,
//             hintText: hintText,
//             hintStyle: TextStyle(
//               fontFamily: 'Manrope-Regular',
//               fontSize: 14,
//               color: AppColors.hintTextColor,
//               fontWeight: FontWeight.w500,
//             ),
//             suffixIcon:suffixIcon,
//             prefixIcon: prefixIcon,
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.deButtonColor),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(5),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide.none,
//               borderRadius: BorderRadius.circular(5),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           //   onTap: ()=>{
//           // print("it is working")
//           //   },
//         ),
//       ],
//     )
//         :  TextFormField(
//       enabled: enable,
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       inputFormatters: [LengthLimitingTextInputFormatter(25)],
//       decoration: InputDecoration(
//         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//         filled: true,
//         fillColor: Colors.white,
//         hintText: hintText,
//         hintStyle: TextStyle(
//           fontFamily: 'Manrope-Regular',
//           fontSize: 14,
//           color: AppColors.hintTextColor,
//           fontWeight: FontWeight.w500,
//         ),
//         suffixIcon:suffixIcon,
//         prefixIcon: prefixIcon,
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.deButtonColor),
//           borderRadius: BorderRadius.circular(5),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(5),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       //   onTap: ()=>{
//       // print("it is working")
//       //   },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../util/helpers/colors.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isVisible;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enable;
  final Function()? onTap;
  final bool dropdown;
  final List<String>? dropdownItems;
  final String? dropdownValue;
  final Function(String?)? onChanged;

  CommonTextFormField({
    Key? key,
    required this.isVisible,
    required this.controller,
    this.label,
    required this.keyboardType,
    required this.obscureText,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.enable,
    this.onTap,
    this.dropdown = false,
    this.dropdownItems,
    this.dropdownValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
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
        dropdown
            ? DropdownButtonFormField<String>(
          value: dropdownValue,
          items: dropdownItems
              ?.map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Manrope-Regular',
              fontSize: 14,
              color: AppColors.hintTextColor,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.deButtonColor),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
            : TextFormField(
          enabled: enable,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          inputFormatters: [
            LengthLimitingTextInputFormatter(25)
          ],
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Manrope-Regular',
              fontSize: 14,
              color: AppColors.hintTextColor,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
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
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    )
        : TextFormField(
      enabled: enable,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      inputFormatters: [LengthLimitingTextInputFormatter(25)],
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Manrope-Regular',
          fontSize: 14,
          color: AppColors.hintTextColor,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.deButtonColor),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}


