import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  RxBool submitButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
  }
}