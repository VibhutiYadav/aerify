import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmBookingController extends GetxController {
  var isChecked = false.obs;
  var color1 = "1".obs;
  var color2 = "1".obs;
  var stateDrop = "Madhya Pradesh".obs;
  var countryDrop = "India".obs;

  final List<String> state = [
    "Madhya Pradesh",
    "Gujarat",
    "Rajasthan",
    "Uttarakhand",
    "Uttar Pradesh",
  ];
  final List<String> country = [
    "India",
    "USA",
    "China",
    "UK",
    "Russia",
  ];

  var selectedTime = TimeOfDay.now().obs;
  var selectedReturnTime = TimeOfDay.now().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController returnDateController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController returnTimeController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (picked != null && picked != selectedTime.value) {
      selectedTime.value = picked;
      timeController.text = selectedTime.value.format(context);
    }
  }

  Future<void> returnSelectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedReturnTime.value,
    );
    if (picked != null && picked != selectedReturnTime.value) {
      selectedReturnTime.value = picked;
      returnTimeController.text = selectedReturnTime.value.format(context);
    }
  }

  Future<void> returnSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      returnDateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      dateController.text = "${picked.toLocal()}".split(' ')[0];
    }
  }

  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      if (isAtLeast18YearsOld(picked)) {
        birthDateController.text = "${picked.toLocal()}".split(' ')[0];
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You must be at least 18 years old.')),
        );
      }
    }
  }

  bool isAtLeast18YearsOld(DateTime selectedDate) {
    final currentDate = DateTime.now();
    final age = currentDate.year - selectedDate.year;
    if (age > 18) {
      return true;
    } else if (age == 18) {
      if (currentDate.month > selectedDate.month) {
        return true;
      } else if (currentDate.month == selectedDate.month) {
        return currentDate.day >= selectedDate.day;
      }
    }
    return false;
  }

  final List<Map<String, String>> pricingBreakdown = [
    {'title': 'Base Price', 'price': '\$12,000'},
    {'title': 'In-Flight Catering', 'price': '\$500'},
    {'title': 'WiFi', 'price': '\$100'},
    {'title': 'Extra Baggage', 'price': '\$200'},
    {'title': 'Taxes and Fees', 'price': '\$1,500'},
  ];

  String get total => '\$14,300';
}
