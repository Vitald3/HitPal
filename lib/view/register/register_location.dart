import 'package:flutter/material.dart';
import '../../controller/register/register.dart';
import '../../utils/constant.dart';
import 'package:get/get.dart';

Widget registerLocation(RegisterController controller) {
  return Padding(
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
  );
}