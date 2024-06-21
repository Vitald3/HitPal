import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/api_response_model.dart';
import 'constant.dart';

void snackBar({String text = '', String title = '', bool error = false, bool prev = false, Function? callback}) {
  showDialog(context: Get.context!, builder: (_) {
    return CupertinoAlertDialog(
      title: Text(error ? 'Error' : (title != '' ? title : 'Success')),
      actions: [
        if (prev) CupertinoDialogAction(onPressed: () {
          Get.back();
        }, child: const Text('text_cancel', style: TextStyle(color: primaryColor))),
        CupertinoDialogAction(onPressed: () {
          if (callback != null) {
            callback();
          } else {
            Get.back();
          }
        }, child: const Text('OK', style: TextStyle(color: Colors.black))),
      ],
      content: Text(text),
    );
  }).then((value) {
    if (callback != null) {
      callback();
    }
  });
}

ApiResponseModel getApiResponse(ApiResponseModel model) {
  if (model.code != null && model.code! == 401) {
    Get.offAllNamed('/login');
  } else {
    snackBar(error: !model.status, text: model.message ?? 'Error');
  }

  return model;
}