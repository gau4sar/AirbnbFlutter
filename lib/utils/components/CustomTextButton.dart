import 'package:airbnb_flutter/utils/custom_styles/CustomTextStyles.dart';
import 'package:flutter/material.dart';
import '../../utils/Colors.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;

  const CustomTextButton(
      {Key? key,
      required this.title,
      this.isLoading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  title,
                  style: CustomTextStyle.normalBold,
                )),
    );
  }
}
