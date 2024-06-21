import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxInt activeTab = 0.obs;
  final Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>()
  };
  RxBool reset = false.obs;

  final List<Widget> widgetOptions = <Widget>[

  ];

  void onItemTapped(int index) {
    activeTab.value = index;
  }

  void resetV() {
    reset.value = true;
  }
}