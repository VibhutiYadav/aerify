import 'package:airline_app/binding/auth/login_binding.dart';
import 'package:airline_app/binding/auth/signup_binding.dart';
import 'package:airline_app/binding/booking/confirm_booking_binding.dart';
import 'package:airline_app/binding/featured/featured_detail_binding.dart';
import 'package:airline_app/binding/onboarding/walkthrough_binding.dart';
import 'package:airline_app/binding/success/successfully_booked_binding.dart';
import 'package:airline_app/features/auth/view/login_screen.dart';
import 'package:airline_app/features/auth/view/otpScreen.dart';
import 'package:airline_app/features/auth/view/otp_verified_screen.dart';
import 'package:airline_app/features/auth/view/signup_screen.dart';
import 'package:airline_app/features/booking/view/booking_screen.dart';
import 'package:airline_app/features/booking/controller/confirm_booking_controller.dart';
import 'package:airline_app/features/booking/view/confirm_booking_screen.dart';
import 'package:airline_app/features/dashboard/home.dart';
import 'package:airline_app/features/featured/view/featured_detail_screen.dart';
import 'package:airline_app/features/featured/view/featured_view_screen.dart';
import 'package:airline_app/features/notification/view/notification_screen.dart';
import 'package:airline_app/features/onboarding/view/walkthrough_screen.dart';
import 'package:airline_app/features/success/view/successfully_booked.dart';
import 'package:get/get.dart';
import '../../binding/components/search_pannel_binding.dart';
import '../../binding/notification/notification_binding.dart';
import '../../binding/splash/splash_binding.dart';
import '../../features/spalsh/views/splash_screen.dart';


class AppRoutes {
  // Define route names as static constants
  static const String splash = '/splash';
  static const String walkthrough = '/walkthrough';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String otp = '/otp';
  static const String otpverified = '/otpverified';
  static const String home = '/home';
  static const String notification = '/notification';
  static const String featured = '/featured';
  static const String featuredDetail = '/featuredDetail';
  static const String booking = '/booking';
  static const String confirmBooking = '/confirmBooking';
  static const String successfullyBooked = '/successfullyBooked';


  // Define a list of pages and their bindings
  static final List<GetPage> pages = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: walkthrough,
      page: () => WalkThroughScreen(),
      binding: WalkthroughBinding(),
    ),
    GetPage(
      name: signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: otp,
        page: () => OTPScreen(),
    ),
    GetPage(
      name: otpverified,
      page: () => OTPVerifiedScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: notification,
      page: () => Notificationscreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: featured,
      page: () => FeaturedScreen(),
    ),
    GetPage(
      name: featuredDetail,
      page: () => FeaturedDetailScreen(),
      binding: FeaturedDetailBinding(),
    ),
    GetPage(
        name: booking, 
        page: () => BookingScreen()
    ),
    GetPage(
      name: confirmBooking,
      page: () => ConfirmBookingScreen(),
      binding: ConfirmBookingBinding(),
    ),
    GetPage(
        name: successfullyBooked,
        page: () => SuccessfullyBooked(),
       binding: SuccessfullyBookedBinding(),
    ),

  ];
}
