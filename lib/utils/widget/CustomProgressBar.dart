import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressBar extends StatelessWidget {
  const CustomCircularProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
    );
  }
}
