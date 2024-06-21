import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../controller/register/register.dart';
import '../../utils/constant.dart';

Widget registerPhone(RegisterController controller, BuildContext context) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: PhoneFormField(
          controller: controller.phoneField,
          isCountryButtonPersistent: true,
          isCountrySelectionEnabled: true,
          autofillHints: const [AutofillHints.telephoneNumber],
          countrySelectorNavigator: const CountrySelectorNavigator.modalBottomSheet(),
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
          background: const Color(0xFFEEF0F3),
          style: const TextStyle(
              color: Color(0xFF363853),
              fontSize: 20,
              fontFamily: 'SF Pro Display',
              letterSpacing: -0.41
          ),
          countryButtonStyle: const CountryButtonStyle(
              showFlag: true,
              textStyle: TextStyle(
                  color: Color(0xFF363853),
                  fontSize: 20,
                  fontFamily: 'SF Pro Display',
                  letterSpacing: -0.41
              ),
              padding: EdgeInsets.only(left: 0, right: 14),
              showIsoCode: false,
              showDialCode: true,
              showDropdownIcon: true,
              flagSize: 24
          ),
          validator: controller.getValidator(context),
          onChanged: (PhoneNumber val) {
            controller.nextButton.value = val.isValid();
          },
          cursorColor: const Color(0xff70E244)
      )
  );
}