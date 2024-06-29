import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/home/results.dart';

class EventController extends GetxController {
  RxBool submitButton = false.obs;
  RxBool showSuccess = false.obs;
  RxBool enterResult = false.obs;
  RxInt step = 1.obs;
  EventController(this.showSuccess, this.step, this.enterResult);

  @override
  void onInit() {
    super.onInit();

    if (step.value == 3 && enterResult.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        openResults();
      });
    }

    initialize();
  }

  Future<void> initialize() async {

  }

  Future<void> openResults() async {
    showModalBottomSheet(
        context: Get.context!,
        builder: (_) => SizedBox(
            height: MediaQuery.of(Get.context!).size.height - 40,
            child: const ResultsView()
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))
        ),
        backgroundColor: const Color(0xffEEF1F3),
        isScrollControlled: true
    );
  }

  Future<void> join() async {
    if (step.value == 3 && enterResult.value) {
      openResults();
    } else {
      showSuccess.value = true;
    }
  }
}