import 'package:get/get.dart';
import '../../main.dart';
import '../../model/profile/profile_response_model.dart';

class MatchesController extends GetxController {
  RxBool submitButton = false.obs;
  Rx<ProfileResponseModel> profile = ProfileResponseModel().obs;
  RxList<String> matches = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  Future<void> initialize() async {
    if (auth.currentUser != null) {
      profile.value = ProfileResponseModel(firstName: auth.currentUser!.displayName ?? 'User', lastName: '', location: prefs?.getString('location'));
    }
  }
}