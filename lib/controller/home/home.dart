import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../model/profile/profile_response_model.dart';

class HomeController extends GetxController {
  RxBool submitButton = false.obs;
  RxBool closeInfoBlock = (prefs?.getBool('infoBlock') ?? false).obs;
  Rx<ProfileResponseModel> profile = ProfileResponseModel().obs;
  RxList<String> events = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
    initialize();
  }

  Future<void> initialize() async {
    if (auth.currentUser != null) {
      profile.value = ProfileResponseModel(firstName: auth.currentUser!.displayName ?? 'User', lastName: '', location: prefs?.getString('location'));
    }
  }

  void closeInfo() {
    prefs?.setBool('infoBlock', true);
    closeInfoBlock.value = true;
  }
}