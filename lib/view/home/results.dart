import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hitpal/utils/constant.dart';
import '/view/home/result.dart';
import '../../controller/home/results.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultsController>(
        init: ResultsController(),
        builder: (controller) => Container(
            padding: const EdgeInsets.all(15),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            InkWell(
                                onTap: () => Get.back(),
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 40,
                                    height: 40,
                                    child: SvgPicture.asset('assets/icons/back.svg', semanticsLabel: 'Back', width: 12, height: 12)
                                )
                            ),
                            const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'Enter results',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF242538),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.41,
                                      )
                                  )
                                ]
                            )
                          ]
                      ),
                      const SizedBox(height: 16),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Obx(() => Column(
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
                                const SizedBox(height: 30),
                                Wrap(
                                    runSpacing: 24,
                                    children: List.generate(controller.results.length, (int index) => ResultView(result: controller.results[index], index: index))
                                ),
                                const SizedBox(height: 12),
                                if (controller.showPlus.value) InkWell(
                                    onTap: () => controller.addResult(),
                                    splashColor: primaryColor,
                                    radius: 25,
                                    borderRadius: BorderRadius.circular(50),
                                    child: Ink(
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFF70E244),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                        width: 50,
                                        height: 50,
                                        child: SvgPicture.asset('assets/icons/plus2.svg', semanticsLabel: 'Plus', width: 15, height: 15, fit: BoxFit.none)
                                    )
                                )
                              ]
                          ))
                      ),
                    ]
                  ),
                  Obx(() => ElevatedButton(
                      onPressed: () async {
                        controller.save();
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
                      ) : const Text(
                          'ENTER RESULTS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Thunder',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.77
                          )
                      )
                  ))
                ]
            )
        ));
  }
}