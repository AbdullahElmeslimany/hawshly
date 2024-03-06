import 'package:flutter/material.dart';
import 'package:hawshly/view/account/account.dart';
import 'package:hawshly/view/chart/chart.dart';
import 'package:hawshly/view/homepage/homepage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../add_expenses-page/add_expenses_page.dart';
import '../sendmoney/sendmoney.dart';

class ButtonBarC extends StatelessWidget {
  final data;
  const ButtonBarC({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    List<Widget> Screens() {
      return [
        const MyHomePage(),
        const SendAndRequestPage(),
        const AddExpensesPage(),
        const ChartPage(),
        const AccountPage()
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.black,
          textStyle: const TextStyle(fontSize: 11),
          icon: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: ("رئيسية"),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.white,
          icon: const Icon(
            Icons.autorenew_rounded,
            // color: Colors.white,
            // size: 35,
          ),
          title: ("المعاملات"),
          textStyle: const TextStyle(fontSize: 11),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.white,
          icon: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          title: (" "),
          activeColorPrimary: Colors.cyan.shade800,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.white,
          icon: const Icon(
            Icons.bar_chart_rounded,
            color: Colors.black,
          ),
          title: ("الاحصاء"),
          textStyle: const TextStyle(fontSize: 11),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.white,
          icon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
          title: ("الحساب"),
          textStyle: const TextStyle(fontSize: 11),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.black,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: controller,
      screens: Screens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}
