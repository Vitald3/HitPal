import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controller/register/register.dart';
import '../../utils/constant.dart';

Widget registerLevel(RegisterController controller) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(() => Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => controller.setLevel(1),
                child: Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: controller.level.value == 1 ? primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.level.value == 1 ? Colors.white : const Color(0xFF242538),
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Beginner',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.level.value == 1 ? Colors.white : const Color(0xFFA4A9BD),
                            fontSize: 11
                          )
                      )
                    ],
                  ),
                )
            ),
            GestureDetector(
                onTap: () => controller.setLevel(2),
                child: Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: controller.level.value == 2 ? primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.level.value == 2 ? Colors.white : const Color(0xFF242538),
                          fontSize: 18,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Training Partner',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: controller.level.value == 2 ? Colors.white : const Color(0xFFA4A9BD),
                            fontSize: 11
                          )
                      )
                    ],
                  ),
                )
            ),
            GestureDetector(
                onTap: () => controller.setLevel(3),
                child: Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: controller.level.value == 3 ? primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.level.value == 3 ? Colors.white : const Color(0xFF242538),
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Training Partner',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: controller.level.value == 3 ? Colors.white : const Color(0xFFA4A9BD),
                              fontSize: 11
                          )
                      )
                    ],
                  ),
                )
            ),
            GestureDetector(
                onTap: () => controller.setLevel(4),
                child: Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: controller.level.value == 4 ? primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.level.value == 4 ? Colors.white : const Color(0xFF242538),
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Competitor',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: controller.level.value == 4 ? Colors.white : const Color(0xFFA4A9BD),
                              fontSize: 11
                          )
                      )
                    ],
                  ),
                )
            ),
            GestureDetector(
                onTap: () => controller.setLevel(5),
                child: Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: controller.level.value == 5 ? primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.level.value == 5 ? Colors.white : const Color(0xFF242538),
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Tournament Player',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: controller.level.value == 5 ? Colors.white : const Color(0xFFA4A9BD),
                              fontSize: 11
                          )
                      )
                    ],
                  ),
                )
            ),
            GestureDetector(
                onTap: () => controller.setLevel(6),
                child: Container(
                  width: 88,
                  height: 88,
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: controller.level.value == 6 ? primaryColor : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: controller.level.value == 6 ? Colors.white : const Color(0xFF242538),
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                          'Tournament Guru',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: controller.level.value == 6 ? Colors.white : const Color(0xFFA4A9BD),
                              fontSize: 11
                          )
                      )
                    ],
                  ),
                )
            )
          ]
      ))
  );
}