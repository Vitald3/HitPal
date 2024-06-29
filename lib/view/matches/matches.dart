import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/matches/matches.dart';
import '../../utils/constant.dart';
import '../../utils/function.dart';
import '../home/event.dart';
import '../home/location.dart';
import '../widget/bottom_navigation.dart';

class MatchesView extends StatelessWidget {
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchesController>(
        init: MatchesController(),
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
                            padding: const EdgeInsets.only(bottom: 16),
                            child: controller.matches.isEmpty ? Wrap(
                                runSpacing: 10,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(34)
                                        ),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 25),
                                          child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                          width: 116,
                                                          height: 116,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Stack(
                                                                  clipBehavior: Clip.none,
                                                                  children: [
                                                                    CircleAvatar(
                                                                        radius: 35,
                                                                        child: Image.asset('assets/images/player1.png', width: 70, height: 70)
                                                                    ),
                                                                    Positioned(
                                                                        top: -5,
                                                                        right: -5,
                                                                        child: Container(
                                                                            width: 23,
                                                                            height: 23,
                                                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                            clipBehavior: Clip.antiAlias,
                                                                            alignment: Alignment.center,
                                                                            decoration: ShapeDecoration(
                                                                              color: const Color(0xFFFC728A),
                                                                              shape: RoundedRectangleBorder(
                                                                                  side: const BorderSide(
                                                                                      width: 2,
                                                                                      strokeAlign: BorderSide.strokeAlignOutside,
                                                                                      color: Colors.white
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(23)
                                                                              ),
                                                                            ),
                                                                            child: const Text(
                                                                              '5',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  letterSpacing: 0.03
                                                                              ),
                                                                            )
                                                                        )
                                                                    )
                                                                  ]
                                                              ),
                                                              const SizedBox(height: 6),
                                                              const Text(
                                                                  'Provetr Martins',
                                                                  textAlign: TextAlign.center,
                                                                  maxLines: 2,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600,
                                                                  )
                                                              )
                                                            ],
                                                          )
                                                      ),
                                                      SizedBox(
                                                          width: 116,
                                                          height: 116,
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Stack(
                                                                  clipBehavior: Clip.none,
                                                                  children: [
                                                                    CircleAvatar(
                                                                        radius: 35,
                                                                        child: Image.asset('assets/images/player2.png', width: 70, height: 70)
                                                                    ),
                                                                    Positioned(
                                                                        top: -5,
                                                                        right: -5,
                                                                        child: Container(
                                                                            width: 23,
                                                                            height: 23,
                                                                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                            clipBehavior: Clip.antiAlias,
                                                                            alignment: Alignment.center,
                                                                            decoration: ShapeDecoration(
                                                                              color: const Color(0xFFFC728A),
                                                                              shape: RoundedRectangleBorder(
                                                                                  side: const BorderSide(
                                                                                      width: 2,
                                                                                      strokeAlign: BorderSide.strokeAlignOutside,
                                                                                      color: Colors.white
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(23)
                                                                              ),
                                                                            ),
                                                                            child: const Text(
                                                                              '6',
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  letterSpacing: 0.03
                                                                              ),
                                                                            )
                                                                        )
                                                                    )
                                                                  ]
                                                              ),
                                                              const SizedBox(height: 6),
                                                              const Text(
                                                                  'Alex Donk',
                                                                  textAlign: TextAlign.center,
                                                                  maxLines: 2,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontWeight: FontWeight.w600,
                                                                  )
                                                              )
                                                            ],
                                                          )
                                                      )
                                                    ]
                                                ),
                                                const SizedBox(height: 16),
                                                Container(
                                                    padding: const EdgeInsets.only(left: 16, right: 16, top: 33, bottom: 16),
                                                    clipBehavior: Clip.none,
                                                    decoration: ShapeDecoration(
                                                      color: const Color(0xFFEEF0F3),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(34)
                                                      ),
                                                    ),
                                                    child: Stack(
                                                        clipBehavior: Clip.none,
                                                        alignment: Alignment.topCenter,
                                                        children: [
                                                          Column(
                                                              children: [
                                                                ElevatedButton(
                                                                    onPressed: () async {
                                                                      final Uri uri = Uri(
                                                                          scheme: 'tel',
                                                                          path: '+1 650 298 3827'
                                                                      );

                                                                      if (!await launchUrl(uri)) {
                                                                        snackBar(error: true, text: 'Programm for calling not found');
                                                                      }
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.white,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                      fixedSize: Size(Get.width, 56),
                                                                      elevation: 0,
                                                                      alignment: Alignment.center,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(16),
                                                                          side: const BorderSide(width: 1, color: Colors.white)
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                              children: [
                                                                                const SizedBox(width: 6),
                                                                                SvgPicture.asset('assets/icons/phone.svg', semanticsLabel: 'Phone', width: 15, height: 15),
                                                                                const SizedBox(width: 12),
                                                                                Container(
                                                                                    height: 28,
                                                                                    decoration: const ShapeDecoration(
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(
                                                                                                width: 1,
                                                                                                strokeAlign: BorderSide.strokeAlignCenter,
                                                                                                color: Color(0xFFDFE1E9)
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                ),
                                                                                const SizedBox(width: 15),
                                                                                const Text(
                                                                                    '+1 650 298 3827',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF363853),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    )
                                                                                )
                                                                              ]
                                                                          ),
                                                                          const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xff7D8293))
                                                                        ]
                                                                    )
                                                                ),
                                                                const SizedBox(height: 5),
                                                                ElevatedButton(
                                                                    onPressed: () async {
                                                                      final Uri uri = Uri(
                                                                          scheme: 'mailto',
                                                                          path: 'martins8@gmail.com'
                                                                      );

                                                                      if (!await launchUrl(uri)) {
                                                                        snackBar(error: true, text: 'Programm for mail not found');
                                                                      }
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                      backgroundColor: Colors.white,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                      fixedSize: Size(Get.width, 56),
                                                                      elevation: 0,
                                                                      alignment: Alignment.center,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(16),
                                                                          side: const BorderSide(width: 1, color: Colors.white)
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                              children: [
                                                                                const SizedBox(width: 4),
                                                                                SvgPicture.asset('assets/icons/email.svg', semanticsLabel: 'Phone', width: 15, height: 13),
                                                                                const SizedBox(width: 12),
                                                                                Container(
                                                                                    height: 28,
                                                                                    decoration: const ShapeDecoration(
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: BorderSide(
                                                                                                width: 1,
                                                                                                strokeAlign: BorderSide.strokeAlignCenter,
                                                                                                color: Color(0xFFDFE1E9)
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                ),
                                                                                const SizedBox(width: 15),
                                                                                const Text(
                                                                                    'martins8@gmail.com',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF363853),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    )
                                                                                )
                                                                              ]
                                                                          ),
                                                                          const Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xff7D8293))
                                                                        ]
                                                                    )
                                                                ),
                                                              ]
                                                          ),
                                                          Positioned(
                                                              top: -40,
                                                              child: Container(
                                                                  width: 127,
                                                                  height: 23,
                                                                  clipBehavior: Clip.antiAlias,
                                                                  decoration: ShapeDecoration(
                                                                    color: const Color(0xFF363853),
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(300),
                                                                    ),
                                                                  ),
                                                                  alignment: Alignment.center,
                                                                  child: const Text(
                                                                      'It is your partner contacts',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 10,
                                                                        fontWeight: FontWeight.w600,
                                                                        letterSpacing: 0.03,
                                                                      )
                                                                  )
                                                              )
                                                          )
                                                        ]
                                                    )
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                          width: (Get.width/2)-44,
                                                          child: const Text(
                                                              'If you already played, enter the result before the timer ends',
                                                              style: TextStyle(
                                                                  color: Color(0xFF242538),
                                                                  fontSize: 11,
                                                                  letterSpacing: 0.03
                                                              )
                                                          )
                                                      ),
                                                      const Wrap(
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
                                                      )
                                                    ]
                                                ),
                                                const SizedBox(height: 8),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      Get.to(() => const EventView(join: false, step: 3, enterResult: true))?.then((value) => controller.initialize());
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: primaryColor,
                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                      fixedSize: Size(Get.width, 38),
                                                      elevation: 0,
                                                      alignment: Alignment.center,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(16),
                                                          side: const BorderSide(width: 1, color: primaryColor)
                                                      ),
                                                    ),
                                                    child: Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          const Text(
                                                              'ENTER RESULTS',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 14,
                                                                  fontFamily: 'Thunder',
                                                                  fontWeight: FontWeight.w700,
                                                                  letterSpacing: 0.84
                                                              )
                                                          ),
                                                          Align(
                                                              alignment: Alignment.centerRight,
                                                              child: Image.asset('assets/images/ball3.png', width: 20, height: 20)
                                                          )
                                                        ]
                                                    )
                                                ),
                                                const SizedBox(height: 6),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      Get.to(() => const EventView(join: false, step: 3))?.then((value) => controller.initialize());
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor: const Color(0xFFEEF0F3),
                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                      fixedSize: Size(Get.width, 38),
                                                      elevation: 0,
                                                      alignment: Alignment.center,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(16),
                                                          side: const BorderSide(width: 1, color: Color(0xFFEEF0F3))
                                                      ),
                                                    ),
                                                    child: const Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          Text(
                                                              'TOURNAMENT INFO',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                  color: Color(0xFF242538),
                                                                  fontSize: 14,
                                                                  fontFamily: 'Thunder',
                                                                  fontWeight: FontWeight.w700,
                                                                  letterSpacing: 0.84
                                                              )
                                                          ),
                                                          Align(
                                                              alignment: Alignment.centerRight,
                                                              child: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xff242538))
                                                          )
                                                        ]
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 26, bottom: 20),
                                      clipBehavior: Clip.none,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(34)
                                        ),
                                      ),
                                      child: Stack(
                                          alignment: Alignment.topCenter,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                                child: Column(
                                                    children: [
                                                      Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                                          child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                    width: 116,
                                                                    height: 116,
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Stack(
                                                                            clipBehavior: Clip.none,
                                                                            children: [
                                                                              CircleAvatar(
                                                                                  radius: 35,
                                                                                  child: Image.asset('assets/images/player1.png', width: 70, height: 70)
                                                                              ),
                                                                              Positioned(
                                                                                  top: -5,
                                                                                  right: -5,
                                                                                  child: Container(
                                                                                      width: 23,
                                                                                      height: 23,
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: ShapeDecoration(
                                                                                        color: const Color(0xFFFC728A),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: const BorderSide(
                                                                                                width: 2,
                                                                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                                                                color: Colors.white
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(23)
                                                                                        ),
                                                                                      ),
                                                                                      child: const Text(
                                                                                        '5',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(
                                                                                            color: Colors.white,
                                                                                            fontSize: 11,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            letterSpacing: 0.03
                                                                                        ),
                                                                                      )
                                                                                  )
                                                                              )
                                                                            ]
                                                                        ),
                                                                        const SizedBox(height: 6),
                                                                        const Text(
                                                                            'Provetr Martins',
                                                                            textAlign: TextAlign.center,
                                                                            maxLines: 2,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF242538),
                                                                              fontWeight: FontWeight.w600,
                                                                            )
                                                                        )
                                                                      ],
                                                                    )
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.topCenter,
                                                                    width: 42,
                                                                    height: 100,
                                                                    margin: const EdgeInsets.only(left: 10),
                                                                    child: const Column(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                    '3',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFFA4A9BD),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    ':',
                                                                                    style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 17,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: -0.41
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    '6',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF242538),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                              ]
                                                                          ),
                                                                          SizedBox(height: 8),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                    '4',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFFA4A9BD),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    ':',
                                                                                    style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 17,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: -0.41
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    '6',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF242538),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                              ]
                                                                          )
                                                                        ]
                                                                    )
                                                                ),
                                                                SizedBox(
                                                                    width: 116,
                                                                    height: 116,
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Stack(
                                                                            clipBehavior: Clip.none,
                                                                            children: [
                                                                              CircleAvatar(
                                                                                  radius: 35,
                                                                                  child: Image.asset('assets/images/player2.png', width: 70, height: 70)
                                                                              ),
                                                                              Positioned(
                                                                                  top: -5,
                                                                                  right: -5,
                                                                                  child: Container(
                                                                                      width: 23,
                                                                                      height: 23,
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: ShapeDecoration(
                                                                                        color: const Color(0xFFFC728A),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: const BorderSide(
                                                                                                width: 2,
                                                                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                                                                color: Colors.white
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(23)
                                                                                        ),
                                                                                      ),
                                                                                      child: const Text(
                                                                                        '6',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(
                                                                                            color: Colors.white,
                                                                                            fontSize: 11,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            letterSpacing: 0.03
                                                                                        ),
                                                                                      )
                                                                                  )
                                                                              )
                                                                            ]
                                                                        ),
                                                                        const SizedBox(height: 6),
                                                                        DecoratedBox(
                                                                            decoration: ShapeDecoration(
                                                                                color: const Color(0xFF70E244),
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(3000),
                                                                                )
                                                                            ),
                                                                            child: const Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 6),
                                                                                child: Text(
                                                                                    'Alex Donk',
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF242538),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    )
                                                                                )
                                                                            )
                                                                        )
                                                                      ],
                                                                    )
                                                                )
                                                              ]
                                                          )
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            Get.to(() => const EventView(join: false, step: 3))?.then((value) => controller.initialize());
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color(0xFFEEF0F3),
                                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                                            fixedSize: Size(Get.width, 38),
                                                            elevation: 0,
                                                            alignment: Alignment.center,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(16),
                                                                side: const BorderSide(width: 1, color: Color(0xFFEEF0F3))
                                                            ),
                                                          ),
                                                          child: const Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Text(
                                                                    'TOURNAMENT INFO',
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                        color: Color(0xFF242538),
                                                                        fontSize: 14,
                                                                        fontFamily: 'Thunder',
                                                                        fontWeight: FontWeight.w700,
                                                                        letterSpacing: 0.84
                                                                    )
                                                                ),
                                                                Align(
                                                                    alignment: Alignment.centerRight,
                                                                    child: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xff242538))
                                                                )
                                                              ]
                                                          )
                                                      )
                                                    ]
                                                )
                                            ),
                                            Positioned(
                                                top: -28,
                                                child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                    alignment: Alignment.center,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                        color: const Color(0xFFA4A9BD),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(300)
                                                        )
                                                    ),
                                                    child: const Text(
                                                        '15 may 2024 00:01',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03,
                                                        )
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 26, bottom: 20),
                                      clipBehavior: Clip.none,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(34)
                                        ),
                                      ),
                                      child: Stack(
                                          alignment: Alignment.topCenter,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                                child: Column(
                                                    children: [
                                                      Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                                          child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                SizedBox(
                                                                    width: 116,
                                                                    height: 116,
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Stack(
                                                                            clipBehavior: Clip.none,
                                                                            children: [
                                                                              CircleAvatar(
                                                                                  radius: 35,
                                                                                  child: Image.asset('assets/images/player1.png', width: 70, height: 70)
                                                                              ),
                                                                              Positioned(
                                                                                  top: -5,
                                                                                  right: -5,
                                                                                  child: Container(
                                                                                      width: 23,
                                                                                      height: 23,
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: ShapeDecoration(
                                                                                        color: const Color(0xFFFC728A),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: const BorderSide(
                                                                                                width: 2,
                                                                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                                                                color: Colors.white
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(23)
                                                                                        ),
                                                                                      ),
                                                                                      child: const Text(
                                                                                        '5',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(
                                                                                            color: Colors.white,
                                                                                            fontSize: 11,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            letterSpacing: 0.03
                                                                                        ),
                                                                                      )
                                                                                  )
                                                                              )
                                                                            ]
                                                                        ),
                                                                        const SizedBox(height: 6),
                                                                        const Text(
                                                                            'Provetr Martins',
                                                                            textAlign: TextAlign.center,
                                                                            maxLines: 2,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF242538),
                                                                              fontWeight: FontWeight.w600,
                                                                            )
                                                                        )
                                                                      ],
                                                                    )
                                                                ),
                                                                Container(
                                                                    alignment: Alignment.topCenter,
                                                                    width: 42,
                                                                    height: 100,
                                                                    margin: const EdgeInsets.only(left: 10),
                                                                    child: const Column(
                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                    '3',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFFA4A9BD),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    ':',
                                                                                    style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 17,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: -0.41
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    '6',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF242538),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                              ]
                                                                          ),
                                                                          SizedBox(height: 8),
                                                                          Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                    '4',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFFA4A9BD),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    ':',
                                                                                    style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontSize: 17,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: -0.41
                                                                                    )
                                                                                ),
                                                                                Text(
                                                                                    '6',
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF242538),
                                                                                      fontSize: 24,
                                                                                      fontFamily: 'Thunder',
                                                                                      fontWeight: FontWeight.w700,
                                                                                    )
                                                                                ),
                                                                              ]
                                                                          )
                                                                        ]
                                                                    )
                                                                ),
                                                                SizedBox(
                                                                    width: 116,
                                                                    height: 116,
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      children: [
                                                                        Stack(
                                                                            clipBehavior: Clip.none,
                                                                            children: [
                                                                              CircleAvatar(
                                                                                  radius: 35,
                                                                                  child: Image.asset('assets/images/player2.png', width: 70, height: 70)
                                                                              ),
                                                                              Positioned(
                                                                                  top: -5,
                                                                                  right: -5,
                                                                                  child: Container(
                                                                                      width: 23,
                                                                                      height: 23,
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      alignment: Alignment.center,
                                                                                      decoration: ShapeDecoration(
                                                                                        color: const Color(0xFFFC728A),
                                                                                        shape: RoundedRectangleBorder(
                                                                                            side: const BorderSide(
                                                                                                width: 2,
                                                                                                strokeAlign: BorderSide.strokeAlignOutside,
                                                                                                color: Colors.white
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(23)
                                                                                        ),
                                                                                      ),
                                                                                      child: const Text(
                                                                                        '6',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(
                                                                                            color: Colors.white,
                                                                                            fontSize: 11,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            letterSpacing: 0.03
                                                                                        ),
                                                                                      )
                                                                                  )
                                                                              )
                                                                            ]
                                                                        ),
                                                                        const SizedBox(height: 6),
                                                                        DecoratedBox(
                                                                            decoration: ShapeDecoration(
                                                                                color: const Color(0xFF70E244),
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(3000),
                                                                                )
                                                                            ),
                                                                            child: const Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 6),
                                                                                child: Text(
                                                                                    'Alex Donk',
                                                                                    textAlign: TextAlign.center,
                                                                                    maxLines: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    style: TextStyle(
                                                                                      color: Color(0xFF242538),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    )
                                                                                )
                                                                            )
                                                                        )
                                                                      ],
                                                                    )
                                                                )
                                                              ]
                                                          )
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () async {
                                                            Get.to(() => const EventView(join: false, step: 3))?.then((value) => controller.initialize());
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color(0xFFEEF0F3),
                                                            padding: const EdgeInsets.symmetric(horizontal: 12),
                                                            fixedSize: Size(Get.width, 38),
                                                            elevation: 0,
                                                            alignment: Alignment.center,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(16),
                                                                side: const BorderSide(width: 1, color: Color(0xFFEEF0F3))
                                                            ),
                                                          ),
                                                          child: const Stack(
                                                              alignment: Alignment.center,
                                                              children: [
                                                                Text(
                                                                    'TOURNAMENT INFO',
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                        color: Color(0xFF242538),
                                                                        fontSize: 14,
                                                                        fontFamily: 'Thunder',
                                                                        fontWeight: FontWeight.w700,
                                                                        letterSpacing: 0.84
                                                                    )
                                                                ),
                                                                Align(
                                                                    alignment: Alignment.centerRight,
                                                                    child: Icon(Icons.arrow_forward_ios_rounded, size: 15, color: Color(0xff242538))
                                                                )
                                                              ]
                                                          )
                                                      )
                                                    ]
                                                )
                                            ),
                                            Positioned(
                                                top: -28,
                                                child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                    alignment: Alignment.center,
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                        color: const Color(0xFFA4A9BD),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(300)
                                                        )
                                                    ),
                                                    child: const Text(
                                                        '15 may 2024 00:01',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w600,
                                                          letterSpacing: 0.03,
                                                        )
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  )
                                ]
                            ) :
                            const Column(
                                children: [
                                  SizedBox(height: 128),
                                  Text(
                                      'Unavailable matches',
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