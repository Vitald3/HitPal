import 'package:get/get.dart';
import '/utils/function.dart';
import '../../main.dart';

class CodeController extends GetxController {
  final String phone;
  final String code;
  RxBool editing = false.obs;
  RxString verificationCode = ''.obs;
  RxBool submitButton = false.obs;
  CodeController(this.phone, this.code);

  Future<void> next() async {
    if (editing.value) return;

    if (verificationCode.value == '') {
      snackBar(error: true, text: 'Enter verification code');
      return;
    }

    if (code == verificationCode.value) {
      prefs?.setString('token', '1234');
      Get.toNamed('/');
    } else {
      snackBar(error: true, text: 'Verification code error');
    }
  }

  void setEditing(bool val) {
    editing.value = val;
  }
}