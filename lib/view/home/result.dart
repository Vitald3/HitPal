import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constant.dart';
import '/controller/home/results.dart';
import '../../model/home/result_model.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.result, required this.index});

  final ResultModel result;
  final int index;

  @override
  Widget build(BuildContext context) {
    TextEditingController player1Field = TextEditingController(text: result.player1);
    TextEditingController player2Field = TextEditingController(text: result.player2);
    final ResultsController controller = Get.find<ResultsController>();

    return Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
              padding: const EdgeInsets.all(15),
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),
              alignment: Alignment.center,
              child: Transform.translate(
                  offset: const Offset(0, -4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 40,
                            height: 42,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: player1Field,
                                decoration: const InputDecoration(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.zero,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Color(0xFF242538),
                                        )
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Color(0xFFB3B3BB)
                                        )
                                    )
                                ),
                                enabled: true,
                                style: const TextStyle(
                                    color: Color(0xFF242538),
                                    fontSize: 24,
                                    fontFamily: 'Thunder',
                                    fontWeight: FontWeight.w700
                                ),
                                cursorHeight: 30
                            )
                        ),
                        const Text(
                            ':',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.41,
                            )
                        ),
                        SizedBox(
                            width: 40,
                            height: 42,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: player2Field,
                                decoration: const InputDecoration(
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.zero,
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Color(0xFF242538),
                                        )
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Color(0xFFB3B3BB)
                                        )
                                    )
                                ),
                                enabled: true,
                                style: const TextStyle(
                                    color: Color(0xFF242538),
                                    fontSize: 24,
                                    fontFamily: 'Thunder',
                                    fontWeight: FontWeight.w700
                                ),
                                cursorHeight: 30
                            )
                        )
                      ]
                  )
              )
          ),
          Positioned(
              top: -11,
              child: Container(
                  width: 47,
                  height: 23,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF242538),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(300)
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                      'Set ${index + 1}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.03
                      )
                  )
              )
          ),
          if (!result.status) Positioned(
              top: -11,
              right: -10,
              child: InkWell(
                  splashColor: primaryColor,
                  radius: 20,
                  onTap: () => controller.removeResult(index),
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    child: Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, 3)
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.close, size: 17, color: Color(0xff7D8293))
                    )
                  )
              )
          )
        ]
    );
  }
}