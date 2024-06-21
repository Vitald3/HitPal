import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/constant.dart';
import 'package:intl/intl.dart';
import '../../controller/onboard/onboard.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
        init: OnboardController(),
        builder: (controller) => Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.bottomLeft,
                        image: AssetImage('assets/images/onboard_bg_1.png'),
                        fit: BoxFit.none
                    )
                ),
                child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                    'FIND YOUR',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Thunder',
                                        fontSize: 80,
                                        height: 0.95,
                                        fontWeight: FontWeight.w600
                                    )
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                          'FIRST',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Thunder',
                                              fontSize: 80,
                                              height: 0.95,
                                              fontWeight: FontWeight.w600
                                          )
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(bottom: 12),
                                          child: Image.asset('assets/images/ball.png')
                                      ),
                                      const SizedBox(width: 4),
                                      const Text(
                                          'REAL',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Thunder',
                                              fontSize: 80,
                                              height: 0.95,
                                              fontWeight: FontWeight.w600
                                          )
                                      )
                                    ]
                                ),
                                const Text(
                                    'TENNIS',
                                    style: TextStyle(
                                        color: Color(0xffA7F821),
                                        fontFamily: 'Thunder',
                                        fontSize: 80,
                                        height: 0.95,
                                        fontWeight: FontWeight.w600
                                    )
                                ),
                                const Text(
                                    'PARTNER',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Thunder',
                                        fontSize: 80,
                                        height: 0.95,
                                        fontWeight: FontWeight.w600
                                    )
                                )
                              ]
                          )
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                    height: 25,
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          Get.offNamed('/onboard_2');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          elevation: 0,
                                          alignment: Alignment.center,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(300),
                                              side: const BorderSide(width: 1, color: Colors.white)
                                          ),
                                        ),
                                        child: const Text(
                                            'Find a partner',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 9,
                                                fontWeight: FontWeight.w600
                                            )
                                        )
                                    )
                                ),
                                const SizedBox(width: 10),
                                Text(
                                    DateFormat('y').format(DateTime.now()),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600
                                    )
                                )
                              ]
                          )
                      )
                    ]
                )
            ))
        )
    );
  }
}