import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/players/players.dart';
import '../home/location.dart';
import '../widget/bottom_navigation.dart';

class PlayersView extends StatelessWidget {
  const PlayersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayersController>(
        init: PlayersController(),
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
                          expandedHeight: 20,
                          backgroundColor: const Color(0xffEEF1F3),
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.pin,
                              background: Padding(
                                  padding: const EdgeInsets.only(left: 22, top: 16, right: 22),
                                  child: InkWell(
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
                                  )
                              )
                          )
                      ),
                      SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 22, top: 10),
                            child: controller.players.isEmpty ? Wrap(
                                runSpacing: 5,
                                children: [
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player1.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Provetr Martins',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '44',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '15',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Alex Donk',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '189',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '93',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player1.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Provetr Martins',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '44',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '15',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Alex Donk',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '189',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '93',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player1.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Provetr Martins',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '44',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '15',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Alex Donk',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '189',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '93',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player1.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Provetr Martins',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '44',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '15',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Alex Donk',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '189',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '93',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player1.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Provetr Martins',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '44',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '15',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Alex Donk',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '189',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '93',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player1.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Provetr Martins',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '44',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '15',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(24)
                                        ),
                                      ),
                                      clipBehavior: Clip.none,
                                      padding: const EdgeInsets.all(12),
                                      alignment: Alignment.center,
                                      child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Positioned(
                                              top: -18,
                                              left: -18,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: ShapeDecoration(
                                                    color: const Color(0xFFFC728B),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(23)
                                                    ),
                                                  ),
                                                  width: 23,
                                                  height: 23,
                                                  child: const Text(
                                                      '6',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03
                                                      )
                                                  )
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      children: [
                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                        const SizedBox(width: 13),
                                                        Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Alex Donk',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                              const SizedBox(height: 3),
                                                              Row(
                                                                  children: [
                                                                    SvgPicture.asset('assets/icons/location.svg', semanticsLabel: 'Location', width: 14, height: 16),
                                                                    const SizedBox(width: 4),
                                                                    const Text(
                                                                        'San Francisco, CA',
                                                                        style: TextStyle(
                                                                            color: Color(0xFF73737C),
                                                                            fontSize: 13,
                                                                            letterSpacing: 0.04
                                                                        )
                                                                    )
                                                                  ]
                                                              )
                                                            ]
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(
                                                      height: 26,
                                                      child: Row(
                                                          children: [
                                                            Text(
                                                                '189',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFF76DB5D),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                            SizedBox(width: 4),
                                                            Text(
                                                                '93',
                                                                textAlign: TextAlign.right,
                                                                style: TextStyle(
                                                                    color: Color(0xFFFC728A),
                                                                    fontSize: 24,
                                                                    fontFamily: 'Thunder',
                                                                    fontWeight: FontWeight.w700,
                                                                    letterSpacing: 0.84
                                                                )
                                                            ),
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                          ]
                                      )
                                  ),
                                ]
                            ) :
                            const Column(
                                children: [
                                  SizedBox(height: 128),
                                  Text(
                                      'Unavailable players',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xFF242538),
                                          fontWeight: FontWeight.w600
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