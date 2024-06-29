import 'package:get/get.dart';
import '../../main.dart';
import '../../model/profile/profile_response_model.dart';

class PlayersController extends GetxController {
  Rx<ProfileResponseModel> profile = ProfileResponseModel().obs;
  RxList<String> players = <String>[].obs;

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