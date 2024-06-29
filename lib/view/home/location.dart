import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/home/location.dart';
import '../../main.dart';
import '../../utils/constant.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: GetBuilder<LocationController>(
            init: LocationController(),
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
                    clipBehavior: Clip.none,
                    height: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                              top: Get.height / 3,
                              right: -15,
                              child: Image.asset('assets/images/crosy.png')
                          ),
                          SingleChildScrollView(
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Text(
                                        'LOCATION',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xFF232538),
                                            fontSize: 60,
                                            fontFamily: 'Thunder',
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 2.10
                                        )
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 40),
                                        child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              TextFormField(
                                                  controller: controller.locationField,
                                                  textAlign: TextAlign.center,
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
                                                    }

                                                    return null;
                                                  },
                                                  onChanged: (String val) {
                                                    controller.nextButton.value = val != '';
                                                    controller.locationVisible.value = controller.locations.where((e) => e.contains(controller.locationField.text)).isNotEmpty;

                                                    if (controller.locationVisible.value) {
                                                      prefs?.setString('location', controller.locationField.text);
                                                    }
                                                  }
                                              ),
                                              Obx(() => Visibility(
                                                  visible: controller.locationVisible.value && controller.locationField.text != '' && controller.locations.where((e) => e.contains(controller.locationField.text)).isNotEmpty,
                                                  child: Container(
                                                      width: Get.width,
                                                      height: 100,
                                                      margin: const EdgeInsets.only(top: 79),
                                                      decoration: ShapeDecoration(
                                                          color: Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(24)
                                                          )
                                                      ),
                                                      child: ListView.separated(
                                                          itemCount: controller.locations.length,
                                                          itemBuilder: (BuildContext context, int index) {
                                                            return TextButton(
                                                                onPressed: () {
                                                                  controller.locationField.text = controller.locations[index];
                                                                  controller.locationVisible.value = false;
                                                                },
                                                                child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                          controller.locations[index],
                                                                          textAlign: TextAlign.left,
                                                                          style: const TextStyle(
                                                                              color: Color(0xFF232538),
                                                                              fontWeight: FontWeight.w600,
                                                                              letterSpacing: 0.49
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            );
                                                          }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Color(0xFFE9EAF0), height: 1)
                                                      )
                                                  )
                                              ))
                                            ]
                                        )
                                    )
                                  ]
                              )
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Obx(() => ElevatedButton(
                                onPressed: () async {
                                  Get.back();
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
                                child: const Text(
                                    'SAVE',
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
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}