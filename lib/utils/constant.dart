import '/utils/extension.dart';
import 'package:flutter/material.dart';

const appName = 'HitPal';
const primaryColor = Color(0xFF624AE0);
const dangerColor = Colors.red;
const secondColor = Color(0xFF74747D);
var theme = ThemeData(
    fontFamily: 'SF-Pro-Display-Regular',
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff70E244),
        selectionHandleColor: primaryColor
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: secondColor),
      displayMedium: TextStyle(color: secondColor),
      bodyMedium: TextStyle(color: secondColor),
      titleMedium: TextStyle(color: secondColor),
    ), colorScheme: ColorScheme.fromSwatch(primarySwatch: secondColor.asMaterialColor).copyWith(background: primaryColor)
);
const apiUrl = '';
const loginUrl = '$apiUrl/login/';
const registerUrl = '$apiUrl/register/';
const experienceUrl = '$apiUrl/experiences/';
const profileUrl = '$apiUrl/account/';