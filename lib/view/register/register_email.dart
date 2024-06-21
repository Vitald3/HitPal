import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../controller/register/register.dart';
import '../../utils/constant.dart';

Widget registerEmail(RegisterController controller) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
          controller: controller.emailField,
          decoration: const InputDecoration(
            fillColor: Colors.transparent,
            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Color(0xff70E244),
                )
            ),
            focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: dangerColor,
                )
            ),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: dangerColor,
                )
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: Color(0xff70E244)
                )
            ),
          ),
          enabled: true,
          style: const TextStyle(
              color: Color(0xFF363853),
              fontSize: 20,
              fontFamily: 'SF Pro Display',
              letterSpacing: -0.41
          ),
          validator: (String? val) {
            if (val == '') {
              return 'Field is required';
            } else if (val != '' && !EmailValidator.validate(val!)) {
              return 'Email is incorrect';
            }

            return null;
          },
          onChanged: (String val) {
            controller.nextButton.value = val != '';
          }
      )
  );
}