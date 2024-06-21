import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constant.dart';

Widget loading() {
  return Container(
      width: double.infinity,
      height: Get.height-60,
      alignment: Alignment.center,
      child: const SizedBox(
          width: 26,
          height: 26,
          child: CircularProgressIndicator(color: primaryColor)
      )
  );
}