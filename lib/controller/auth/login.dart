import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hitpal/utils/function.dart';
import 'package:phone_form_field/phone_form_field.dart';

class LoginController extends GetxController {
  RxBool submitButton = false.obs;
  PhoneController loginField = PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.US, nsn: ''));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  RxString verificationCode = ''.obs;
  RxBool editing = false.obs;
  RxString verifyId = ''.obs;

  void setEditing(bool val) {
    editing.value = val;
  }

  Future<void> login() async {
    submitButton.value = false;
    if (!submitButton.value && formKey.currentState!.validate()) {
      submitButton.value = true;

      if (pageController.page?.toInt() == 1) {
        if (verificationCode.value.length < 6) {
          submitButton.value = false;
          snackBar(error: true, text: 'Code is incorrect');
          return;
        }

        final credential = PhoneAuthProvider.credential(
          verificationId: verifyId.value,
          smsCode: verificationCode.value,
        );

        final UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
        submitButton.value = false;

        if (user.user != null) {
          Get.toNamed('/');
        }
      }

      if (pageController.page?.toInt() == 0) {
        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+${loginField.value.countryCode}${loginField.value.nsn}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            final UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);

            if (user.user != null) {
              Get.toNamed('/');
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            submitButton.value = false;
            snackBar(error: true, text: e.message ?? 'Error auth');
          },
          codeSent: (String verificationId, int? resendToken) async {
            submitButton.value = false;
            verifyId.value = verificationId;
            pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }
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