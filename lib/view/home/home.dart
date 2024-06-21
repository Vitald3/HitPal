import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/home/home.dart';
import '../widget/bottom_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
            body: SafeArea(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 20, height: 20),
                            const SizedBox(width: 1),
                            Text(
                              controller.profile.value.location!,
                              style: const TextStyle(
                                color: Color(0xFF7C8192),
                                fontWeight: FontWeight.w600
                              )
                            )
                          ]
                        ),
                        const SizedBox(height: 26),
                        Row(
                            children: [
                              controller.profile.value.avatar == '' ? 
                              SvgPicture.asset('assets/icons/user.svg', semanticsLabel: 'Location', width: 40, height: 40) :
                              Image.asset('assets/images/user.png', width: 40, height: 40),
                              const SizedBox(width: 12),
                              Expanded(child: Transform.translate(
                                  offset: const Offset(0, 2),
                                  child: Text(
                                      'HI, ${controller.profile.value.firstName!} ${controller.profile.value.lastName!}'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Color(0xFF232538),
                                          fontSize: 40,
                                          fontFamily: 'Thunder',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.40
                                      )
                                  )
                              ))
                            ]
                        ),
                        const SizedBox(height: 128),
                        const Text(
                          'Unavailable in this city',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF242538),
                            fontWeight: FontWeight.w600
                          )
                        ),
                        const SizedBox(height: 9),
                        const Text(
                          'Unfortunately, the app doesn’t work in this city yet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF73737C),
                            fontSize: 13,
                            letterSpacing: 0.04
                          )
                        )
                      ]
                  )
              )
            ),
            bottomNavigationBar: const BottomNavigation()
        )
    );
  }
}