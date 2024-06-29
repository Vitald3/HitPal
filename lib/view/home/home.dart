import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/home/home.dart';
import '../widget/bottom_navigation.dart';
import 'event.dart';
import 'location.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: SafeArea(
                child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                          automaticallyImplyLeading: false,
                          elevation: 0,
                          titleSpacing: 0,
                          scrolledUnderElevation: 0,
                          expandedHeight: 120,
                          backgroundColor: const Color(0xffEEF1F3),
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.pin,
                              background: Padding(
                                  padding: const EdgeInsets.only(left: 22, top: 16, right: 22),
                                  child: Column(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Get.to(() => const LocationView())?.then((value) => controller.initialize());
                                            },
                                            child: Row(
                                                children: [
                                                  SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 20, height: 20),
                                                  const SizedBox(width: 1),
                                                  Obx(() => Text(
                                                      controller.profile.value.location!,
                                                      style: const TextStyle(
                                                          color: Color(0xFF7C8192),
                                                          fontWeight: FontWeight.w600
                                                      )
                                                  ))
                                                ]
                                            )
                                        ),
                                        const SizedBox(height: 16),
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
                                        )
                                      ]
                                  )
                              )
                          )
                      ),
                      SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: controller.events.isEmpty ? Column(
                                children: [
                                  if (!controller.closeInfoBlock.value) Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: ShapeDecoration(
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(34),
                                          )
                                      ),
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(bottom: 12),
                                      padding: const EdgeInsets.only(top: 20, left: 25, bottom: 30, right: 25),
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              bottom: -40,
                                              right: -45,
                                              child: Image.asset('assets/images/back_ball.png', width: 110, height: 110),
                                            ),
                                            const Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Select one or more events to participate in',
                                                    style: TextStyle(
                                                        color: Color(0xFF242538),
                                                        fontWeight: FontWeight.w600
                                                    ),
                                                  ),
                                                  SizedBox(height: 6),
                                                  SizedBox(
                                                    width: 258,
                                                    child: Text(
                                                      'Wait until all players have registered. We will find the most suitable player for you based on your location and experience. All levels are welcome, from beginners to pros.',
                                                      style: TextStyle(
                                                          color: Color(0xFF73737C),
                                                          fontSize: 13,
                                                          letterSpacing: 0.04
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                            ),
                                            Positioned(
                                                top: -18,
                                                right: -20,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.closeInfo();
                                                    },
                                                    icon: const Icon(Icons.close, size: 16, color: Color(0xffB3B3BB))
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                  Wrap(
                                      runSpacing: 8,
                                      children: [
                                        GestureDetector(
                                            onTap: () => Get.to(() => const EventView(join: true, step: 1))?.then((value) => controller.initialize()),
                                            child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(width: 2, color: Color(0xFF70E244)),
                                                    borderRadius: BorderRadius.circular(34),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                    children: [
                                                      const Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(right: 10),
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '05',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFF232538),
                                                                                  fontSize: 24,
                                                                                  fontFamily: 'Thunder',
                                                                                  fontWeight: FontWeight.w700,
                                                                                  letterSpacing: 0.84
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'days',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  letterSpacing: 0.03,
                                                                                  height: 0.13
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  SizedBox(
                                                                      width: 40,
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '12',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'hours',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  letterSpacing: 0.03,
                                                                                  height: 0.13
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  SizedBox(
                                                                      width: 40,
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '05',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'min',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  letterSpacing: 0.03,
                                                                                  height: 0.13
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets.only(left: 10),
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '32',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                                'sec',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFFA3A9BD),
                                                                                    fontSize: 11,
                                                                                    letterSpacing: 0.03,
                                                                                    height: 0.13
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                      children: [
                                                                        Opacity(
                                                                            opacity: 0.70,
                                                                            child: Text(
                                                                              'WEEKLY',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(
                                                                                color: Color(0xFFA3A9BD),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            )
                                                                        ),
                                                                        SizedBox(width: 4),
                                                                        Text(
                                                                            '#307',
                                                                            textAlign: TextAlign.right,
                                                                            style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84
                                                                            )
                                                                        )
                                                                      ]
                                                                  ),
                                                                  Text(
                                                                      'Registration',
                                                                      textAlign: TextAlign.right,
                                                                      style: TextStyle(
                                                                          color: Color(0xFFA3A9BD),
                                                                          fontSize: 11,
                                                                          height: 0.13,
                                                                          letterSpacing: 0.03
                                                                      )
                                                                  ),
                                                                ]
                                                            )
                                                          ]
                                                      ),
                                                      const SizedBox(height: 18),
                                                      const Divider(color: Color(0xFFC8CBD9), thickness: 1),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Container(
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      padding: const EdgeInsets.only(left: 4, right: 8),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 64,
                                                                                child: Stack(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    children: [
                                                                                      Positioned(
                                                                                          left: 36,
                                                                                          child: Image.asset('assets/images/play3.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 18,
                                                                                          child: Image.asset('assets/images/play2.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Image.asset('assets/images/play1.png', width: 28, height: 28),
                                                                                    ]
                                                                                )
                                                                            ),
                                                                            const SizedBox(
                                                                                width: 38,
                                                                                child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                          '14',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF232538),
                                                                                              fontSize: 18,
                                                                                              fontFamily: 'Thunder',
                                                                                              fontWeight: FontWeight.w700,
                                                                                              letterSpacing: 0.63
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                          'players',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFFA3A9BD),
                                                                                            fontSize: 11,
                                                                                            height: 0.13,
                                                                                            letterSpacing: 0.03,
                                                                                          )
                                                                                      )
                                                                                    ]
                                                                                )
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  const SizedBox(width: 1),
                                                                  Container(
                                                                      width: 55,
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      child: const Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                                '1',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFF232538),
                                                                                    fontSize: 18,
                                                                                    fontFamily: 'Thunder',
                                                                                    fontWeight: FontWeight.w700,
                                                                                    letterSpacing: 0.63
                                                                                )
                                                                            ),
                                                                            Text(
                                                                                'match',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  height: 0.13,
                                                                                  letterSpacing: 0.03,
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Container(
                                                                width: 109,
                                                                height: 38,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: ShapeDecoration(
                                                                  color: const Color(0xFF70E244),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset('assets/icons/check_white.svg', semanticsLabel: 'Check', width: 15, height: 15),
                                                                      const SizedBox(width: 4),
                                                                      const Text(
                                                                          'PARTICIPATING',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'Thunder',
                                                                              fontWeight: FontWeight.w700,
                                                                              letterSpacing: 0.84
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                        ),
                                        GestureDetector(
                                            onTap: () => Get.to(() => const EventView(join: false, step: 1))?.then((value) => controller.initialize()),
                                            child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(34)
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                    children: [
                                                      const Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(right: 10),
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '05',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFF232538),
                                                                                  fontSize: 24,
                                                                                  fontFamily: 'Thunder',
                                                                                  fontWeight: FontWeight.w700,
                                                                                  letterSpacing: 0.84
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'days',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  letterSpacing: 0.03,
                                                                                  height: 0.13
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  SizedBox(
                                                                      width: 40,
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '12',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'hours',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  letterSpacing: 0.03,
                                                                                  height: 0.13
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  SizedBox(
                                                                      width: 40,
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '05',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'min',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  letterSpacing: 0.03,
                                                                                  height: 0.13
                                                                              ),
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  Padding(
                                                                      padding: EdgeInsets.only(left: 10),
                                                                      child: Column(
                                                                          children: [
                                                                            Text(
                                                                              '32',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                                'sec',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFFA3A9BD),
                                                                                    fontSize: 11,
                                                                                    letterSpacing: 0.03,
                                                                                    height: 0.13
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                      children: [
                                                                        Opacity(
                                                                            opacity: 0.70,
                                                                            child: Text(
                                                                              'WEEKLY',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(
                                                                                color: Color(0xFFA3A9BD),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            )
                                                                        ),
                                                                        SizedBox(width: 4),
                                                                        Text(
                                                                            '#307',
                                                                            textAlign: TextAlign.right,
                                                                            style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84
                                                                            )
                                                                        )
                                                                      ]
                                                                  ),
                                                                  Text(
                                                                      'Registration',
                                                                      textAlign: TextAlign.right,
                                                                      style: TextStyle(
                                                                          color: Color(0xFFA3A9BD),
                                                                          fontSize: 11,
                                                                          height: 0.13,
                                                                          letterSpacing: 0.03
                                                                      )
                                                                  ),
                                                                ]
                                                            )
                                                          ]
                                                      ),
                                                      const SizedBox(height: 18),
                                                      const Divider(color: Color(0xFFC8CBD9), thickness: 1),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Container(
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      padding: const EdgeInsets.only(left: 4, right: 8),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 64,
                                                                                child: Stack(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    children: [
                                                                                      Positioned(
                                                                                          left: 36,
                                                                                          child: Image.asset('assets/images/play3.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 18,
                                                                                          child: Image.asset('assets/images/play2.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Image.asset('assets/images/play1.png', width: 28, height: 28),
                                                                                    ]
                                                                                )
                                                                            ),
                                                                            const SizedBox(
                                                                                width: 38,
                                                                                child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                          '14',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF232538),
                                                                                              fontSize: 18,
                                                                                              fontFamily: 'Thunder',
                                                                                              fontWeight: FontWeight.w700,
                                                                                              letterSpacing: 0.63
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                          'players',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFFA3A9BD),
                                                                                            fontSize: 11,
                                                                                            height: 0.13,
                                                                                            letterSpacing: 0.03,
                                                                                          )
                                                                                      )
                                                                                    ]
                                                                                )
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  const SizedBox(width: 1),
                                                                  Container(
                                                                      width: 55,
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      child: const Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                                '1',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFF232538),
                                                                                    fontSize: 18,
                                                                                    fontFamily: 'Thunder',
                                                                                    fontWeight: FontWeight.w700,
                                                                                    letterSpacing: 0.63
                                                                                )
                                                                            ),
                                                                            Text(
                                                                                'match',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  height: 0.13,
                                                                                  letterSpacing: 0.03,
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Container(
                                                                width: 109,
                                                                height: 38,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: ShapeDecoration(
                                                                  color: const Color(0xFF6149E0),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                ),
                                                                child: const Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Text(
                                                                          'JOIN',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'Thunder',
                                                                              fontWeight: FontWeight.w700,
                                                                              letterSpacing: 0.84
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                        ),
                                        GestureDetector(
                                            onTap: () => Get.to(() => const EventView(join: false, step: 3))?.then((value) => controller.initialize()),
                                            child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(width: 2, color: Color(0xFF70E244)),
                                                    borderRadius: BorderRadius.circular(34),
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                    children: [
                                                      const Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                      'IN PROGRESS',
                                                                      style: TextStyle(
                                                                          color: Color(0xFF70E244),
                                                                          fontSize: 24,
                                                                          fontFamily: 'Thunder',
                                                                          fontWeight: FontWeight.w700,
                                                                          letterSpacing: 0.84
                                                                      )
                                                                  ),
                                                                  Text(
                                                                      'Until 23 may 2024 00:01',
                                                                      style: TextStyle(
                                                                          color: Color(0xFF242538),
                                                                          fontSize: 11,
                                                                          height: 0.13,
                                                                          letterSpacing: 0.03
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                      children: [
                                                                        Opacity(
                                                                            opacity: 0.70,
                                                                            child: Text(
                                                                              'WEEKLY',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(
                                                                                color: Color(0xFFA3A9BD),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            )
                                                                        ),
                                                                        SizedBox(width: 4),
                                                                        Text(
                                                                            '#307',
                                                                            textAlign: TextAlign.right,
                                                                            style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84
                                                                            )
                                                                        )
                                                                      ]
                                                                  )
                                                                ]
                                                            )
                                                          ]
                                                      ),
                                                      const SizedBox(height: 18),
                                                      const Divider(color: Color(0xFFC8CBD9), thickness: 1),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Container(
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      padding: const EdgeInsets.only(left: 4, right: 8),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 64,
                                                                                child: Stack(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    children: [
                                                                                      Positioned(
                                                                                          left: 36,
                                                                                          child: Image.asset('assets/images/play3.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 18,
                                                                                          child: Image.asset('assets/images/play2.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Image.asset('assets/images/play1.png', width: 28, height: 28),
                                                                                    ]
                                                                                )
                                                                            ),
                                                                            const SizedBox(
                                                                                width: 38,
                                                                                child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                          '14',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF232538),
                                                                                              fontSize: 18,
                                                                                              fontFamily: 'Thunder',
                                                                                              fontWeight: FontWeight.w700,
                                                                                              letterSpacing: 0.63
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                          'players',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFFA3A9BD),
                                                                                            fontSize: 11,
                                                                                            height: 0.13,
                                                                                            letterSpacing: 0.03,
                                                                                          )
                                                                                      )
                                                                                    ]
                                                                                )
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  const SizedBox(width: 1),
                                                                  Container(
                                                                      width: 55,
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      child: const Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                                '1',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFF232538),
                                                                                    fontSize: 18,
                                                                                    fontFamily: 'Thunder',
                                                                                    fontWeight: FontWeight.w700,
                                                                                    letterSpacing: 0.63
                                                                                )
                                                                            ),
                                                                            Text(
                                                                                'match',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  height: 0.13,
                                                                                  letterSpacing: 0.03,
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Container(
                                                                width: 109,
                                                                height: 38,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: ShapeDecoration(
                                                                  color: const Color(0xFF70E244),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset('assets/icons/check_white.svg', semanticsLabel: 'Check', width: 15, height: 15),
                                                                      const SizedBox(width: 4),
                                                                      const Text(
                                                                          'PARTICIPATING',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'Thunder',
                                                                              fontWeight: FontWeight.w700,
                                                                              letterSpacing: 0.84
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(34)
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                      'FINISHED',
                                                                      style: TextStyle(
                                                                        color: const Color(0xFFA4A9BD).withOpacity(0.7),
                                                                        fontSize: 24,
                                                                        fontFamily: 'Thunder',
                                                                        fontWeight: FontWeight.w700,
                                                                        letterSpacing: 0.84,
                                                                      )
                                                                  ),
                                                                  const Text(
                                                                    'Status',
                                                                    style: TextStyle(
                                                                      color: Color(0xFFA4A9BD),
                                                                      fontSize: 11,
                                                                      height: 0.13,
                                                                      letterSpacing: 0.03,
                                                                    ),
                                                                  ),
                                                                ]
                                                            ),
                                                            const Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                      children: [
                                                                        Opacity(
                                                                            opacity: 0.70,
                                                                            child: Text(
                                                                              'WEEKLY',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(
                                                                                color: Color(0xFFA3A9BD),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            )
                                                                        ),
                                                                        SizedBox(width: 4),
                                                                        Text(
                                                                            '#307',
                                                                            textAlign: TextAlign.right,
                                                                            style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84
                                                                            )
                                                                        )
                                                                      ]
                                                                  )
                                                                ]
                                                            )
                                                          ]
                                                      ),
                                                      const SizedBox(height: 18),
                                                      const Divider(color: Color(0xFFC8CBD9), thickness: 1),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Container(
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      padding: const EdgeInsets.only(left: 4, right: 8),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 64,
                                                                                child: Stack(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    children: [
                                                                                      Positioned(
                                                                                          left: 36,
                                                                                          child: Image.asset('assets/images/play3.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 18,
                                                                                          child: Image.asset('assets/images/play2.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Image.asset('assets/images/play1.png', width: 28, height: 28),
                                                                                    ]
                                                                                )
                                                                            ),
                                                                            const SizedBox(
                                                                                width: 38,
                                                                                child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                          '14',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF232538),
                                                                                              fontSize: 18,
                                                                                              fontFamily: 'Thunder',
                                                                                              fontWeight: FontWeight.w700,
                                                                                              letterSpacing: 0.63
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                          'players',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFFA3A9BD),
                                                                                            fontSize: 11,
                                                                                            height: 0.13,
                                                                                            letterSpacing: 0.03,
                                                                                          )
                                                                                      )
                                                                                    ]
                                                                                )
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  const SizedBox(width: 1),
                                                                  Container(
                                                                      width: 55,
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      child: const Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                                '1',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFF232538),
                                                                                    fontSize: 18,
                                                                                    fontFamily: 'Thunder',
                                                                                    fontWeight: FontWeight.w700,
                                                                                    letterSpacing: 0.63
                                                                                )
                                                                            ),
                                                                            Text(
                                                                                'match',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  height: 0.13,
                                                                                  letterSpacing: 0.03,
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Container(
                                                                width: 109,
                                                                height: 38,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: ShapeDecoration(
                                                                  color: const Color(0xFFDFDFDF),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                ),
                                                                child: const Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Text(
                                                                          'PARTICIPATING',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'Thunder',
                                                                              fontWeight: FontWeight.w700,
                                                                              letterSpacing: 0.84
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                        ),
                                        GestureDetector(
                                            onTap: () => Get.to(() => const EventView(join: false, step: 3, enterResult: true))?.then((value) => controller.initialize()),
                                            child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(34)
                                                  ),
                                                ),
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                    children: [
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                      'FINISHED',
                                                                      style: TextStyle(
                                                                        color: const Color(0xFFA4A9BD).withOpacity(0.7),
                                                                        fontSize: 24,
                                                                        fontFamily: 'Thunder',
                                                                        fontWeight: FontWeight.w700,
                                                                        letterSpacing: 0.84,
                                                                      )
                                                                  ),
                                                                  const Text(
                                                                      '10 may 2024 00:01',
                                                                      style: TextStyle(
                                                                        color: Color(0xFF242538),
                                                                        fontSize: 11,
                                                                        height: 0.13,
                                                                        letterSpacing: 0.03,
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            const Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                      children: [
                                                                        Opacity(
                                                                            opacity: 0.70,
                                                                            child: Text(
                                                                              'WEEKLY',
                                                                              textAlign: TextAlign.right,
                                                                              style: TextStyle(
                                                                                color: Color(0xFFA3A9BD),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84,
                                                                              ),
                                                                            )
                                                                        ),
                                                                        SizedBox(width: 4),
                                                                        Text(
                                                                            '#307',
                                                                            textAlign: TextAlign.right,
                                                                            style: TextStyle(
                                                                                color: Color(0xFF232538),
                                                                                fontSize: 24,
                                                                                fontFamily: 'Thunder',
                                                                                fontWeight: FontWeight.w700,
                                                                                letterSpacing: 0.84
                                                                            )
                                                                        )
                                                                      ]
                                                                  )
                                                                ]
                                                            )
                                                          ]
                                                      ),
                                                      const SizedBox(height: 18),
                                                      const Divider(color: Color(0xFFC8CBD9), thickness: 1),
                                                      const SizedBox(height: 10),
                                                      Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                                children: [
                                                                  Container(
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      padding: const EdgeInsets.only(left: 4, right: 8),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            SizedBox(
                                                                                width: 64,
                                                                                child: Stack(
                                                                                    alignment: Alignment.centerLeft,
                                                                                    children: [
                                                                                      Positioned(
                                                                                          left: 36,
                                                                                          child: Image.asset('assets/images/play3.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Positioned(
                                                                                          left: 18,
                                                                                          child: Image.asset('assets/images/play2.png', width: 28, height: 28)
                                                                                      ),
                                                                                      Image.asset('assets/images/play1.png', width: 28, height: 28),
                                                                                    ]
                                                                                )
                                                                            ),
                                                                            const SizedBox(
                                                                                width: 38,
                                                                                child: Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                          '14',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF232538),
                                                                                              fontSize: 18,
                                                                                              fontFamily: 'Thunder',
                                                                                              fontWeight: FontWeight.w700,
                                                                                              letterSpacing: 0.63
                                                                                          )
                                                                                      ),
                                                                                      Text(
                                                                                          'players',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFFA3A9BD),
                                                                                            fontSize: 11,
                                                                                            height: 0.13,
                                                                                            letterSpacing: 0.03,
                                                                                          )
                                                                                      )
                                                                                    ]
                                                                                )
                                                                            ),
                                                                          ]
                                                                      )
                                                                  ),
                                                                  const SizedBox(width: 1),
                                                                  Container(
                                                                      width: 55,
                                                                      height: 38,
                                                                      decoration: ShapeDecoration(
                                                                        color: const Color(0xFFEEF0F3),
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(10),
                                                                        ),
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      child: const Column(
                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                                '1',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                    color: Color(0xFF232538),
                                                                                    fontSize: 18,
                                                                                    fontFamily: 'Thunder',
                                                                                    fontWeight: FontWeight.w700,
                                                                                    letterSpacing: 0.63
                                                                                )
                                                                            ),
                                                                            Text(
                                                                                'match',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(
                                                                                  color: Color(0xFFA3A9BD),
                                                                                  fontSize: 11,
                                                                                  height: 0.13,
                                                                                  letterSpacing: 0.03,
                                                                                )
                                                                            )
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            ),
                                                            Container(
                                                                width: 109,
                                                                height: 38,
                                                                clipBehavior: Clip.antiAlias,
                                                                decoration: ShapeDecoration(
                                                                  color: const Color(0xFF242538),
                                                                  shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      SvgPicture.asset('assets/icons/check_white.svg', semanticsLabel: 'Check', width: 15, height: 15),
                                                                      const SizedBox(width: 4),
                                                                      const Text(
                                                                          'PARTICIPATING',
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontFamily: 'Thunder',
                                                                              fontWeight: FontWeight.w700,
                                                                              letterSpacing: 0.84
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                    ]
                                                )
                                            )
                                        )
                                      ]
                                  )
                                ]
                            ) :
                            const Column(
                                children: [
                                  SizedBox(height: 128),
                                  Text(
                                      'Unavailable in this city',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF242538),
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                  SizedBox(height: 9),
                                  Text(
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
                        );
                      }, childCount: 1))
                    ]
                )
            ),
            bottomNavigationBar: const BottomNavigation()
        )
    );
  }
}