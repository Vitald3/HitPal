import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFE9EAF0)
                    )
                )
            ),
            child: BottomNavigationBar(
              selectedFontSize: 11,
              unselectedFontSize: 11,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              iconSize: 22,
              selectedItemColor: primaryColor,
              unselectedItemColor: const Color(0xFFA3A9BD),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/home.svg', colorFilter: ColorFilter.mode(controller.activeTab.value == 0 ? primaryColor : const Color(0xFFA3A9BD), BlendMode.srcIn), semanticsLabel: 'Home', width: 22, height: 22),
                    label: 'Find games'
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/matches.svg', colorFilter: ColorFilter.mode(controller.activeTab.value == 1 ? primaryColor : const Color(0xFFA3A9BD), BlendMode.srcIn), semanticsLabel: 'My matches', width: 22, height: 22),
                    label: 'My matches'
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/players.svg', colorFilter: ColorFilter.mode(controller.activeTab.value == 2 ? primaryColor : const Color(0xFFA3A9BD), BlendMode.srcIn), semanticsLabel: 'Players', width: 22, height: 22),
                    label: 'Players'
                ),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/icons/user.svg', colorFilter: ColorFilter.mode(controller.activeTab.value == 3 ? primaryColor : const Color(0xFFA3A9BD), BlendMode.srcIn), semanticsLabel: 'Profile', width: 22, height: 22),
                    label: 'Profile'
                )
              ],
              currentIndex: controller.activeTab.value,
              onTap: controller.onItemTapped,
            ))
    );
  }
}