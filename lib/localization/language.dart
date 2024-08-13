import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseLanguage {
  static BaseLanguage of(BuildContext context) => Localizations.of<BaseLanguage>(context, BaseLanguage)!;

  String get lblNext;
  String get lblContinue;
  String get lblLogin;
  String get lblSignup;
  String get lblWelcome;
  String get lblCreateAcc;
  String get lblLoginAcc;
  String get lblAlreadyAcc;
  String get lblFullName;
  String get lblFirstName;
  String get lblLastName;
  String get lblDOB;
  String get lblEmail;
  String get lblPhone;
  String get lblPwd;
  String get lblForgetPwd;
  String get lblPassportNum;
  String get lblReferral;
  String get lblSuccess;
  String get lblChangeLocation;
  String get lblFeatChart;
  String get lblViewAll;
  String get lblExOffer;
  String get lblBookNow;
  String get lblFeaturedCharters;
  String get lblNotifications;
  String get lblConfirmBooking;
  String get lblFlightSummary;
  String get lblTotal;
  String get lblBillingAddress;
  String get lblStretAddress;
  String get lblCity;
  String get lblState;
  String get lblZipCode;
  String get lblCountry;
  String get lblBooking;
  String get lblSearch;
  String get lblProfile;
  String get lblAgree;
  String get lblTermsConditions;
  String get lblLocationPermission;


  String get msgPleasEnter;
  String get msgNewToAerify;
  String get msgJoinAerify;
  String get msgJoinAerify2;
  String get msgAlmostThere;
  String get msgAlmostThere2;
  String get msgAlmostThere3;
  String get msgAlmostThere4;
  String get msgAlmostThere5;
  String get msgSuccessMsg;
  String get msgSuccessMsg2;
  String get msgSuccessMsg3;
  String get msgFlightDetails;
  String get msgFrom;
  String get msgTo;
  String get msgDeparture;
  String get msgReturn;
  String get msgSelectedAirCrafts;
  String get msgEnterPassengerDetails;
  String get msgPaymentSummary;
  String get msgPricingBreakdown;
  String get msgPaymentMethod;
  String get msgSelectPaymentMethod;
  String get msgFinalSuccessMsg;
  String get msgFinalSuccessMsg2;
}
