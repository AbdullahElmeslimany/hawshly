import 'package:flutter/material.dart';
import 'package:hawshly/view/account/account.dart';
import 'package:hawshly/view/chart/chart.dart';
import 'package:hawshly/view/limitmoney/limitmoney.dart';
import 'package:hawshly/view/homepage/homepage.dart';
import 'package:hawshly/view/suggest_page/suggest_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../add_expenses-page/add_expenses_page.dart';
import '../tranzation_page/tranzation_page.dart';

class ButtonBarC extends StatelessWidget {
  final uID;

  const ButtonBarC({super.key, required this.uID});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    List<Widget> Screens() {
      return [
        const MyHomePage(),
        const LimitMoneyPage(),
        const SuggestPage(),
         AddExpensesPage(id: uID),
        const ChartPage(),
        AccountPage(id: uID),
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
          activeColorSecondary: Colors.black,
          textStyle: const TextStyle(fontSize: 11),
          icon: const Icon(
            Icons.autorenew_rounded,
            color: Colors.black,
          ),
          title: ("المعاملات"),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.black,
          textStyle: const TextStyle(fontSize: 11),
          icon: const Icon(
            Icons.app_registration_rounded,
            color: Colors.black,
          ),
          title: ("الاقتراحات"),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.black,
          textStyle: const TextStyle(fontSize: 11),
          icon: const Icon(
            Icons.money_off,
            color: Colors.black,
          ),
          title: ("الاقساط"),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.black,
          textStyle: const TextStyle(fontSize: 11),
          icon: const Icon(
            Icons.bar_chart_rounded,
            color: Colors.black,
          ),
          title: ("الاحصاء"),
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          activeColorSecondary: Colors.black,
          textStyle: const TextStyle(fontSize: 11),
          icon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
          title: ("الحساب"),
          inactiveColorPrimary: Colors.grey,
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
      navBarStyle: NavBarStyle.style8,
    );
  }
}
