import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_picker/models/media_file.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import '../../main.dart';
import '../../model/register/register_level_model.dart';

class RegisterController extends GetxController {
  RxBool submitButton = false.obs;
  RxBool nextButton = false.obs;
  RxBool locationVisible = false.obs;
  RxBool editing = false.obs;
  RxInt page = 0.obs;
  RxInt pageSuccess = 0.obs;
  RxInt age = 22.obs;
  RxInt level = 2.obs;
  RxString pageStr = '1'.obs;
  RxString verificationCode = ''.obs;
  RxString gender = ''.obs;
  final List<RegisterLevelModel> levelsList = [
    RegisterLevelModel(
        title: 'Beginner',
        descr: 'Choose this level if you are just starting out and want to learn the basics of tennis.',
        text: 'Has minimal to no prior tennis experience.',
        text2: 'Focuses on understanding the rules, holding the racket, and practicing basic strokes.',
        text3: 'Engages in easy-paced games aimed at fun and foundational skills development.'
    ),
    RegisterLevelModel(
        title: 'Novice',
        descr: 'Choose this level if you have a basic understanding of tennis but are still learning the ropes.',
        text: 'Has completed 20-50 hours of beginner training.',
        text2: 'Can rally comfortably at a slow speed.',
        text3: 'Focuses on improving fundamental skills like forehand, backhand strokes, and basic serves.'
    ),
    RegisterLevelModel(
        title: 'Intermediate',
        descr: 'Choose this level if you are comfortable with the basics and ready for more challenging play.',
        text: 'Has completed 50-100 hours of novice training.',
        text2: 'Can rally comfortably at a medium speed.',
        text3: 'Open to development in advanced stroke techniques such as serve, slice, and volley.'
    ),
    RegisterLevelModel(
        title: 'Advanced',
        descr: 'Choose this level if you are skilled and experienced, ready for fast-paced games and advanced strategies.',
        text: 'Has completed 100-200 hours of intermediate training.',
        text2: 'Can rally comfortably at high speed with consistency.',
        text3: 'Focuses on advanced techniques such as spin control, powerful serves, and tactical play.'
    ),
    RegisterLevelModel(
        title: 'Competitive',
        descr: 'Choose this level if you play regularly in competitive settings and thrive on high-level competition.',
        text: 'Has completed 200-500 hours of advanced training.',
        text2: 'Can rally at very high speeds with precision.',
        text3: 'Masters complex strategies, various types of serves, and mental game enhancement.'
    ),
    RegisterLevelModel(
        title: 'Champion',
        descr: 'Choose this level if you are a top-tier player with extensive experience and exceptional skills.',
        text: 'Has completed over 500 hours of competitive training.',
        text2: 'Can rally at the highest speeds with exceptional control.',
        text3: 'Focuses on precision, advanced shot techniques, strategic mastery, and maintaining peak physical condition.'
    )
  ];
  TextEditingController nameField = TextEditingController();
  TextEditingController locationField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PageController pageController = PageController(viewportFraction: 1, keepPage: true);
  FixedExtentScrollController scrollController = FixedExtentScrollController(initialItem: 13);
  PhoneController phoneField = PhoneController(initialValue: const PhoneNumber(isoCode: IsoCode.US, nsn: ''));
  RxList<String> locations = <String>['San Francisco, CA', 'San Pereiro,  GB', 'San Augustinei, AB'].obs;
  RxInt count = 60.obs;
  RxString strCount = '60'.obs;
  Timer? timer;
  RxList<MediaFile> singleMedia = <MediaFile>[].obs;

  Future<void> register() async {
    if (!submitButton.value) {
      submitButton.value = true;
      prefs?.setString('token', '1234');
      Get.offAllNamed('/');
      submitButton.value = false;
    }
  }

  Future<void> reSend() async {
    if (count.value == 0 || count.value == 60) {
      submitButton.value = false;
      nextButton.value = false;
      verificationCode.value = '';
      editing.value = false;
      count.value = 60;
      strCount.value = '60';
      startTimer();
    }
  }

  void startTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      count--;

      if (count > 9) {
        strCount.value = '$count';
      } else {
        strCount.value = '0$count';
      }

      if (count.value == 0) {
        timer.cancel();
        nextButton.value = true;
      }
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer!.cancel();
      timer = null;
    }
  }

  Future<void> next() async {
    submitButton.value = true;

    switch (page.value) {
      case 0:
        if (nameField.text != '') {
          pageController.animateToPage(1, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;

          if (pageSuccess.value == 0) {
            pageSuccess++;
          }

          setPage(1);
        }

        break;
      case 1:
        if (gender.value != '') {
          pageController.animateToPage(2, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = true;
          if (pageSuccess.value == 1) {
            pageSuccess++;
          }

          setPage(2);
        }

        break;
      case 2:
        if (age.value != 0) {
          pageController.animateToPage(3, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;
          if (pageSuccess.value == 2) {
            pageSuccess++;
          }

          setPage(3);
        }

        break;
      case 3:
        if (locationField.text != '') {
          pageController.animateToPage(4, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;

          if (pageSuccess.value == 3) {
            pageSuccess++;
          }

          setPage(4);
        }

        break;
      case 4:
        if (emailField.text != '' && EmailValidator.validate(emailField.text)) {
          pageController.animateToPage(5, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = true;

          if (pageSuccess.value == 4) {
            pageSuccess++;
          }

          setPage(5);
        }

        break;
      case 5:
        if (level.value != 0) {
          pageController.animateToPage(6, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;

          if (pageSuccess.value == 5) {
            pageSuccess++;
          }

          setPage(6);
        }

        break;
      case 6:
        if (phoneField.value.nsn != '') {
          pageController.animateToPage(7, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = false;
          await sendCode();

          if (pageSuccess.value == 6) {
            pageSuccess++;
          }

          setPage(7);
        }

        break;
      case 7:
        if (!editing.value && verificationCode.value != '') {
          pageController.animateToPage(8, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
          nextButton.value = true;

          if (pageSuccess.value == 7) {
            pageSuccess++;
          }

          setPage(8);
        }

        break;
      case 8:
        if (nextButton.value) {
          submitButton.value = false;
          await register();
        }

        break;
      default:
        break;
    }

    submitButton.value = false;
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

  Future<void> sendCode() async {
    if (count.value == 60) {
      startTimer();
    }

    if (!submitButton.value && !nextButton.value) {
      submitButton.value = true;
      nextButton.value = true;
      verificationCode.value = '111111';
      submitButton.value = false;
      nextButton.value = false;
    }
  }

  void setPage(int val) {
    page.value = val;
    pageStr.value = '${++val}';
  }

  void setEditing(bool val) {
    editing.value = val;
  }

  void setAge(int val) {
    age.value = val;
    nextButton.value = true;
  }

  void setLevel(int val) {
    level.value = val;
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