import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '/view/register/register_age.dart';
import '/view/register/register_code.dart';
import '/view/register/register_email.dart';
import '/view/register/register_gender.dart';
import '/view/register/register_level.dart';
import '/view/register/register_location.dart';
import '/view/register/register_name.dart';
import '/view/register/register_phone.dart';
import '/view/register/register_photo.dart';
import '../../controller/register/register.dart';
import '../../utils/constant.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: GetBuilder<RegisterController>(
            init: RegisterController(),
            builder: (controller) => Scaffold(
                appBar: AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: const Color(0xFFEEF0F3),
                    titleSpacing: 0,
                    scrolledUnderElevation: 0,
                    toolbarHeight: 60,
                    title: Obx(() => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () => controller.back(),
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    width: 30,
                                    height: 30,
                                    child: SvgPicture.asset('assets/icons/back.svg', semanticsLabel: 'Back', width: 12, height: 12)
                                )
                            ),
                            SliderTheme(
                                data: const SliderThemeData(
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 5,
                                        elevation: 0,
                                        pressedElevation: 0
                                    ),
                                    trackHeight: 2,
                                    overlayColor: Colors.transparent,
                                    activeTrackColor: Colors.black,
                                    inactiveTrackColor: Color(0xFFD1D6EA),
                                    thumbColor: Colors.black
                                ),
                                child: Slider(
                                  value: controller.page.value.toDouble(),
                                  max: 8,
                                  min: 0,
                                  onChanged: (double value) {
                                    int page = value.toInt();

                                    if (page < controller.page.value || page <= controller.pageSuccess.value) {
                                      controller.setPage(page);
                                      controller.pageController.animateToPage(page, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
                                      controller.nextButton.value = true;
                                    }
                                  }
                                )
                            ),
                            Text(
                                '${controller.pageStr}/9',
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: 0.56
                                )
                            )
                          ]
                      )
                    ))
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
                    clipBehavior: Clip.none,
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          top: Get.height / 3,
                          right: -15,
                          child: Image.asset('assets/images/crosy.png')
                        ),
                        Obx(() => Column(
                            children: [
                              Expanded(child: PageView.builder(
                                  itemCount: 9,
                                  physics: !controller.nextButton.value ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
                                  padEnds: false,
                                  allowImplicitScrolling: true,
                                  controller: controller.pageController,
                                  onPageChanged: (int index) {
                                    controller.setPage(index);
                                  },
                                  itemBuilder: (BuildContext context, int index) {
                                    String title = '';
                                    Widget? widget;

                                    switch (index) {
                                      case 0:
                                        title = 'YOUR NAME';
                                        widget = registerName(controller);

                                        break;
                                      case 1:
                                        title = 'GENDER';
                                        widget = registerGender(controller);

                                        break;
                                      case 2:
                                        title = 'AGE';
                                        widget = registerAge(controller);

                                        break;
                                      case 3:
                                        title = 'LOCATION';
                                        widget = registerLocation(controller);

                                        break;
                                      case 4:
                                        title = 'EMAIL';
                                        widget = registerEmail(controller);

                                        break;
                                      case 5:
                                        title = 'YOUR LEVEL';
                                        widget = registerLevel(controller);

                                        break;
                                      case 6:
                                        title = 'PHONE NUMBER';
                                        widget = registerPhone(controller, context);

                                        break;
                                      case 7:
                                        title = 'PHONE NUMBER';
                                        widget = registerCode(controller, context);

                                        break;
                                      case 8:
                                        title = 'PROFILE PHOTO';
                                        widget = registerPhoto(controller, context);

                                        break;
                                      default:
                                        break;
                                    }

                                    return SingleChildScrollView(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                                title,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Color(0xFF232538),
                                                    fontSize: 60,
                                                    fontFamily: 'Thunder',
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 2.10
                                                )
                                            ),
                                            const SizedBox(height: 20),
                                            widget ?? const SizedBox()
                                          ]
                                      )
                                    );
                                  }
                              )),
                              const SizedBox(height: 15),
                              controller.page.value < 7 || controller.page.value == 8 || controller.page.value == 7 && controller.verificationCode.value.length == 6 ? Obx(() => ElevatedButton(
                                  onPressed: () async {
                                    controller.next();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: !controller.nextButton.value ? secondColor : primaryColor,
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    fixedSize: Size(Get.width, 56),
                                    elevation: 0,
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        side: BorderSide(width: 1, color: !controller.nextButton.value ? secondColor : primaryColor)
                                    ),
                                  ),
                                  child: controller.submitButton.value ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(color: Colors.white)
                                  ) : Text(
                                      controller.page.value == 8 ? 'REGISTER' : 'NEXT',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontFamily: 'Thunder',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.77
                                      )
                                  )
                              )) :
                              Column(
                                  children: [
                                    if (controller.count.value > 0) Text(
                                      'Send again in ${controller.strCount.value} seс',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Color(0xFF73737C),
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.04
                                      ),
                                    ),
                                    if (controller.count.value > 0) const SizedBox(height: 10),
                                    ElevatedButton(
                                        onPressed: () async {
                                          controller.reSend();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(horizontal: 12),
                                          fixedSize: const Size(165, 38),
                                          elevation: 0,
                                          alignment: Alignment.center,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16),
                                              side: const BorderSide(width: 1, color: Colors.white)
                                          ),
                                        ),
                                        child: controller.submitButton.value ? const SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: CircularProgressIndicator(color: Colors.white)
                                        ) : Text(
                                            'SEND',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: !controller.nextButton.value ? const Color(0xff624AE0).withOpacity(.5) : const Color(0xff624AE0),
                                                fontSize: 14,
                                                fontFamily: 'Thunder',
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 0.77
                                            )
                                        )
                                    )
                                  ]
                              )
                            ]
                        ))
                      ]
                    )
                )
            )
        )
    );
  }
}