import 'package:get/get.dart';
import 'package:hitpal/utils/function.dart';

class CodeController extends GetxController {
  final String phone;
  final String code;
  RxBool editing = false.obs;
  RxString verificationCode = ''.obs;
  CodeController(this.phone, this.code);

  Future<void> next() async {
    if (editing.value) return;

    if (verificationCode.value == '') {
      snackBar(error: true, text: 'Enter verification code');
      return;
    }

    if (code == verificationCode.value) {
      Get.toNamed('/');
    } else {
      snackBar(error: true, text: 'Verification code error');
    }
  }

  void setEditing(bool val) {
    editing.value = val;
  }
}