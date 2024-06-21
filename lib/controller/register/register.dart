import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';

class RegisterController extends GetxController {
  RxBool submitButton = false.obs;
  RxBool nextButton = false.obs;
  RxBool locationVisible = false.obs;
  RxInt page = 0.obs;
  RxInt age = 0.obs;
  RxString pageStr = '1'.obs;
  RxString gender = ''.obs;
  TextEditingController nameField = TextEditingController();
  TextEditingController locationField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: 13);
  RxList<String> locations = <String>['San Francisco, CA', 'San Pereiro,  GB', 'San Augustinei, AB'].obs;

  Future<void> register() async {
    if (!submitButton.value && formKey.currentState!.validate()) {

    }
  }

  void next() {
    switch (page.value) {
      case 0:
        if (nameField.text != '') {
          pageController.animateToPage(1, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;
          setPage(1);
        }

        break;
      case 1:
        if (gender.value != '') {
          pageController.animateToPage(2, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;
          setPage(2);
        }

        break;
      case 2:
        if (age.value != 0) {
          pageController.animateToPage(3, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;
          setPage(3);
        }

        break;
      case 2:
        if (emailField.text != '') {
          pageController.animateToPage(4, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;
          setPage(4);
        }

        break;
      default:
        break;
    }
  }

  void back() {
    if (page.value > 0) {
      pageController.animateToPage(page.value - 1, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
      nextButton.value = true;
      setPage(page.value - 1);
    } else {
      Get.back();
    }
  }

  void setPage(int val) {
    page.value = val;
    pageStr.value = '${++val}';
  }

  void setAge(int val) {
    age.value = val;
    nextButton.value = true;
  }

  void setGender(String val) {
    gender.value = val;
    nextButton.value = true;
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