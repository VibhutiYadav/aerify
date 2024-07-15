import 'package:airline_app/features/dashboard/view/home_fragment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../util/helpers/colors.dart';
import '../booking/view/booking_screen.dart';
import '../profile/profile_screen.dart';
import '../search/view/search_screen.dart';
import 'controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
   int? pageIndex;

  HomeScreen({super.key,  this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.pageIndex??0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeFragment(),
      SearchScreen(),
      BookingScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined, size: 25,),
        title: ("Home"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.black.withOpacity(0.2),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search_outlined, size: 25,),
        title: ("Search Flights"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.black.withOpacity(0.2),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.airplane_ticket_outlined),
        title: ("My Bookings"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.black.withOpacity(0.2),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_2_outlined, size: 25,),
        title: ("Profile"),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.black.withOpacity(0.2),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0 ? 0.0 : kBottomNavigationBarHeight,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style3,
            onItemSelected: (index) {
              controller.currentIndex.value = index;
              print("Selected Index: $index");
            },
          ),
        );
      },
    );
  }
}
