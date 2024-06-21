import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import '../../controller/auth/code.dart';
import '../../utils/constant.dart';

class CodeView extends StatelessWidget {
  const CodeView({super.key, required this.phone, required this.code});

  final String phone;
  final String code;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: GetBuilder<CodeController>(
            init: CodeController(phone, code),
            builder: (controller) => Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: const Color(0xFFEEF0F3),
                    titleSpacing: 0,
                    scrolledUnderElevation: 0,
                    toolbarHeight: 60,
                    title: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () => Get.back(),
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      width: 30,
                                      height: 30,
                                      child: SvgPicture.asset('assets/icons/back.svg', semanticsLabel: 'Back', width: 12, height: 12)
                                  )
                              )
                            ]
                        )
                    )
                ),
                backgroundColor: const Color(0xFFEEF0F3),
                body: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topLeft,
                            image: AssetImage('assets/images/racket.png'),
                            fit: BoxFit.none
                        )
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(child: SingleChildScrollView(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'PHONE NUMBER',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF232538),
                                        fontSize: 60,
                                        fontFamily: 'Thunder',
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2.10,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: 23,
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(300)
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Write an SMS-code',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'SF Pro Display',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.04,
                                            )
                                          )
                                        ]
                                      )
                                    ),
                                    const SizedBox(height: 30),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 30),
                                        child: VerificationCode(
                                          textStyle: const TextStyle(
                                            color: Color(0xFF363853),
                                            fontSize: 20,
                                            fontFamily: 'SF Pro Display',
                                            letterSpacing: -0.41
                                          ),
                                          keyboardType: TextInputType.number,
                                          length: 6,
                                          itemSize: 40,
                                          underlineWidth: 2,
                                          underlineColor: const Color(0xff70E244),
                                          underlineUnfocusedColor: const Color(0xFFB3B3BB),
                                          cursorColor: const Color(0xff70E244),
                                          margin: const EdgeInsets.all(3),
                                          onCompleted: (String value) {
                                            controller.verificationCode.value = value;
                                          },
                                          onEditing: (bool value) {
                                            controller.setEditing(value);
                                            if (!controller.editing.value) FocusScope.of(context).unfocus();
                                          }
                                        )
                                    )
                                  ]
                              )
                          )),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              onPressed: () async {
                                controller.next();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: controller.editing.value ? secondColor : primaryColor,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                fixedSize: Size(Get.width, 56),
                                elevation: 0,
                                alignment: Alignment.center,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: BorderSide(width: 1, color: controller.editing.value ? secondColor : primaryColor)
                                ),
                              ),
                              child: controller.submitButton.value ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(color: Colors.white)
                              ) : const Text(
                                  'NEXT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'Thunder',
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.77
                                  )
                              )
                          ),
                        ]
                    )
                )
            )
        )
    );
  }
}