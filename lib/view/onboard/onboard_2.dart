import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '/utils/constant.dart';

class Onboard2View extends StatelessWidget {
  const Onboard2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage('assets/images/onboard_2.png'),
                      fit: BoxFit.none
                  )
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                              children: [
                                const SizedBox(height: 26),
                                const Text(
                                    'How it works',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Thunder',
                                        fontSize: 60,
                                        fontWeight: FontWeight.w600
                                    )
                                ),
                                const SizedBox(height: 25),
                                Row(
                                    children: [
                                      SizedBox(
                                          width: 20,
                                          child: Stack(
                                              alignment: Alignment.topCenter,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Image.asset('assets/images/line.png'),
                                                Transform.translate(
                                                  offset: const Offset(0, -6),
                                                  child: SvgPicture.asset('assets/icons/check.svg', semanticsLabel: 'Check', width: 20, height: 20),
                                                ),
                                                Positioned(
                                                  top: 86,
                                                  child: SvgPicture.asset('assets/icons/check.svg', semanticsLabel: 'Check', width: 20, height: 20),
                                                ),
                                                Positioned(
                                                  top: 181,
                                                  child: SvgPicture.asset('assets/icons/check.svg', semanticsLabel: 'Check', width: 20, height: 20),
                                                ),
                                                Positioned(
                                                  top: 274,
                                                  child: SvgPicture.asset('assets/icons/check.svg', semanticsLabel: 'Check', width: 20, height: 20),
                                                )
                                              ]
                                          )
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                          child: Column(
                                              children: [
                                                Container(
                                                    decoration: ShapeDecoration(
                                                      color: const Color(0xFF6F56F5),
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
                                                          Image.asset('assets/images/icon1.png'),
                                                          const SizedBox(width: 11),
                                                          const Expanded(child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                    'Join the Event',
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w600,
                                                                      letterSpacing: 0.49,
                                                                    )
                                                                ),
                                                                SizedBox(height: 2),
                                                                SizedBox(
                                                                    width: 240,
                                                                    child: Text(
                                                                        'Register each week to get in the game.',
                                                                        style: TextStyle(
                                                                            color: Colors.white,
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
                                                      color: const Color(0xFF6F56F5),
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
                                                          Image.asset('assets/images/icon2.png'),
                                                          const SizedBox(width: 11),
                                                          const Expanded(child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                    'Meet Your Match',
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w600,
                                                                      letterSpacing: 0.49,
                                                                    )
                                                                ),
                                                                SizedBox(height: 2),
                                                                SizedBox(
                                                                    width: 240,
                                                                    child: Text(
                                                                        'We\'ll pair you with a partner that matches your skill level and location.',
                                                                        style: TextStyle(
                                                                            color: Colors.white,
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
                                                      color: const Color(0xFF6F56F5),
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
                                                          Image.asset('assets/images/icon3.png'),
                                                          const SizedBox(width: 11),
                                                          const Expanded(child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                    'Set the Time',
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w600,
                                                                      letterSpacing: 0.49,
                                                                    )
                                                                ),
                                                                SizedBox(height: 2),
                                                                SizedBox(
                                                                    width: 240,
                                                                    child: Text(
                                                                        'Contact your partner to arrange the best time to play.',
                                                                        style: TextStyle(
                                                                            color: Colors.white,
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
                                                      color: const Color(0xFF6F56F5),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(24)
                                                      ),
                                                    ),
                                                    height: 88,
                                                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4.5),
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                        children: [
                                                          Image.asset('assets/images/icon4.png'),
                                                          const SizedBox(width: 11),
                                                          const Expanded(child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                    'Play and Record',
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w600,
                                                                      letterSpacing: 0.49,
                                                                    )
                                                                ),
                                                                SizedBox(height: 2),
                                                                SizedBox(
                                                                    child: Text(
                                                                        'Hit the courts and enjoy your match! Don’t forget to enter the results in the app.',
                                                                        style: TextStyle(
                                                                            color: Colors.white,
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
                                )
                              ]
                          ),
                        )
                    ),
                    Column(
                        children: [
                          const SizedBox(height: 16),
                          ElevatedButton(
                              onPressed: () async {
                                Get.toNamed('/register');
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
                              child: const Text(
                                  'SIGN UP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFF6149E0),
                                      fontSize: 22,
                                      fontFamily: 'Thunder',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.77
                                  )
                              )
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                              onPressed: () async {
                                Get.toNamed('/login');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff7B63FA),
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                fixedSize: Size(Get.width, 56),
                                elevation: 0,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: const BorderSide(width: 1, color: const Color(0xff7B63FA))
                                ),
                              ),
                              child: const Text(
                                  'SIGN IN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Thunder',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.77
                                  )
                              )
                          )
                        ]
                    )
                  ]
              )
          )
        )
    );
  }
}