import 'package:get/get.dart';
import '../../model/home/result_model.dart';

class ResultsController extends GetxController {
  RxList<ResultModel> results = <ResultModel>[].obs;
  RxBool showPlus = true.obs;
  RxBool submitButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  Future<void> initialize() async {
    results.value = [
      ResultModel(player1: '5', player2: '6', status: true)
    ];

    showPlus.value = results.length < 3;
  }

  void addResult() {
    results.add(ResultModel(player1: '', player2: '', status: false));
    showPlus.value = results.length < 3;
  }

  void removeResult(int index) {
    if (!results.elementAt(index).status) {
      results.removeAt(index);
      showPlus.value = results.length < 3;
    }
  }

  Future<void> save() async {
    submitButton.value = true;
    Get.back();
    submitButton.value = false;
  }
}