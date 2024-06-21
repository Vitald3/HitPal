import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import '../../controller/register/register.dart';
import '../../utils/constant.dart';

Widget registerCode(RegisterController controller, BuildContext context) {
  return Column(
      children: [
        Transform.translate(
          offset: const Offset(0, -30),
          child: Container(
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
        ),
        const SizedBox(height: 20),
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
                  controller.next();
                  controller.stopTimer();
                },
                onEditing: (bool value) {
                  controller.setEditing(value);
                  if (!controller.editing.value) FocusScope.of(context).unfocus();
                }
            )
        ),
      ]
  );
}