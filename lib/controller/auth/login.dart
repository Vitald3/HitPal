import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../../view/auth/code.dart';

class LoginController extends GetxController {
  RxBool submitButton = false.obs;
  PhoneController loginField = PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.US, nsn: ''));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!submitButton.value && formKey.currentState!.validate()) {
      Get.to(CodeView(phone: '+${loginField.value.countryCode}${loginField.value.nsn}', code: '111111'));
    }
  }

  PhoneNumberInputValidator? getValidator(BuildContext context) {
    List<PhoneNumberInputValidator> validators = [];
    validators.add(PhoneValidator.validMobile(context));
    return validators.isNotEmpty ? PhoneValidator.compose([
      PhoneValidator.required(context, errorText: 'Field is required'),
      PhoneValidator.validMobile(context, errorText: 'Phone is incorrect')
    ]) : null;
  }
}