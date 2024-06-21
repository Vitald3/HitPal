import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../../model/profile/profile_response_model.dart';

class HomeController extends GetxController {
  RxBool submitButton = false.obs;
  Rx<ProfileResponseModel> profile = ProfileResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();

    profile.value = ProfileResponseModel(firstName: 'Simon', lastName: 'Polozov', location: 'New-York, WS');
  }
}