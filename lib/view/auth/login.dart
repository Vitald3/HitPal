import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../controller/auth/login.dart';
import '../../utils/constant.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: GetBuilder<LoginController>(
            init: LoginController(),
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
                            child: Form(
                                key: controller.formKey,
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
                                      const SizedBox(height: 30),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 40),
                                          child: PhoneFormField(
                                              controller: controller.loginField,
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
                                              cursorColor: const Color(0xff70E244)
                                          )
                                      )
                                    ]
                                )
                            )
                        )),
                        const SizedBox(height: 15),
                        ElevatedButton(
                            onPressed: () async {
                              controller.login();
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