import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hitpal/utils/function.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/home/event.dart';
import '../../utils/constant.dart';

class EventView extends StatelessWidget {
  const EventView({super.key, required this.join, required this.step, this.enterResult});

  final bool join;
  final int step;
  final bool? enterResult;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
        init: EventController(join.obs, step.obs, (enterResult ?? false).obs),
        builder: (controller) => Scaffold(
            backgroundColor: const Color(0xff624AE0),
            body: Stack(
                children: [
                  Positioned(
                      top: 86,
                      left: -7,
                      child: Image.asset('assets/images/event_back.png', width: 52, height: 52)
                  ),
                  Positioned(
                      top: 48,
                      right: -26,
                      child: Image.asset('assets/images/event_back2.png', width: 110, height: 110)
                  ),
                  SafeArea(
                      child: Stack(
                        children: [
                          CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                    automaticallyImplyLeading: false,
                                    elevation: 0,
                                    titleSpacing: 0,
                                    scrolledUnderElevation: 0,
                                    expandedHeight: 161,
                                    backgroundColor: Colors.transparent,
                                    floating: false,
                                    flexibleSpace: FlexibleSpaceBar(
                                        collapseMode: CollapseMode.none,
                                        background: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(left: 10, top: 11),
                                                      child: InkWell(
                                                          onTap: () => Get.back(),
                                                          child: Container(
                                                              alignment: Alignment.center,
                                                              width: 40,
                                                              height: 40,
                                                              child: SvgPicture.asset('assets/icons/back.svg', colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn), semanticsLabel: 'Back', width: 12, height: 12)
                                                          )
                                                      )
                                                  )
                                              ),
                                              Column(
                                                  children: [
                                                    const SizedBox(height: 43),
                                                    Container(
                                                        width: 63,
                                                        height: 23,
                                                        clipBehavior: Clip.antiAlias,
                                                        decoration: ShapeDecoration(
                                                          color: Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(300)
                                                          ),
                                                        ),
                                                        alignment: Alignment.center,
                                                        child: const Text(
                                                            'Weekly',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Color(0xFF6149E0),
                                                                fontWeight: FontWeight.w600,
                                                                letterSpacing: 0.04
                                                            )
                                                        )
                                                    ),
                                                    const SizedBox(height: 12),
                                                    const Text(
                                                      '#307',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 60,
                                                          fontFamily: 'Thunder',
                                                          fontWeight: FontWeight.w700,
                                                          height: 0,
                                                          letterSpacing: 2.10
                                                      ),
                                                    ),
                                                    const SizedBox(height: 28)
                                                  ]
                                              )
                                            ]
                                        )
                                    )
                                ),
                                SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                                  return Container(
                                      padding: const EdgeInsets.symmetric(vertical: 25),
                                      decoration: const ShapeDecoration(
                                        color: Color(0xffEEF0F3),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)
                                          ),
                                        ),
                                      ),
                                      child: Obx(() => Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 25),
                                              child: Column(
                                                children: [
                                                  Row(
                                                      children: [
                                                        Transform.translate(
                                                          offset: const Offset(-8, 0),
                                                          child: SizedBox(
                                                              width: 20,
                                                              height: 288,
                                                              child: Stack(
                                                                  alignment: Alignment.topCenter,
                                                                  clipBehavior: Clip.none,
                                                                  children: [
                                                                    Image.asset('assets/images/line2.png', height: 90),
                                                                    Positioned(
                                                                        top: 100,
                                                                        child: Image.asset('assets/images/line2.png', height: 85)
                                                                    ),
                                                                    Positioned(
                                                                        top: 196,
                                                                        child: Image.asset('assets/images/line2.png', height: 83)
                                                                    ),
                                                                    Transform.translate(
                                                                      offset: const Offset(0, -6),
                                                                      child: SvgPicture.asset('assets/icons/check.svg', semanticsLabel: 'Check', width: 21, height: 21),
                                                                    ),
                                                                    Positioned(
                                                                      top: 86,
                                                                      child: SvgPicture.asset('assets/icons/${controller.step.value >= 2 ? 'check' : 'time'}.svg', semanticsLabel: 'Time', width: 20, height: 20),
                                                                    ),
                                                                    Positioned(
                                                                      top: 181,
                                                                      child: SvgPicture.asset('assets/icons/${controller.step.value >= 3 ? 'check' : 'time'}.svg', semanticsLabel: 'Time', width: 20, height: 20),
                                                                    ),
                                                                    Positioned(
                                                                      top: 274,
                                                                      child: SvgPicture.asset('assets/icons/${controller.step.value >= 4 ? 'check' : 'time'}.svg', semanticsLabel: 'Time', width: 20, height: 20),
                                                                    )
                                                                  ]
                                                              )
                                                          ),
                                                        ),
                                                        const SizedBox(width: 4),
                                                        Expanded(
                                                            child: Column(
                                                                children: [
                                                                  Container(
                                                                      decoration: ShapeDecoration(
                                                                        color: Colors.white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(24)
                                                                        ),
                                                                      ),
                                                                      margin: const EdgeInsets.only(bottom: 5),
                                                                      height: 88,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.5),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          children: [
                                                                            Image.asset('assets/images/icon7.png', width: 38, height: 38),
                                                                            const SizedBox(width: 11),
                                                                            const Expanded(child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                      'Registration start',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xFF232538),
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: 0.49,
                                                                                      )
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                  SizedBox(
                                                                                      width: 240,
                                                                                      child: Text(
                                                                                          '10 may 2024 00:01',
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF73737C),
                                                                                              fontSize: 13,
                                                                                              letterSpacing: 0.04
                                                                                          )
                                                                                      )
                                                                                  )
                                                                                ]
                                                                            ))
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
                                                                      margin: const EdgeInsets.only(bottom: 5),
                                                                      height: 88,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.5),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          children: [
                                                                            Image.asset('assets/images/icon7.png', width: 38, height: 38),
                                                                            const SizedBox(width: 11),
                                                                            const Expanded(child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                      'Registration finish',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xFF232538),
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: 0.49,
                                                                                      )
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                  SizedBox(
                                                                                      width: 240,
                                                                                      child: Text(
                                                                                          '15 may 2024 00:01',
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF73737C),
                                                                                              fontSize: 13,
                                                                                              letterSpacing: 0.04
                                                                                          )
                                                                                      )
                                                                                  )
                                                                                ]
                                                                            ))
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
                                                                      margin: const EdgeInsets.only(bottom: 5),
                                                                      height: 88,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.5),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          children: [
                                                                            Image.asset('assets/images/icon5.png', width: 38, height: 38),
                                                                            const SizedBox(width: 11),
                                                                            const Expanded(child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                      'Event start',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xFF232538),
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: 0.49,
                                                                                      )
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                  SizedBox(
                                                                                      width: 240,
                                                                                      child: Text(
                                                                                          '15 may 2024 00:01',
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF73737C),
                                                                                              fontSize: 13,
                                                                                              letterSpacing: 0.04
                                                                                          )
                                                                                      )
                                                                                  )
                                                                                ]
                                                                            ))
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
                                                                      height: 88,
                                                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.5),
                                                                      alignment: Alignment.center,
                                                                      child: Row(
                                                                          children: [
                                                                            Image.asset('assets/images/icon6.png', width: 38, height: 38),
                                                                            const SizedBox(width: 11),
                                                                            const Expanded(child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                      'Event finish',
                                                                                      style: TextStyle(
                                                                                        color: Color(0xFF232538),
                                                                                        fontSize: 14,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        letterSpacing: 0.49,
                                                                                      )
                                                                                  ),
                                                                                  SizedBox(height: 2),
                                                                                  SizedBox(
                                                                                      child: Text(
                                                                                          '23 may 2024 00:01',
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFF73737C),
                                                                                              fontSize: 13,
                                                                                              letterSpacing: 0.01
                                                                                          )
                                                                                      )
                                                                                  )
                                                                                ]
                                                                            ))
                                                                          ]
                                                                      )
                                                                  )
                                                                ]
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(height: 29),
                                                ]
                                              )
                                            ),
                                            if (controller.step.value == 1 && controller.showSuccess.value) Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: ShapeDecoration(
                                                    color: const Color(0xFF65E16A),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(34),
                                                    )
                                                ),
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(bottom: 24),
                                                padding: const EdgeInsets.only(top: 20, left: 25, bottom: 30, right: 25),
                                                child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      const Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'You have successfully registered!',
                                                              style: TextStyle(
                                                                  color: Color(0xFF242538),
                                                                  fontWeight: FontWeight.w600
                                                              ),
                                                            ),
                                                            SizedBox(height: 6),
                                                            SizedBox(
                                                              width: 258,
                                                              child: Text(
                                                                'Now, you need to wait until the registration ends. Once the event starts, you will receive your partner’s contact information.',
                                                                style: TextStyle(
                                                                    color: Color(0xFF242538),
                                                                    fontSize: 13,
                                                                    letterSpacing: 0.04
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                      ),
                                                      Positioned(
                                                          top: -6,
                                                          right: -6,
                                                          child: Container(
                                                            width: 24,
                                                            height: 24,
                                                            decoration: const BoxDecoration(
                                                              image: DecorationImage(image: AssetImage('assets/images/reg.png'))
                                                            ),
                                                          )
                                                      )
                                                    ]
                                                )
                                            ),
                                            if (controller.step.value == 1) Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 25),
                                              child: Column(
                                                children: [
                                                  Divider(thickness: 1, height: 1, color: const Color(0xFFC8CBD9).withOpacity(0.4)),
                                                  const SizedBox(height: 14),
                                                  const Row(
                                                      children: [
                                                        Text(
                                                            'PLAYERS',
                                                            style: TextStyle(
                                                                color: Color(0xFF242538),
                                                                fontSize: 50,
                                                                fontFamily: 'Thunder',
                                                                fontWeight: FontWeight.w700,
                                                                letterSpacing: 1.75
                                                            )
                                                        ),
                                                        Text(
                                                            '14',
                                                            style: TextStyle(
                                                                color: Color(0xFFBFC3D1),
                                                                fontSize: 50,
                                                                fontFamily: 'Thunder',
                                                                fontWeight: FontWeight.w700,
                                                                letterSpacing: 1.75
                                                            )
                                                        )
                                                      ]
                                                  ),
                                                  const SizedBox(height: 14),
                                                  Wrap(
                                                      runSpacing: 5,
                                                      children: [
                                                        Container(
                                                            decoration: ShapeDecoration(
                                                              color: Colors.white,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(24)
                                                              ),
                                                            ),
                                                            padding: const EdgeInsets.all(12),
                                                            child: Stack(
                                                                children: [
                                                                  Positioned(
                                                                    top: 0,
                                                                    right: 0,
                                                                    child: Container(
                                                                        alignment: Alignment.center,
                                                                        decoration: ShapeDecoration(
                                                                          color: const Color(0xFF70E244),
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(23)
                                                                          ),
                                                                        ),
                                                                        width: 23,
                                                                        height: 23,
                                                                        child: const Text(
                                                                            '1',
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
                                                            padding: const EdgeInsets.all(12),
                                                            child: Stack(
                                                                children: [
                                                                  Positioned(
                                                                    top: 0,
                                                                    right: 0,
                                                                    child: Container(
                                                                        alignment: Alignment.center,
                                                                        decoration: ShapeDecoration(
                                                                          color: const Color(0xFFFCAB72),
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(23)
                                                                          ),
                                                                        ),
                                                                        width: 23,
                                                                        height: 23,
                                                                        child: const Text(
                                                                            '3',
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
                                                            padding: const EdgeInsets.all(12),
                                                            child: Stack(
                                                                children: [
                                                                  Positioned(
                                                                    top: 0,
                                                                    right: 0,
                                                                    child: Container(
                                                                        alignment: Alignment.center,
                                                                        decoration: ShapeDecoration(
                                                                          color: const Color(0xFFFC728A),
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(23)
                                                                          ),
                                                                        ),
                                                                        width: 23,
                                                                        height: 23,
                                                                        child: const Text(
                                                                            '5',
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
                                                                      children: [
                                                                        Image.asset('assets/images/player2.png', width: 46, height: 46),
                                                                        const SizedBox(width: 13),
                                                                        Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              const Text(
                                                                                'Kirke Hendricks',
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
                                                                  )
                                                                ]
                                                            )
                                                        ),
                                                      ]
                                                  ),
                                                  const SizedBox(height: 66)
                                                ]
                                              )
                                            ),
                                            if (controller.step.value == 3) Column(
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
                                                    child: Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 25),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      const Text(
                                                                          'Your partner',
                                                                          style: TextStyle(
                                                                            color: Color(0xFF242538),
                                                                            fontWeight: FontWeight.w600,
                                                                          )
                                                                      ),
                                                                      Image.asset('assets/images/ball.png', width: 24, height: 24)
                                                                    ]
                                                                ),
                                                                const SizedBox(height: 10),
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
                                                                const SizedBox(height: 16),
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
                                                                      backgroundColor: const Color(0xFFEEF0F3),
                                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                      fixedSize: Size(Get.width, 56),
                                                                      elevation: 0,
                                                                      alignment: Alignment.center,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(16),
                                                                          side: const BorderSide(width: 1, color: Color(0xFFEEF0F3))
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
                                                                      backgroundColor: const Color(0xFFEEF0F3),
                                                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                                                      fixedSize: Size(Get.width, 56),
                                                                      elevation: 0,
                                                                      alignment: Alignment.center,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(16),
                                                                          side: const BorderSide(width: 1, color: Color(0xFFEEF0F3))
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
                                                                const SizedBox(height: 10)
                                                              ]
                                                            )
                                                          ),
                                                          Divider(thickness: 1, height: 32, color: const Color(0xFFC8CBD9).withOpacity(0.4)),
                                                          const SizedBox(
                                                              width: 322,
                                                              child: Text(
                                                                  'Contact your partner to arrange the best time to play. After the match, don’t forget to enter the results in the app.',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF73737C),
                                                                    fontSize: 13,
                                                                    letterSpacing: 0.04,
                                                                  )
                                                              )
                                                          ),
                                                        ]
                                                    )
                                                ),
                                                const SizedBox(height: 31),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                                  child: Divider(thickness: 1, height: 1, color: const Color(0xFFC8CBD9).withOpacity(0.4)),
                                                ),
                                                const SizedBox(height: 71),
                                              ]
                                            )
                                          ]
                                      ))
                                  );
                                }, childCount: 1))
                              ]
                          ),
                          Obx(() => Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: controller.showSuccess.value ? Container(
                                  height: 56,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF70E244),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(width: 1, color: Color(0xffEEF0F3))
                                    ),
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/icons/check_white.svg', semanticsLabel: 'Check', width: 20, height: 20),
                                        const SizedBox(width: 4),
                                        Transform.translate(
                                          offset: const Offset(0, 2),
                                          child: const Text(
                                              'PARTICIPATING',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Thunder',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w700,
                                                  letterSpacing: 0.77
                                              )
                                          )
                                        )
                                      ]
                                  )
                              ) : ElevatedButton(
                                  onPressed: () async {
                                    controller.join();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    fixedSize: Size(Get.width, 56),
                                    elevation: 0,
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        side: const BorderSide(width: 1, color: primaryColor)
                                    ),
                                  ),
                                  child: controller.submitButton.value ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(color: Colors.white)
                                  ) : Text(
                                      controller.step.value == 3 ? 'ENTER RESULTS' : 'JOIN',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontFamily: 'Thunder',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.77
                                      )
                                  )
                              )
                            )
                          ))
                        ]
                      )
                  )
                ]
            )
        )
    );
  }
}