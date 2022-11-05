import 'dart:ui';

import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:flutter/material.dart';

class CustomTextStyle {
  static const TextStyle title2 = TextStyle(
    fontSize: 24,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle title3 = TextStyle(
    fontSize: 20,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 18,
    color: AppColors.blackColor,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle normal = TextStyle(
    fontSize: 16,
    color: AppColors.blackColor,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle normalBold = TextStyle(
    fontSize: 16,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle normalWhiteBold = TextStyle(
    fontSize: 16,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 14,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 16,
    color: AppColors.blackColor,
    fontWeight: FontWeight.normal,
  );
}