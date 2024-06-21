import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '/utils/constant.dart';
import '../../controller/register/register.dart';

Widget registerGender(RegisterController controller) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Obx(() => Column(
        children: [
          GestureDetector(
              onTap: () => controller.setGender('male'),
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: ShapeDecoration(
                      color: controller.gender.value == 'male' ? primaryColor : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                  child: Row(
                      children: [
                        Image.asset('assets/images/male.png', width: 38, height: 38),
                        const SizedBox(width: 11),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: controller.gender.value == 'male' ? Colors.white : const Color(0xFF232538),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.49,
                          ),
                        ),
                      ]
                  )
              )
          ),
          const SizedBox(height: 6),
          GestureDetector(
              onTap: () => controller.setGender('female'),
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: ShapeDecoration(
                      color: controller.gender.value == 'female' ? primaryColor : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                  child: Row(
                      children: [
                        Image.asset('assets/images/female.png', width: 38, height: 38),
                        const SizedBox(width: 11),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: controller.gender.value == 'female' ? Colors.white : const Color(0xFF232538),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.49,
                          ),
                        ),
                      ]
                  )
              )
          ),
          const SizedBox(height: 6),
          GestureDetector(
              onTap: () => controller.setGender('other'),
              child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: ShapeDecoration(
                      color: controller.gender.value == 'other' ? primaryColor : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                      )
                  ),
                  child: Row(
                      children: [
                        Image.asset('assets/images/other.png', width: 38, height: 38),
                        const SizedBox(width: 11),
                        Text(
                          'Other / Prefer not to say',
                          style: TextStyle(
                            color: controller.gender.value == 'other' ? Colors.white : const Color(0xFF232538),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.49,
                          ),
                        ),
                      ]
                  )
              )
          )
        ]
    ))
  );
}