import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../controller/navigation.dart';
import '../../utils/constant.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) => Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFCECECE),
                    blurRadius: 15,
                    offset: Offset(0, 14),
                    spreadRadius: 0
                )
              ],
            ),
            child: BottomNavigationBar(
              selectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xFF070810),
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_remote),
                    label: ''
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: ''
                )
              ],
              currentIndex: controller.activeTab.value,
              onTap: controller.onItemTapped,
            ))
    );
  }
}