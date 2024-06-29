import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  TextEditingController locationField = TextEditingController();
  RxBool nextButton = false.obs;
  RxBool locationVisible = false.obs;
  RxList<String> locations = <String>['San Francisco, CA', 'San Pereiro,  GB', 'San Augustinei, AB'].obs;
}